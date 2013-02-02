(*****************************************************************************
 *                                                                           *
 *  This file is part of the UMLCat Component Library.                       *
 *                                                                           *
 *  See the file COPYING.modifiedLGPL.txt, included in this distribution,    *
 *  for details about the copyright.                                         *
 *                                                                           *
 *  This program is distributed in the hope that it will be useful,          *
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of           *
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                     *
 *                                                                           *
 *****************************************************************************
 **)

unit uktansisxmldocs;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,
  uktstrings,
  uktstatestreams,
  uktfilestreams,
  uktansitextstreams,
  uktsrchtypes,
  uktdocs,
  uktscanneroptions,
  uktxmlfileansiscanners,
  uktxmlfiletokens,
  uktxmlfiletreenodetokens,
  uktxmlfileansisymbols,
  ukttreenodes,
  ukttreecntrs,
  uktsxmltreecntrs,
  uktansisxmldocres,
  dummy;

(**
 ** Description:
 ** This unit implements the "Document" Software Design Pattern,
 ** which allows to use a file in an application,
 ** with common features like Opening a file, saving a file.
 **
 ** Examples: Bitmap editor, text or word processor editor,
 ** spreadsheet application.
 **
 ** In this specific case, supports a Simple X.M.L. file.
 **)

type

(* TCustomUKTANSIXMLDocument *)

  TCustomUKTANSIXMLDocument = class(TCustomUKTDocument)
  private
    (* Private declarations *)
  protected
    (* Protected declarations *)

    CurrentNode:   TUKTSXMLTreeNode;
  public
    (* Public declarations *)

    RootNode:      TUKTSXMLTreeNode;
    EncodingNode:  TUKTSXMLTreeNode;
    MainNode:      TUKTSXMLTreeNode;
    EoFNode:       TUKTSXMLTreeNode;

    // provides a filesystem access stream,
    // used by "TextStream"
    FileStream:    TUKTFileStream;

    // provides a text line based stream
    TextStream:    TCustomUKTAnsiTextStream;

    Scanner:       TCustomXMLFileANSIScanner;

    TreeContainer: TCustomUKTSXMLTreeContainer;
  protected
    (* Protected declarations *)

    (* Accesors declarations *)

    procedure setFullPath(const AValue: string); override;
  protected
    (* Protected declarations *)

    procedure InsertEncoding
      (var ASymbol: TXMLFileANSISymbol);

    procedure InsertComment
      (var ASymbol: TXMLFileANSISymbol);

    procedure InsertEoLn
      (var ASymbol: TXMLFileANSISymbol);
    procedure InsertEoPg
      (var ASymbol: TXMLFileANSISymbol);
    procedure InsertEoF
      (var ASymbol: TXMLFileANSISymbol);

    procedure InsertSpace
      (var ASymbol: TXMLFileANSISymbol);
    procedure InsertTab
      (var ASymbol: TXMLFileANSISymbol);

    procedure InsertSingle
      (var ASymbol: TXMLFileANSISymbol);

    procedure InsertText
      (var ASymbol: TXMLFileANSISymbol);

    procedure StartBlock
      (var ASymbol: TXMLFileANSISymbol);
    procedure FinishBlock
      (var ASymbol: TXMLFileANSISymbol);

    procedure ProcessSymbol
      (var ASymbol: TXMLFileANSISymbol);

    procedure InternalNewFile(); override;
    procedure InternalNewAsFile(); override;

    procedure InternalSaveFile(); override;

    procedure InternalOpenFile(); override;
  protected
    (* Protected declarations *)

    procedure GenerateSXML
      (var ANode: TUKTTreeNode;
       const AParam: pointer; const ADirection: TUKTTreeDirection);
  public
    (* Public declarations *)

    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
  public
    (* Public declarations *)

    function CreateRoot(): TUKTSXMLTreeNode;
    procedure GenerateDocument(var AText: string);
  end;

