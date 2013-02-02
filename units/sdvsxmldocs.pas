unit sdvsxmldocs;

{$mode objfpc}{$H+}

interface

uses
  // ##temp {
  Crt, sdvStrings,
  // ##temp }
  Classes, SysUtils,
  sdvnormobjects, sdvKeyTypeValues, sdvLists, sdvRecLists,
  sdvTreenodes, sdvTreeContainers,
  sdvsxmltreenodes,
  sdvXMLFileTokens, xmlfileAnsiSymbols, xmlfileAnsiScanners,
  dummy;

type

{ TSDVSimpleXMLDocumentBase }

  TSDVSimpleXMLDocumentBase = class(TCustomSDVTreeContainer)
  private
    { Private declarations }
  protected
    { Protected declarations }

    RootNode, CurrentNode, NewNode: TSDVSXMLTreeNode;

    function InternalCreateCollection: TSDVContainerTreeCollection; override;

    function getItems: TCustomSDVSXMLTreeCollection;
    procedure setItems(const Value: TCustomSDVSXMLTreeCollection);
  public
    { Public declarations }

    destructor Destroy(); override;

    property Items: TCustomSDVSXMLTreeCollection
      read getItems write setItems;
  end;

{ TSDVSimpleXMLDocument }

  TSDVSimpleXMLDocument = class(TSDVSimpleXMLDocumentBase)
  private
    { Private declarations }
  protected
    { Protected declarations }

    //RootNode, CurrentNode, NewNode: TSDVSXMLTreeNode;
    //PairCurrentKey, PairCurrentValue: string;

    //XMLCurrentDataType: TXMLDataTypes;

    BackupSymbols: TSDVRecordList;

    _Scanner: TCustomXMLFileANSIScanner;
  public
    { Public declarations }

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure ProcessStart(var Symbol: TXMLFileAnsiSymbol);
    procedure ProcessFinish(var Symbol: TXMLFileAnsiSymbol);
    procedure ProcessText(var Symbol: TXMLFileAnsiSymbol);

    procedure BackupSymbol(var Symbol: TXMLFileAnsiSymbol);

    procedure RestoreSymbols(var Symbol: TXMLFileAnsiSymbol);

    procedure ProcessRootSymbol(var Symbol: TXMLFileAnsiSymbol);

    procedure ProcessSymbol(var Symbol: TXMLFileAnsiSymbol);
    procedure InsertSymbol(var Symbol: TXMLFileAnsiSymbol);

    procedure ShowNode
      (var Node: TSDVTreeNode; const Param: pointer;
      const Direction: TSDVTreeDirection);

    procedure DisplayAsSXML;
    procedure Execute;

    property Scanner: TCustomXMLFileANSIScanner
      read _Scanner write _Scanner;
  end;

implementation

{ TSDVSimpleXMLDocumentBase }

function TSDVSimpleXMLDocumentBase.InternalCreateCollection: TSDVContainerTreeCollection;
begin
  Result := TCustomSDVSXMLTreeCollection.Create();
end;

function TSDVSimpleXMLDocumentBase.getItems: TCustomSDVSXMLTreeCollection;
begin
  Result := TCustomSDVSXMLTreeCollection(FInternalItems);
end;

procedure TSDVSimpleXMLDocumentBase.setItems
 (const Value: TCustomSDVSXMLTreeCollection);
begin
  FInternalItems := Value;
end;

destructor TSDVSimpleXMLDocumentBase.Destroy();
begin
  inherited Destroy();
end;

constructor TSDVSimpleXMLDocument.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  BackupSymbols := TSDVRecordList.Create;
  BackupSymbols.RecordSize := SizeOf(TXMLFileAnsiSymbol);
end;

destructor TSDVSimpleXMLDocument.Destroy;
begin
  BackupSymbols.Empty;
  BackupSymbols.Free;
  inherited Destroy();
end;

procedure TSDVSimpleXMLDocument.ProcessStart
(var Symbol: TXMLFileAnsiSymbol);
begin
  //WriteLn('<', Symbol.Text, '>');

  // --> IMPORTANT: "Start" token becomes "block" in a tree,
  // --> and "finish"  node is discarded
  Symbol.Token:= xmlfiletkBlock;

  // add symbol as child node of current node
  NewNode := (Items.Insert(CurrentNode) as TSDVSXMLTreeNode);
  NewNode.Symbol:= Symbol;

  // since its a tag to start block,
  // new symbol become current node
  CurrentNode := NewNode;
end;

procedure TSDVSimpleXMLDocument.ProcessFinish
(var Symbol: TXMLFileAnsiSymbol);
begin
  //WriteLn('</', Symbol.Text, '>');

  // --> IMPORTANT: "Start" token becomes "block" in a tree,
  // --> and "finish"  node is discarded

  // since its a closing block tag,
  // current node should return to parent tnode
  CurrentNode := (CurrentNode.Parent as TSDVSXMLTreeNode);
end;