(* TUKTANSIXMLDocument *)

  TUKTANSIXMLDocument = class(TCustomUKTANSIXMLDocument)
  published
    (* published declarations *)

    (* TCustomUKTDocument: *)

    property AskOverwrite;
    property Encoding;
    property ExtNewAs;
    property ExtOpen;
    property ExtSave;
    property ExtSaveAs;
    property HasName;
    property HasEncoding;
    property IsClipboardEmpty;
    property Modified;
    property ReadOnly;
    property FullPath;
    property SearchMode;

    property OnModified;
    property OnPathChanged;
    property OnSearchModeChanged;
    property OnConfirmUser;

    property BeforeNewFile;
    property AfterNewFile;

    property BeforeNewAsFile;
    property AfterNewAsFile;

    property BeforeOpenFile;
    property AfterOpenFile;

    property BeforeSaveFile;
    property AfterSaveFile;

    property BeforeSaveAsFile;
    property AfterSaveAsFile;

    (* TCustomUKTANSIXMLDocument: *)
  end;

implementation

(* TCustomUKTANSIXMLDocument *)

procedure TCustomUKTANSIXMLDocument.setFullPath(const AValue: string);
begin
  FFullPath := AValue;

  if (FileStream <> nil) then
  begin
    FileStream.Path := AValue;
  end;

  DelegateOnPathChanged(AValue);
end;

procedure TCustomUKTANSIXMLDocument.InsertEncoding
  (var ASymbol: TXMLFileANSISymbol);
var ANewNode: TUKTSXMLTreeNode;
begin
  // add child node to non-visual node
  ANewNode :=
    (Self.CurrentNode.Insert() as TUKTSXMLTreeNode);

  ANewNode.CanInsert := false; // < --
  ANewNode.CanEdit   := true;
  ANewNode.CanRemove := true;
  ANewNode.Symbol    := ASymbol;
  ANewNode.TreeToken := uktxmlfiletreenodetokens.xmlfiletrntkEncoding;
  ANewNode.TextValue
    := uktstrings.TrimDelimitersCopy(ASymbol.Text, '<?', '?>');
  ANewNode.Text
    := uktstrings.PadDelimitersCopy(ASymbol.Text, '<?', '?>');
end;

procedure TCustomUKTANSIXMLDocument.InsertComment
  (var ASymbol: TXMLFileANSISymbol);
var ANewNode: TUKTSXMLTreeNode;
begin
  // add child node to non-visual node
  ANewNode :=
    (Self.CurrentNode.Insert() as TUKTSXMLTreeNode);

  ANewNode.CanInsert := false; // < --
  ANewNode.CanEdit   := true;
  ANewNode.CanRemove := true;
  ANewNode.Symbol    := ASymbol;
  ANewNode.TreeToken := uktxmlfiletreenodetokens.xmlfiletrntkComment;

  ANewNode.TextValue
    := uktstrings.TrimDelimitersCopy(ASymbol.Text, '<!--', '-->');
  ANewNode.Text
    := uktstrings.PadDelimitersCopy(ASymbol.Text, '<!--', '-->');
end;

procedure TCustomUKTANSIXMLDocument.InsertEoLn
  (var ASymbol: TXMLFileANSISymbol);
var ANewNode: TUKTSXMLTreeNode;
begin
  // add child node to non-visual node
  ANewNode :=
    (Self.CurrentNode.Insert() as TUKTSXMLTreeNode);

  ANewNode.CanInsert := false; // < --
  ANewNode.CanEdit   := true;
  ANewNode.CanRemove := true;
  ANewNode.Symbol    := ASymbol;
  ANewNode.TreeToken := uktxmlfiletreenodetokens.xmlfiletrntkEoLn;
  ANewNode.TextValue := #13#10;
  ANewNode.Text := '[EoLn]';
end;

procedure TCustomUKTANSIXMLDocument.InsertEoPg
  (var ASymbol: TXMLFileANSISymbol);
var ANewNode: TUKTSXMLTreeNode;
begin
  // add child node to non-visual node
  ANewNode :=
    (Self.CurrentNode.Insert() as TUKTSXMLTreeNode);

  ANewNode.CanInsert := false; // < --
  ANewNode.CanEdit   := true;
  ANewNode.CanRemove := true;
  ANewNode.Symbol    := ASymbol;
  ANewNode.TreeToken := uktxmlfiletreenodetokens.xmlfiletrntkEoLn;
  ANewNode.TextValue := #12;
  ANewNode.Text := '[EoPg]';
end;

procedure TCustomUKTANSIXMLDocument.InsertEoF
  (var ASymbol: TXMLFileANSISymbol);
var ANewNode: TUKTSXMLTreeNode;
begin
  // add child node to non-visual node
  ANewNode :=
    (Self.CurrentNode.Insert() as TUKTSXMLTreeNode);

  ANewNode.CanInsert := false; // < --
  ANewNode.CanEdit   := true;
  ANewNode.CanRemove := true;
  ANewNode.Symbol    := ASymbol;
  ANewNode.TreeToken := uktxmlfiletreenodetokens.xmlfiletrntkEoLn;
  ANewNode.TextValue := #26;
  ANewNode.Text := '[FILEBREAK]';

  // --> check if its "main" node
  if (EoFNode = nil) then
  begin
    EoFNode := ANewNode;
  end;
end;

procedure TCustomUKTANSIXMLDocument.InsertSpace
  (var ASymbol: TXMLFileANSISymbol);
var ANewNode: TUKTSXMLTreeNode;
begin

end;

procedure TCustomUKTANSIXMLDocument.InsertTab
  (var ASymbol: TXMLFileANSISymbol);
var ANewNode: TUKTSXMLTreeNode;
begin
  // add child node to non-visual node
  ANewNode :=
    (Self.CurrentNode.Insert() as TUKTSXMLTreeNode);

  ANewNode.CanInsert := false; // < --
  ANewNode.CanEdit   := true;
  ANewNode.CanRemove := true;
  ANewNode.Symbol    := ASymbol;
  ANewNode.TreeToken := uktxmlfiletreenodetokens.xmlfiletrntkTab;

  ANewNode.TextValue := #9;
  ANewNode.Text := '[TAB]';
end;

procedure TCustomUKTANSIXMLDocument.InsertSingle
  (var ASymbol: TXMLFileANSISymbol);
var ANewNode: TUKTSXMLTreeNode;
begin
  // add child node to non-visual node
  ANewNode :=
    (Self.CurrentNode.Insert() as TUKTSXMLTreeNode);

  ANewNode.CanInsert := false; // < --
  ANewNode.CanEdit   := true;
  ANewNode.CanRemove := true;
  ANewNode.Symbol    := ASymbol;
  ANewNode.TreeToken := uktxmlfiletreenodetokens.xmlfiletrntkSingle;
  ANewNode.TextValue
    := uktstrings.TrimDelimitersCopy(ASymbol.Text, '<', '/>');
  ANewNode.Text
    := uktstrings.PadDelimitersCopy(ASymbol.Text, '<', '/>');
end;

procedure TCustomUKTANSIXMLDocument.InsertText
  (var ASymbol: TXMLFileANSISymbol);
var ANewNode: TUKTSXMLTreeNode;
begin
  ANewNode :=
    (Self.CurrentNode.Insert() as TUKTSXMLTreeNode);

  ANewNode.CanInsert := false; // < --
  ANewNode.CanEdit   := true;
  ANewNode.CanRemove := true;
  ANewNode.Symbol    := ASymbol;
  ANewNode.TreeToken := uktxmlfiletreenodetokens.xmlfiletrntkText;
  ANewNode.TextValue := ASymbol.Text;
  ANewNode.Text      := ASymbol.Text;
end;

procedure TCustomUKTANSIXMLDocument.StartBlock
  (var ASymbol: TXMLFileANSISymbol);