procedure TSDVSimpleXMLDocument.ProcessText
(var Symbol: TXMLFileAnsiSymbol);
var S: string;
begin
  S := sdvStrings.RemoveCharCopy(Symbol.Text, #9);
  sdvStrings.Trim(S);
  if (S <> '') then
  begin
    Symbol.Text := S;
    //WriteLn('Text: "', Symbol.Text, '"');
    NewNode := Items.Insert(CurrentNode) as TSDVSXMLTreeNode;
    NewNode.Symbol:= Symbol;
    // --> texto no mueve apuntador a "CurrentNode"
  end;
end;

procedure TSDVSimpleXMLDocument.BackupSymbol(var Symbol: TXMLFileAnsiSymbol);
var Item: PXMLFileAnsiSymbol;
begin
  Item := BackupSymbols.Insert;
  Item^ := Symbol;
end;

procedure TSDVSimpleXMLDocument.RestoreSymbols(var Symbol: TXMLFileAnsiSymbol);
var I, L: Integer; TempSymbol: PXMLFileAnsiSymbol;
begin
  L := (BackupSymbols.Count - 1);
  for I := 0 to L do
  begin
    TempSymbol := PXMLFileAnsiSymbol(BackupSymbols.Items[I]);

    NewNode := (Items.InsertAt(RootNode, 0) as TSDVSXMLTreeNode);
    NewNode.Symbol:= TempSymbol^;
  end;
end;

procedure TSDVSimpleXMLDocument.ProcessRootSymbol(var Symbol: TXMLFileAnsiSymbol);
begin
  //WriteLn('<', Symbol.Text, '>');

  // --> IMPORTANT: "Start" token becomes "block" in a tree,
  // --> and "finish"  node is discarded
  Symbol.Token:= xmlfiletkBlock;

  NewNode := Items.InsertRoot() as TSDVSXMLTreeNode;
  NewNode.Symbol:= Symbol;
  RootNode := NewNode;
  CurrentNode := NewNode;
  //CurrentDataType := xmldtElse;
end;

procedure TSDVSimpleXMLDocument.ProcessSymbol(var Symbol: TXMLFileAnsiSymbol);
begin
  if (RootNode = nil) then
  begin
    case (Symbol.Token) of
      xmlfiletkEoPg:     BackupSymbol(Symbol);
      xmlfiletkEoLn:     BackupSymbol(Symbol);
      xmlfiletkSpace:    BackupSymbol(Symbol);
      xmlfiletkComment:  BackupSymbol(Symbol);
      xmlfiletkEncoding: BackupSymbol(Symbol);
      else ProcessRootSymbol(Symbol);
    end; // case
  end else
  begin
    case (Symbol.Token) of
      xmlfiletkEoPg:   RestoreSymbols(Symbol);
      xmlfiletkText:   ProcessText(Symbol);
      xmlfiletkStart:  ProcessStart(Symbol);
      xmlfiletkFinish: ProcessFinish(Symbol);
      else             InsertSymbol(Symbol);
    end; // case
  end;
end;

procedure TSDVSimpleXMLDocument.InsertSymbol(var Symbol: TXMLFileAnsiSymbol);
begin
  //WriteLn('Text: "', Symbol.Text, '"');
  NewNode := Items.Insert(CurrentNode) as TSDVSXMLTreeNode;
  NewNode.Symbol:= Symbol;
  CurrentNode := NewNode;
end;

procedure TSDVSimpleXMLDocument.ShowNode
 (var Node: TSDVTreeNode; const Param: pointer;
   const Direction: TSDVTreeDirection);
var S: string; EachNode: TSDVSXMLTreeNode;
var F: ^Text;
begin
  F := Param;

  EachNode := TSDVSXMLTreeNode(Node);

  if (Direction = tdStart) then
  begin
    S := sdvStrings.StringOfChar(' ', (EachNode.Level + 1) * 2);
    Write(F^, S);

    S := EachNode.Symbol.Text;
    case (EachNode.Symbol.Token) of
      xmlfiletkEoF:    None();
      xmlfiletkEoPg:   None();
      xmlfiletkEoLn:   None();

      (*
      xmlfiletkStart:  S := '<' + S + '>';
      xmlfiletkFinish: S := '</' + S + '>';
      *)

      xmlfiletkBlock:  S := '<' + S + '>';
      else ;
    end;

    WriteLn(F^, S);
      //ReadLn();
  end else
  begin
    if (EachNode.Symbol.Token = xmlfiletkBlock) then
    begin
      S := sdvStrings.StringOfChar(' ', (EachNode.Level + 1) * 2);
      Write(F^, S);

      S := '</' + EachNode.Symbol.Text + '>';
      WriteLn(F^, S);
        //ReadLn();
    end;
  end;
end;

procedure TSDVSimpleXMLDocument.DisplayAsSXML;
var F: Text;
begin
  System.Assign(F, 'c:\debug.xml');
  System.Rewrite(F);

  ClrScr;
  Items.ForBoth(@ShowNode, @F);

  System.Close(F);
end;

procedure TSDVSimpleXMLDocument.Execute;
var Symbol: TXMLFileAnsiSymbol;
begin
  if (Scanner <> nil) then
  begin
    if (Scanner.Start()) then
    while (Scanner.Next()) do
    begin
      Symbol := Scanner.CurrentSymbol;
      ProcessSymbol(Symbol);
    end; // while
    Scanner.Finish();

    //RestoreSymbols(Symbol);
  end;
end;

end.