var ANewNode: TUKTSXMLTreeNode;
begin
  // add child node to non-visual node
  ANewNode :=
    (Self.CurrentNode.Insert() as TUKTSXMLTreeNode);

  ANewNode.CanInsert := false; // < --
  ANewNode.CanEdit   := true;
  ANewNode.CanRemove := true;
  ANewNode.Symbol    := ASymbol;
  ANewNode.TreeToken := uktxmlfiletreenodetokens.xmlfiletrntkBlock;
  ANewNode.TextValue
    := uktstrings.TrimDelimitersCopy(ASymbol.Text, '<', '>');
  ANewNode.Text
    := uktstrings.PadDelimitersCopy(ASymbol.Text, '<', '>');

  // --> check if its "main" node
  if (MainNode = nil) then
  begin
    MainNode := ANewNode;
  end;

  // "start" tags move "current" as parent node
  Self.CurrentNode := ANewNode;
end;

procedure TCustomUKTANSIXMLDocument.FinishBlock
  (var ASymbol: TXMLFileANSISymbol);
begin
  // "start" tags move "current" to parent node
  Self.CurrentNode := TUKTSXMLTreeNode(Self.CurrentNode.Parent());
end;

procedure TCustomUKTANSIXMLDocument.ProcessSymbol
  (var ASymbol: TXMLFileANSISymbol);
begin
  // --> there must be a root "document" node,
  // --> at this moment
  case (ASymbol.Token) of
    uktxmlfiletokens.xmlfiletkEoLn:
    begin
      InsertEoLn((* var *) ASymbol);
    end;

    uktxmlfiletokens.xmlfiletkEoPg:
    begin
      InsertEoPg((* var *) ASymbol);
    end;

    uktxmlfiletokens.xmlfiletkEoF:
    begin
      InsertEoF((* var *) ASymbol);
    end;

    uktxmlfiletokens.xmlfiletkSpace:
    begin
      InsertSpace((* var *) ASymbol);
    end;

    uktxmlfiletokens.xmlfiletkTab:
    begin
      InsertTab((* var *) ASymbol);
    end;

    uktxmlfiletokens.xmlfiletkText:
    begin
      InsertText((* var *) ASymbol);
    end;

    uktxmlfiletokens.xmlfiletkEncoding:
    begin
      InsertEncoding((* var *) ASymbol);
    end;
    uktxmlfiletokens.xmlfiletkStart:
    begin
      StartBlock((* var *) ASymbol);
    end;
    uktxmlfiletokens.xmlfiletkFinish:
    begin
      FinishBlock((* var *) ASymbol);
    end;

    uktxmlfiletokens.xmlfiletkSingle:
    begin
      InsertSingle((* var *) ASymbol);
    end;

    uktxmlfiletokens.xmlfiletkBlock:
    begin
      Self.DoNothing();
    end

    else
      begin
      end;
  end;
end;

procedure TCustomUKTANSIXMLDocument.InternalNewFile();
begin
  // --> assign internal fields
  RootNode     := nil;
  inherited InternalNewFile();

  EncodingNode := nil;
  MainNode     := nil;
  EoFNode      := nil;
end;

procedure TCustomUKTANSIXMLDocument.InternalNewAsFile();
var ASymbol: TXMLFileANSISymbol;
begin
  // --> assign internal fields
  FAskOverwrite := FALSE;
  FHasName      := FALSE;

  FSearchIndex := 1;
  FSearchMode  := uktsrchtypes.srrSearch;
  SearchMode   := uktsrchtypes.srrNone;
  // sera actualizado al activar ventana
  // will be updated when window is activated

  FIsClipboardEmpty := TRUE;
  FModified     := FALSE;
  FHasName      := FALSE;
  FReadOnly     := FALSE;
  FHasEncoding  := FALSE;

  FAskOverwrite := FALSE;

  RootNode     := nil;
  EncodingNode := nil;
  MainNode     := nil;
  EoFNode      := nil;

  // update full source path
  FileStream.Path  := Self.FullPath;
  // indicate requested initial state of stream
  FileStream.State := uktstatestreams.ssReset;

  // --> scan or parse file
  if (Scanner.Start()) then
  begin
    // initial assignation, will change
    Self.CurrentNode := TUKTSXMLTreeNode(Self.TreeContainer.Items.Root());

    uktxmlfileansisymbols.Clear((* var *) ASymbol);

    while (Scanner.Next()) do
    begin
      Scanner.ReadCurrentSymbol((* var *) ASymbol);
      ProcessSymbol((* var *) ASymbol);
    end;

    ASymbol.Token := uktxmlfiletokens.xmlfiletkEoF;
    ASymbol.Text  := #26;
    ProcessSymbol((* var *) ASymbol);

    Scanner.Finish();
  end;

  // clear source path, avoiding overwrite
  FullPath := NewFileName(ExtNew);
  FileStream.Path  := Self.FullPath;
end;

procedure TCustomUKTANSIXMLDocument.InternalSaveFile();
var AText: string; TextFile: System.Text;
begin
  AText := '';
  GenerateDocument(AText);

  System.Assign(TextFile, Self.FullPath);
  System.Rewrite(TextFile);

  Write(TextFile, AText);

  System.Close(TextFile);

  // --> assign internal fields
  inherited InternalSaveFile();
end;

procedure TCustomUKTANSIXMLDocument.InternalOpenFile();
var ASymbol: TXMLFileANSISymbol;
begin
  // --> assign internal fields
  RootNode     := nil;
  inherited InternalOpenFile();

  EncodingNode := nil;
  MainNode     := nil;
  EoFNode      := nil;

  // update full source path
  FileStream.Path  := Self.FullPath;
  // indicate requested initial state of stream
  FileStream.State := uktstatestreams.ssReset;

  // --> scan or parse file
  if (Scanner.Start()) then
  begin
    // initial assignation, will change
    Self.CurrentNode := TUKTSXMLTreeNode(Self.TreeContainer.Items.Root());

    uktxmlfileansisymbols.Clear((* var *) ASymbol);

    while (Scanner.Next()) do
    begin
      Scanner.ReadCurrentSymbol((* var *) ASymbol);
      ProcessSymbol((* var *) ASymbol);
    end;

    ASymbol.Token := uktxmlfiletokens.xmlfiletkEoF;
    ASymbol.Text  := #26;
    ProcessSymbol((* var *) ASymbol);

    Scanner.Finish();
  end;
end;

constructor TCustomUKTANSIXMLDocument.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  // provides a filesystem access stream
  FileStream := TUKTFileStream.Create(nil);

  // provides a text line based stream
  TextStream := TCustomUKTAnsiTextStream.Create(nil);
  // assign source & destination to filesystem
  TextStream.Reference := FileStream;

  Scanner  := TCustomXMLFileANSIScanner.Create(nil);

  // assign options
  Scanner.Options().Clear();
  Scanner.Options().EoF      := uktscanneroptions.scnopReturnTag;
  Scanner.Options().EoPg     := uktscanneroptions.scnopReturnTag;
  Scanner.Options().EoLn     := uktscanneroptions.scnopReturnTag;
  Scanner.Options().Tabs     := uktscanneroptions.scnopReturnTag;
  Scanner.Options().Spaces   := uktscanneroptions.scnopReturnTag;
  Scanner.Options().Specials := uktscanneroptions.scnopReturnTag;

  // assign source of text
  Scanner.Stream := TextStream;

  // create tree-container & tree-collection.
  // without any items, no even, root-item
  TreeContainer := TCustomUKTSXMLTreeContainer.Create(nil);
end;

destructor TCustomUKTANSIXMLDocument.Destroy();
begin
  TreeContainer.Free();

  // assign source of text
  Scanner.Stream := nil;

  // assign options
  Scanner.Options().Clear();

  Scanner.Free();

  // assign source & destination to filesystem
  TextStream.Reference := nil;

  // provides a text line based stream
  TextStream.Free();

  // provides a filesystem access stream
  FileStream.Free();

  inherited Destroy();
end;

procedure TCustomUKTANSIXMLDocument.GenerateSXML
(var ANode: TUKTTreeNode;
 const AParam: pointer; const ADirection: TUKTTreeDirection);
var S: PString;
    ASXMLNode: TUKTSXMLTreeNode;
    ATag: TXMLFileTreeNodeToken;
begin
  S := PString(AParam);
  // ...

  ASXMLNode := TUKTSXMLTreeNode(ANode);
  ATag := ASXMLNode.TreeToken;

  if (ADirection = ukttreenodes.tdStart) then
  begin
    case (ATag) of
      uktxmlfiletreenodetokens.xmlfiletrntkEoPg:
        begin
          S^ := S^ + #13#10 + uktstrings.StringOfChar('-', 40) + #13#10;
        end;
      uktxmlfiletreenodetokens.xmlfiletrntkEoLn:
        begin
          S^ := S^ + #13#10;
        end;
      uktxmlfiletreenodetokens.xmlfiletrntkSpace:
        begin
          S^ := S^ + resSharedTagSpace;
        end;
      uktxmlfiletreenodetokens.xmlfiletrntkEncoding:
        begin
          S^ := S^ + '<?' + ASXMLNode.TextValue + '?>';
          //if (ASXMLNode.NewLineAfter) then
          if (ASXMLNode.Selected) then
          begin
            S^ := S^ + #13#10;
          end;
        end;
      uktxmlfiletreenodetokens.xmlfiletrntkBlock:
        begin
          S^ := S^ + '<' + ASXMLNode.TextValue + '>';
          //if (ASXMLNode.NewLineAfter) then
          if (ASXMLNode.Selected) then
          begin
            S^ := S^ + #13#10;
          end;
        end;
      uktxmlfiletreenodetokens.xmlfiletrntkSingle:
        begin
          S^ := S^ + '<' + ASXMLNode.TextValue + '>';
          //if (ASXMLNode.NewLineAfter) then
          if (ASXMLNode.Selected) then
          begin
            S^ := S^ + #13#10;
          end;
        end;
      uktxmlfiletreenodetokens.xmlfiletrntkText:
        begin
          S^ := S^ + ASXMLNode.TextValue;
        end;
      uktxmlfiletreenodetokens.xmlfiletrntkComment:
        begin
          S^ := S^ + ASXMLNode.TextValue;
        end;
      uktxmlfiletreenodetokens.xmlfiletrntkEoF:
        begin
          Self.DoNothing();
        end;
    end;
  end else if
    (ATag = uktxmlfiletreenodetokens.xmlfiletrntkBlock) then
  begin
    S^ := S^ + '</' + ASXMLNode.TextValue + '>';

    (*
    //if (ASXMLNode.NewLineAfter) then
    if (ASXMLNode.Selected) then
    begin
      S^ := S^ + #13#10;
    end;
    *)
  end;
end;

function TCustomUKTANSIXMLDocument.CreateRoot(): TUKTSXMLTreeNode;
begin
  Result := nil;

    Self.RootNode :=
       TUKTSXMLTreeNode(Self.TreeContainer.Items.InsertRoot());

    Self.CurrentNode := Self.RootNode;

  Result := Self.RootNode;
end;

procedure TCustomUKTANSIXMLDocument.GenerateDocument(var AText: string);
begin
  AText := '';

  {$ifdef Delphi}
  TreeContainer.Items.Root().ForBoth(GenerateSXML, @AText);
  {$endif}

  {$ifdef FPC}
  TreeContainer.Items.Root().ForBoth(@GenerateSXML, @AText);
  {$endif}
end;


end.

