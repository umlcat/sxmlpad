unit ufrmmain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics,
  Dialogs, ComCtrls,
  Menus, ExtCtrls, ActnList, StdCtrls,
  contnrs,
  uktstrings,
  uktmsgdlgtypes,
  uktmsgdlgs,
  uktmsgdlgsmemos,
  uktinputdlgs,
  uktonlystringkeyvaluelists,
  uktmsgtypes,
  ukttreenodes,
  ukttreecntrs,
  uktpaneltreeviews,
  uktmsgpaneltreeviews,
  uktonlystringkeyvalueinputdlgs,
  uktfilefilters,
  uktdocs,
  uktfilestreams,
  uktansitextstreams,
  uktscanneroptions,
  uktxmlfileansiscanners,
  uktxmlfiletokens,
  uktxmlfileansisymbols,
  uktsxmltreecntrs,
  uktxmlfiletreenodetokens,
  uktansisxmldocres,
  uktansisxmldocs,
  uktsxmlfileexts,
  uktsxmlpaneltreeviews,
  uktsrchtypes, uktsrchtxtdlgs,
  udmMainShared,
  uresmain,
  dummy;

const
  DefaultToolBarHeight = 26;

type

  { Tfrmmain }

  Tfrmmain = class(TForm)
    acEditCopy: TAction;
    acEditCut: TAction;
    acEditPaste: TAction;
    acEditRedo: TAction;
    acEditUndo: TAction;
    acFileClose: TAction;
    acFileExit: TAction;
    acFileNew: TAction;
    acFileOpen: TAction;
    acFileSave: TAction;
    acFileSaveAs: TAction;
    acSearchFind: TAction;
    acSearchReplace: TAction;
    acFileNewAs: TAction;
    acFileSaveRename: TAction;
    acSearchFindAgain: TAction;
    acSearchReplaceAgain: TAction;
    acFileOptions: TAction;
    acFileSavePreview: TAction;
    acEditDuplicate: TAction;
    acEditClearClipboard: TAction;
    acFileSaveCopyAs: TAction;
    acMainDivisor: TAction;
    acEditSelectAll: TAction;
    acEditSelectNone: TAction;
    acHelpAbout: TAction;
    acTagsNewBlockTag: TAction;
    acTagsNewSingleTag: TAction;
    acTagsNewCommentTag: TAction;
    acTagsNewTextTag: TAction;
    acViewFontSizeReduce: TAction;
    acViewFontSizeIncrease: TAction;
    acViewToggleAddressbar: TAction;
    acViewToogleToolBarQuick: TAction;
    acToolsTreeviewItemInsertAfter: TAction;
    acToolsTreeviewItemInsertBefore: TAction;
    acToolsTreeviewItemInsertLast: TAction;
    acViewToolBarsConfigure: TAction;
    acToolsExportPreview: TAction;
    acViewToggleToolBarEditSearch: TAction;
    acViewToggleToolBarTreeview: TAction;
    acViewToggleToolBarFile: TAction;
    acToolsTreeviewItemSelectOff: TAction;
    acToolsTreeviewItemSelectOn: TAction;
    acViewToogleMode: TAction;
    acToolsTreeviewCollapse: TAction;
    acToolsTreeviewEmpty: TAction;
    acToolsTreeviewExpand: TAction;
    acToolsTreeviewExplore: TAction;
    acToolsTreeviewItemDelete: TAction;
    acToolsTreeviewItemProperties: TAction;
    acViewToggleToolBars: TAction;
    AddressEdit: TEdit;
    FileExitToolButton: TToolButton;
    FileNewToolButton: TToolButton;
    FileToolBar: TToolBar;
    AddressLabel: TLabel;
    MainActionList: TActionList;
    MainMenuBar: TMainMenu;
    ClientPanel: TPanel;
    MenuItem12: TMenuItem;
    miTagsNewTextTag: TMenuItem;
    miTagsNewCommentTag: TMenuItem;
    miTagsNewSingleTag: TMenuItem;
    miTagsNewBlockTag: TMenuItem;
    miMainTags: TMenuItem;
    miHelpAbout: TMenuItem;
    miMainHelp: TMenuItem;
    miViewFontSizeReduce: TMenuItem;
    miViewFontSizeIncrease: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    miViewToggleAddressbar: TMenuItem;
    miEditSelectNone: TMenuItem;
    miEditSelectAll: TMenuItem;
    miToolsTreeviewItemInsertAfter: TMenuItem;
    miToolsTreeviewItemProperties: TMenuItem;
    miToolsTreeviewItemInsertBefore: TMenuItem;
    miToolsTreeviewItemInsertLast: TMenuItem;
    miToolsTreeviewItemDelete: TMenuItem;
    MenuItem21: TMenuItem;
    miToolsTreeviewItemSelectOn: TMenuItem;
    miToolsTreeviewItemSelectOff: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem16: TMenuItem;
    miToolsTreeviewCollapse: TMenuItem;
    miToolsTreeviewEmpty: TMenuItem;
    miToolsTreeviewExpand: TMenuItem;
    miToolsTreeviewExplore: TMenuItem;
    miMainTreeview: TMenuItem;
    MenuItem6: TMenuItem;
    miViewToolBarQuick: TMenuItem;
    miViewToolBarTreeview: TMenuItem;
    miViewToolBarEditSearch: TMenuItem;
    miViewToolBarsConfigure: TMenuItem;
    miViewToolBarFile: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    miFileSaveCopyAs: TMenuItem;
    miEditClearClipboard: TMenuItem;
    miEditDuplicate: TMenuItem;
    miFileSavePreview: TMenuItem;
    miToolsExportPreview: TMenuItem;
    MenuItem3: TMenuItem;
    miFileProperties: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    miSearchReplaceAgain: TMenuItem;
    miFileNewAs: TMenuItem;
    miFileSaveRename: TMenuItem;
    opdlgOpenDialog: TOpenDialog;
    opdlgNewAsDialog: TOpenDialog;
    AddressPanel: TPanel;
    svdlgSaveDialog: TSaveDialog;
    tbToolsTreeviewCollapse: TToolButton;
    tbToolsTreeviewEmpty: TToolButton;
    tbToolsTreeviewExpand: TToolButton;
    tbToolsTreeviewExplore: TToolButton;
    tbToolsTreeviewItemDelete: TToolButton;
    tbToolsTreeviewItemProperties: TToolButton;
    EditSearchToolBar: TToolBar;
    QuickToolBar: TToolBar;
    TagsToolBar: TToolBar;
    ToolBarsPanel: TPanel;
    tbFileNewAs: TToolButton;
    tbFileNewQK: TToolButton;
    acFileOpenQK: TToolButton;
    acFileSaveQK: TToolButton;
    acEditCutQK: TToolButton;
    acEditCopyQK: TToolButton;
    acEditPasteQK: TToolButton;
    acEditUndoQK: TToolButton;
    acEditRedoQK: TToolButton;
    tbSearchReplace: TToolButton;
    tbSearchReplaceAgain: TToolButton;
    tbSearchReplaceQK: TToolButton;
    tbFileSaveAsQK: TToolButton;
    tbTagsNewBlockTag: TToolButton;
    tbTagsNewSingleTag: TToolButton;
    tbTagsNewCommentTag: TToolButton;
    tbTagsNewTextTag: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    acFileExitQK: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    tbFileOpen: TToolButton;
    tbFileSave: TToolButton;
    ToolButton19: TToolButton;
    acSearchReplaceAgainQK: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    ToolButton27: TToolButton;
    ToolButton28: TToolButton;
    ToolButton29: TToolButton;
    ToolButton3: TToolButton;
    tbFileSaveAs: TToolButton;
    tbFileSaveRename: TToolButton;
    tbToolsTreeviewItemSelectOn: TToolButton;
    tbToolsTreeviewItemSelectOff: TToolButton;
    tbFileOptions: TToolButton;
    tbEditCut: TToolButton;
    tbEditCopy: TToolButton;
    tbEditPaste: TToolButton;
    tbSearchFind: TToolButton;
    tbSearchFindAgain: TToolButton;
    tbFileSavePreview: TToolButton;
    tbToolsTreeviewItemInsertBefore: TToolButton;
    tbToolsTreeviewItemInsertAfter: TToolButton;
    tbToolsTreeviewItemInsertLast: TToolButton;
    tbEditDuplicate: TToolButton;
    tbEditClearClipboard: TToolButton;
    ToolButton30: TToolButton;
    TopPanel: TPanel;
    MainStatusBar: TStatusBar;
    miFileOpen: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    miFileExit: TMenuItem;
    miFileNew: TMenuItem;
    miFileClose: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem7: TMenuItem;
    miFileSave: TMenuItem;
    miFileSaveAs: TMenuItem;
    miEditCopy: TMenuItem;
    miEditCut: TMenuItem;
    miEditPaste: TMenuItem;
    miEditRedo: TMenuItem;
    miEditUndo: TMenuItem;
    miMainEdit: TMenuItem;
    miMainFile: TMenuItem;
    miMainSearch: TMenuItem;
    miMainTools: TMenuItem;
    miMainView: TMenuItem;
    miSearchFind: TMenuItem;
    miSearchReplace: TMenuItem;
    MainPanel: TPanel;
    TreeviewToolBar: TToolBar;
    procedure acEditClearClipboardExecute(Sender: TObject);
    procedure acEditCopyExecute(Sender: TObject);
    procedure acEditCutExecute(Sender: TObject);
    procedure acEditDuplicateExecute(Sender: TObject);
    procedure acEditPasteExecute(Sender: TObject);
    procedure acEditRedoExecute(Sender: TObject);
    procedure acEditSelectAllExecute(Sender: TObject);
    procedure acEditSelectNoneExecute(Sender: TObject);
    procedure acEditUndoExecute(Sender: TObject);
    procedure acFileCloseAllExecute(Sender: TObject);
    procedure acFileCloseExecute(Sender: TObject);
    procedure acFileExitExecute(Sender: TObject);
    procedure acFileNewAsExecute(Sender: TObject);
    procedure acFileNewExecute(Sender: TObject);
    procedure acFileOpenExecute(Sender: TObject);
    procedure acFileOptionsExecute(Sender: TObject);
    procedure acFileSaveAsExecute(Sender: TObject);
    procedure acFileSaveCopyAsExecute(Sender: TObject);
    procedure acFileSaveExecute(Sender: TObject);
    procedure acFileSavePreviewExecute(Sender: TObject);
    procedure acFileSaveRenameExecute(Sender: TObject);
    procedure acHelpAboutExecute(Sender: TObject);
    procedure acSearchFindAgainExecute(Sender: TObject);
    procedure acSearchFindExecute(Sender: TObject);
    procedure acSearchReplaceAgainExecute(Sender: TObject);
    procedure acSearchReplaceExecute(Sender: TObject);
    procedure acTagsNewBlockTagExecute(Sender: TObject);
    procedure acTagsNewCommentTagExecute(Sender: TObject);
    procedure acTagsNewSingleTagExecute(Sender: TObject);
    procedure acTagsNewTextTagExecute(Sender: TObject);
    procedure acToolsExportPreviewExecute(Sender: TObject);
    procedure acToolsTreeviewCollapseExecute(Sender: TObject);
    procedure acToolsTreeviewEmptyExecute(Sender: TObject);
    procedure acToolsTreeviewExpandExecute(Sender: TObject);
    procedure acToolsTreeviewExploreExecute(Sender: TObject);
    procedure acToolsTreeviewItemDeleteExecute(Sender: TObject);
    procedure acToolsTreeviewItemInsertAfterExecute(Sender: TObject);
    procedure acToolsTreeviewItemInsertBeforeExecute(Sender: TObject);
    procedure acToolsTreeviewItemInsertLastExecute(Sender: TObject);
    procedure acToolsTreeviewItemPropertiesExecute(Sender: TObject);
    procedure acToolsTreeviewItemSelectOffExecute(Sender: TObject);
    procedure acToolsTreeviewItemSelectOnExecute(Sender: TObject);
    procedure acViewFontSizeIncreaseExecute(Sender: TObject);
    procedure acViewFontSizeReduceExecute(Sender: TObject);
    procedure acViewToggleAddressbarExecute(Sender: TObject);
    procedure acViewToggleToolBarsExecute(Sender: TObject);
    procedure acViewToogleModeExecute(Sender: TObject);
    procedure acViewToggleToolBarEditSearchExecute(Sender: TObject);
    procedure acViewToggleToolBarFileExecute(Sender: TObject);
    procedure acViewToogleToolBarQuickExecute(Sender: TObject);
    procedure acViewToolBarsConfigureExecute(Sender: TObject);
    procedure acViewToggleToolBarTreeviewExecute(Sender: TObject);
    procedure AnyToolButtonMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  protected
    { protected declarations }

    BeenActivated: boolean;
  protected
    { protected declarations }

    ToolBars: TFPObjectList;

    MainTreeview:  TCustomUKTSXMLPanelTreeView;

    SharedFileFilters: TCustomUKTFileFiltersContainer;
    NewAsFileFilters:  TCustomUKTFileFiltersContainer;

    Document:      TCustomUKTANSIXMLDocument;

    srchdlgSearch:  TUKTSearchTextDialog;
    srchdlgReplace: TUKTReplaceTextDialog;

    ClipboardSourceRootContainerNode: TUKTTreeNode;
    ClipboardDestRootContainerNode:   TUKTTreeNode;
  protected
    { protected declarations }

    procedure PreparePlainNewDocument();
  protected
    { protected declarations }

    // document-manager event-handlers
    // @to-do: assign in design-time,
    // once runtime packages are finished
    function DocumentBeforeNewFile(Sender: TObject): Boolean;
    procedure DocumentAfterNewFile(Sender: TObject);

    function DocumentBeforeNewAsFile(Sender: TObject): Boolean;
    procedure DocumentAfterNewAsFile(Sender: TObject);

    function DocumentBeforeOpenFile(Sender: TObject): Boolean;
    procedure DocumentAfterOpenFile(Sender: TObject);

    procedure DocumentAfterSaveFile(Sender: TObject);
  public
    { public declarations }

    procedure FormShowFirstTime(Sender: TObject);
    procedure FormShowAgain(Sender: TObject);
  public
    { public declarations }

    procedure ClipBoardClear();

    function HeightOfToolBars(): Integer;
    procedure ResizeToolBars();
    procedure ResizeTopPanel();

    procedure PrepareToolBars();
    procedure PrepareToolPanel();

    procedure PrepareFileFilters();
    procedure PrepareDialogs();

    procedure PrepareDocumentManager();
    procedure PrepareTreeview();

    procedure PrepareResourcesMenuBar();
    procedure PrepareResourcesOther();
    procedure PrepareResources();

    procedure RebuiltTreeview();

    function NewNode
      (var AParentNode: TUKTSXMLTreeNode): TUKTSXMLTreeNode;

    function CaptureSingle
      (const IsInsertion: Boolean; var AText: string): Boolean;
    function CaptureBlock
      (const IsInsertion: Boolean; var AText: string): Boolean;
    function CaptureComment
      (const IsInsertion: Boolean; var AText: string): Boolean;
    function CaptureText
      (const IsInsertion: Boolean; var AText: string): Boolean;

    procedure InsertSpaceAt
      (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
       AContainerParentNode: TUKTSXMLTreeNode;
       AIndex: Integer);

    procedure InsertTabAt
      (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
       AContainerParentNode: TUKTSXMLTreeNode;
       AIndex: Integer);

    procedure InsertEoLnAt
      (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
       AContainerParentNode: TUKTSXMLTreeNode;
       AIndex: Integer);

    procedure InsertEoPgAt
      (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
       AContainerParentNode: TUKTSXMLTreeNode;
       AIndex: Integer);

    procedure InsertCommentAt
      (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
       AContainerParentNode: TUKTSXMLTreeNode;
       AIndex: Integer);

    procedure InsertTextAt
      (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
       AContainerParentNode: TUKTSXMLTreeNode;
       AIndex: Integer);

    procedure InsertSingleAt
      (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
       AContainerParentNode: TUKTSXMLTreeNode;
       AIndex: Integer);

    procedure InsertBlockAt
      (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
       AContainerParentNode: TUKTSXMLTreeNode;
       AIndex: Integer);

    procedure InsertSpace
      (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
       AContainerParentNode: TUKTSXMLTreeNode);

    procedure InsertTab
      (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
       AContainerParentNode: TUKTSXMLTreeNode);

    procedure InsertEoPg
      (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
       AContainerParentNode: TUKTSXMLTreeNode);

    procedure InsertEoLn
      (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
       AContainerParentNode: TUKTSXMLTreeNode);

    procedure InsertComment
      (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
       AContainerParentNode: TUKTSXMLTreeNode);

    procedure InsertText
      (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
       AContainerParentNode: TUKTSXMLTreeNode);

    procedure InsertSingle
      (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
       AContainerParentNode: TUKTSXMLTreeNode);

    procedure InsertBlock
      (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
       AContainerParentNode: TUKTSXMLTreeNode);

    function GetOptions(): TUKTOnlyStringKeyValueList;

    function SelectOptions
      (var EachOption: TXMLFileTreeNodeToken): Boolean;

    procedure SelectInsertAtOption
      (APanelParentNode: TUKTMsgPanelTreeViewNode;
       AParentNode: TUKTSXMLTreeNode;
       EachOption: TXMLFileTreeNodeToken;
       AIndex: Integer);

    procedure SelectInsertOption
      (APanelParentNode: TUKTMsgPanelTreeViewNode;
       AParentNode: TUKTSXMLTreeNode;
       EachOption: TXMLFileTreeNodeToken);

    procedure EditText
      (APanelNode: TUKTMsgPanelTreeViewNode;
       AContainerNode: TUKTSXMLTreeNode);

    procedure EditComment
      (APanelNode: TUKTMsgPanelTreeViewNode;
       AContainerNode: TUKTSXMLTreeNode);

    procedure EditBlock
      (APanelNode: TUKTMsgPanelTreeViewNode;
       AContainerNode: TUKTSXMLTreeNode);

    procedure EditSingle
      (APanelNode: TUKTMsgPanelTreeViewNode;
       AContainerNode: TUKTSXMLTreeNode);

    procedure SelectEditOption
      (APanelNode: TUKTMsgPanelTreeViewNode;
       AContainerNode: TUKTSXMLTreeNode);

    function RetrieveFocused
      (var ATreeviewNode: TUKTMsgPanelTreeViewNode;
       var AContainerNode: TUKTSXMLTreeNode): Boolean;

    function RetrieveFocusedParent
      (var ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
       var AContainerParentNode: TUKTSXMLTreeNode): Boolean;

    function RetrieveFocusedAndParent
      (var ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
       var ATreeviewNode: TUKTMsgPanelTreeViewNode;
       var AContainerParentNode: TUKTSXMLTreeNode;
       var AContainerNode: TUKTSXMLTreeNode
       ): Boolean;

    function MarkClipboardSource(): Boolean;
    function MarkClipboardDest(): Boolean;
  end;

var
  frmmain: Tfrmmain;

implementation

{$R *.lfm}

{ Tfrmmain }

procedure Tfrmmain.acFileNewExecute(Sender: TObject);
begin
  Document.NewFile();
end;

procedure Tfrmmain.acFileCloseExecute(Sender: TObject);
begin
  //
end;

procedure Tfrmmain.acFileExitExecute(Sender: TObject);
begin
  if (Document.Modified) then
  begin
    Document.SaveFile();
  end;
  Self.Close();
end;

procedure Tfrmmain.acFileNewAsExecute(Sender: TObject);
var AFullPath: string;
begin
  if (opdlgNewAsDialog.Execute()) then
  begin
    AFullPath := opdlgNewAsDialog.FileName;
    Document.FullPath:=AFullPath;
    Document.NewAsFile();
  end;
end;

procedure Tfrmmain.acFileCloseAllExecute(Sender: TObject);
begin
  //
end;

procedure Tfrmmain.acEditUndoExecute(Sender: TObject);
begin
  //
end;

procedure Tfrmmain.acEditRedoExecute(Sender: TObject);
begin
  //
end;

procedure Tfrmmain.acEditSelectAllExecute(Sender: TObject);
begin
  //
end;

procedure Tfrmmain.acEditSelectNoneExecute(Sender: TObject);
begin
  //
end;

procedure Tfrmmain.acEditCutExecute(Sender: TObject);
var CanCut: Boolean;
begin
  CanCut := MarkClipboardSource();
    //(MarkClipboardSource() and
     //(not Self.FClipboardSourceRootContainerNode.IsRoot()));

  if (CanCut) then
  begin
    // ...
  end;
end;

procedure Tfrmmain.acEditDuplicateExecute(Sender: TObject);
var CanDuplicate: Boolean;
begin
  CanDuplicate := MarkClipboardDest() ;

   (*
   ( (Self.ClipboardSourceRootContainerNode <> nil) and
     MarkClipboardDest()
   );
   *)

  if (CanDuplicate) then
  begin
    // the duplication starts with he already assigned
    // destination parent node
    ClipboardSourceRootContainerNode.DuplicateTo
      (ClipboardDestRootContainerNode);
  end;
end;

procedure Tfrmmain.acEditPasteExecute(Sender: TObject);
var CanPaste: Boolean;
begin
  // @to-do: evitar recursividad
  CanPaste :=
    ( (Self.ClipboardSourceRootContainerNode <> nil) and
      MarkClipboardDest()
    );
  if (CanPaste) then
  begin
    // the duplication starts with he already assigned
    // destination parent node
    ClipboardSourceRootContainerNode.DuplicateTo
      (ClipboardDestRootContainerNode);
  end;
end;

procedure Tfrmmain.acEditCopyExecute(Sender: TObject);
begin
  MarkClipboardSource();
end;

procedure Tfrmmain.acEditClearClipboardExecute(Sender: TObject);
begin
  ClipBoardClear();
end;

procedure Tfrmmain.acFileOpenExecute(Sender: TObject);
var AFullPath: string;
begin
  if (opdlgOpenDialog.Execute()) then
  begin
    AFullPath := opdlgOpenDialog.FileName;
    Document.FullPath:=AFullPath;
    Document.OpenFile();
  end;
end;

procedure Tfrmmain.acFileOptionsExecute(Sender: TObject);
begin
  //
end;

procedure Tfrmmain.acFileSaveAsExecute(Sender: TObject);
var APath: string;
begin
  if (svdlgSaveDialog.Execute()) then
  begin
    APath := svdlgSaveDialog.FileName;
    Document.FullPath := APath;
    Document.SaveFile();
  end;
end;

procedure Tfrmmain.acFileSaveCopyAsExecute(Sender: TObject);
begin
  //
end;

procedure Tfrmmain.acFileSaveExecute(Sender: TObject);
var APath: string;
begin
  if (Document.Modified) then
  begin
    if (Document.HasName) then
    begin
      Document.SaveFile();
    end else
    begin
      if (svdlgSaveDialog.Execute()) then
      begin
        APath := svdlgSaveDialog.FileName;
        Document.FullPath := APath;
        Document.SaveFile();
      end;
    end;
  end;
end;

procedure Tfrmmain.acFileSavePreviewExecute(Sender: TObject);
var AText: string;
begin
  Document.GenerateDocument(AText);
  uktmsgdlgsmemos.ShowMessage(AText);
end;

procedure Tfrmmain.acFileSaveRenameExecute(Sender: TObject);
var AText: string;
begin
  AText := '';
  if (svdlgSaveDialog.Execute()) then
  begin
    Document.GenerateDocument(AText);
    // @to-do: ...
  end;
end;

procedure Tfrmmain.acHelpAboutExecute(Sender: TObject);
var AMsgContents: string;
begin
  AMsgContents := resAbout_Contents;
  uktmsgdlgs.MessageDlg
    (AMsgContents, uktmsgdlgtypes.mtAbout,
    [uktmsgdlgtypes.mbOK]);
end;

procedure Tfrmmain.acSearchFindAgainExecute(Sender: TObject);
begin
  //
end;

procedure Tfrmmain.acSearchFindExecute(Sender: TObject);
begin
  srchdlgSearch.SearchText := '';
  srchdlgSearch.SearchHistory.Clear();
  srchdlgSearch.Direction  := uktsrchtypes.srdForward;
  srchdlgSearch.Scope      := uktsrchtypes.srscpGlobal;
  srchdlgSearch.Origin     := uktsrchtypes.sropFromCursor;

  if (srchdlgSearch.Execute()) then
  begin
    // ...
  end;
end;

procedure Tfrmmain.acSearchReplaceAgainExecute(Sender: TObject);
begin
  //
end;

procedure Tfrmmain.acSearchReplaceExecute(Sender: TObject);
begin
  srchdlgReplace.SearchText := '';
  srchdlgReplace.SearchHistory.Clear();
  srchdlgReplace.Direction  := uktsrchtypes.srdForward;
  srchdlgReplace.Scope      := uktsrchtypes.srscpGlobal;
  srchdlgReplace.Origin     := uktsrchtypes.sropFromCursor;

  if (srchdlgReplace.Execute()) then
  begin
    // ...
  end;
end;

procedure Tfrmmain.acTagsNewBlockTagExecute(Sender: TObject);
var ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
    AContainerParentNode: TUKTSXMLTreeNode;
    EachOption: TXMLFileTreeNodeToken;
begin
  ATreeviewParentNode  := nil;
  AContainerParentNode := nil;

  if (RetrieveFocused(
    (* var *) ATreeviewParentNode,
    (* var *) AContainerParentNode)) then
  begin
    // clear additional return value
    EachOption := uktxmlfiletreenodetokens.xmlfiletrntkBlock;

    SelectInsertOption
      (ATreeviewParentNode, AContainerParentNode, EachOption);

    Document.Modified := true;
  end;
end;

procedure Tfrmmain.acTagsNewCommentTagExecute(Sender: TObject);
var ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
    AContainerParentNode: TUKTSXMLTreeNode;
    CanAdd: Boolean;
    EachOption: TXMLFileTreeNodeToken;
begin
  ATreeviewParentNode  := nil;
  AContainerParentNode := nil;

  if (RetrieveFocused(
    (* var *) ATreeviewParentNode,
    (* var *) AContainerParentNode)) then
  begin
    // clear additional return value
    EachOption := uktxmlfiletreenodetokens.xmlfiletrntkComment;

    SelectInsertOption
      (ATreeviewParentNode, AContainerParentNode, EachOption);

    Document.Modified := true;
  end;
end;

procedure Tfrmmain.acTagsNewSingleTagExecute(Sender: TObject);
var ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
    AContainerParentNode: TUKTSXMLTreeNode;
    EachOption: TXMLFileTreeNodeToken;
begin
  ATreeviewParentNode  := nil;
  AContainerParentNode := nil;

  if (RetrieveFocused(
    (* var *) ATreeviewParentNode,
    (* var *) AContainerParentNode)) then
  begin
    // clear additional return value
    EachOption := uktxmlfiletreenodetokens.xmlfiletrntkSingle;

    SelectInsertOption
      (ATreeviewParentNode, AContainerParentNode, EachOption);

    Document.Modified := true;
  end;
end;

procedure Tfrmmain.acTagsNewTextTagExecute(Sender: TObject);
var ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
    AContainerParentNode: TUKTSXMLTreeNode;
    EachOption: TXMLFileTreeNodeToken;
begin
  ATreeviewParentNode  := nil;
  AContainerParentNode := nil;

  if (RetrieveFocused(
    (* var *) ATreeviewParentNode,
    (* var *) AContainerParentNode)) then
  begin
    // clear additional return value
    EachOption := uktxmlfiletreenodetokens.xmlfiletrntkText;

    SelectInsertOption
      (ATreeviewParentNode, AContainerParentNode, EachOption);

    Document.Modified := true;
  end;
end;

function Tfrmmain.NewNode
  (var AParentNode: TUKTSXMLTreeNode): TUKTSXMLTreeNode;
begin
  if (AParentNode.NewLineAfter) then
  begin
    Result := (AParentNode.InsertBeforeLast() as TUKTSXMLTreeNode);
  end else
  begin
    Result := (AParentNode.Insert() as TUKTSXMLTreeNode);
  end;
end;

function Tfrmmain.CaptureSingle
  (const IsInsertion: Boolean; var AText: string): Boolean;
var ATitle, ALabel: string;
begin
  AText :=
    uktstrings.TrimDelimitersCopy(AText, '<', '/>');

  if (IsInsertion) then
  begin
    ATitle := resTagSingleInsert;
  end else
  begin
    ATitle := resTagSingleEdit;
  end;

  ALabel := resTagsWithoutDelimiters;
  Result :=
    (uktinputdlgs.InputString(ATitle, ALabel, AText));
  if (Result) then
  begin
    AText := uktstrings.TrimDelimitersCopy(AText, '<', '/>');
  end;
end;

function Tfrmmain.CaptureBlock
  (const IsInsertion: Boolean; var AText: string): Boolean;
var ATitle, ALabel: string;
begin
  AText :=
    uktstrings.TrimDelimitersCopy(AText, '<', '>');

  if (IsInsertion) then
  begin
    ATitle := resTagBlockInsert;
  end else
  begin
    ATitle := resTagBlockEdit;
  end;

  ALabel := resTagsWithoutDelimiters;
  Result :=
    (uktinputdlgs.InputString(ATitle, ALabel, AText));
  if (Result) then
  begin
    AText := uktstrings.TrimDelimitersCopy(AText, '<', '>');
  end;
end;

function Tfrmmain.CaptureComment
  (const IsInsertion: Boolean; var AText: string): Boolean;
var ATitle, ALabel: string;
begin
  AText :=
    uktstrings.TrimDelimitersCopy(AText, '<!--', '-->');

  if (IsInsertion) then
  begin
    ATitle := resTagCommentInsert;
  end else
  begin
    ATitle := resTagCommentEdit;
  end;
  ALabel := resCommentWithoutDelimiters;
  Result :=
    (uktinputdlgs.InputString(ATitle, ALabel, AText));
  if (Result) then
  begin
    AText := uktstrings.PadDelimitersCopy(AText, '<!--', '-->');
  end;
end;

function Tfrmmain.CaptureText
  (const IsInsertion: Boolean; var AText: string): Boolean;
var ATitle, ALabel: string;
begin
  if (IsInsertion) then
  begin
    ATitle := resTagTextInsert;
  end else
  begin
    ATitle := resTagTextEdit;
  end;
  ALabel := resTagTextCapture;
  Result :=
    (uktinputdlgs.InputString(ATitle, ALabel, AText));
  if (Result) then
  begin
    //
  end;
end;

procedure Tfrmmain.InsertSpaceAt
  (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
   AContainerParentNode: TUKTSXMLTreeNode; AIndex: Integer);
var ANewNode: TUKTSXMLTreeNode;
    ALine: string;
    IsInsertion: Boolean;
begin
  // add child node to non-visual node
  ANewNode :=
    (AContainerParentNode.InsertAt(AIndex) as TUKTSXMLTreeNode);

  ANewNode.CanInsert := true; // < --
  ANewNode.CanEdit   := true;
  ANewNode.CanRemove := true;
  ANewNode.TreeToken  := uktxmlfiletreenodetokens.xmlfiletrntkSpace;
  ANewNode.TextValue := #32;
  ANewNode.Text := resSharedTagSpace;

  ATreeviewParentNode.UpdateExpand();
  //ANewNode.Focused := true;
end;

procedure Tfrmmain.InsertTabAt
  (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
   AContainerParentNode: TUKTSXMLTreeNode; AIndex: Integer);
var ANewNode: TUKTSXMLTreeNode;
    ALine: string;
    IsInsertion: Boolean;
begin
  // add child node to non-visual node
  ANewNode :=
    (AContainerParentNode.InsertAt(AIndex) as TUKTSXMLTreeNode);

  ANewNode.CanInsert := true; // < --
  ANewNode.CanEdit   := true;
  ANewNode.CanRemove := true;
  ANewNode.TreeToken  := uktxmlfiletreenodetokens.xmlfiletrntkSpace;
  ANewNode.TextValue := #9;
  ANewNode.Text := resSharedTagTab;

  ATreeviewParentNode.UpdateExpand();
  //ANewNode.Focused := true;
end;

procedure Tfrmmain.InsertEoLnAt
  (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
   AContainerParentNode: TUKTSXMLTreeNode; AIndex: Integer);
var ANewNode: TUKTSXMLTreeNode;
    ALine: string;
    IsInsertion: Boolean;
begin
  // add child node to non-visual node
  ANewNode :=
    (AContainerParentNode.InsertAt(AIndex) as TUKTSXMLTreeNode);

  ANewNode.CanInsert := true; // < --
  ANewNode.CanEdit   := true;
  ANewNode.CanRemove := true;
  ANewNode.TreeToken  := uktxmlfiletreenodetokens.xmlfiletrntkEoLn;
  ANewNode.TextValue := #13#10;
  ANewNode.Text := resSharedTagEoLn;

  ATreeviewParentNode.UpdateExpand();
  //ANewNode.Focused := true;
end;

procedure Tfrmmain.InsertEoPgAt
  (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
   AContainerParentNode: TUKTSXMLTreeNode; AIndex: Integer);
var ANewNode: TUKTSXMLTreeNode;
    ALine: string;
    IsInsertion: Boolean;
begin
  // add child node to non-visual node
  ANewNode :=
    (AContainerParentNode.InsertAt(AIndex) as TUKTSXMLTreeNode);

  ANewNode.CanInsert := true; // < --
  ANewNode.CanEdit   := true;
  ANewNode.CanRemove := true;
  ANewNode.TreeToken  := uktxmlfiletreenodetokens.xmlfiletrntkEoLn;
  ANewNode.TextValue := #12;
  ANewNode.Text := resSharedTagEoPg;

  ATreeviewParentNode.UpdateExpand();
  //ANewNode.Focused := true;
end;

procedure Tfrmmain.InsertCommentAt
  (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
   AContainerParentNode: TUKTSXMLTreeNode; AIndex: Integer);
var ANewNode: TUKTSXMLTreeNode;
    ALine: string;
    IsInsertion: Boolean;
begin
  IsInsertion := true;
  ALine := '';
  if (CaptureComment(IsInsertion, (* var *) ALine)) then
  begin
    // add child node to non-visual node
    ANewNode :=
      (AContainerParentNode.InsertAt(AIndex) as TUKTSXMLTreeNode);

    ANewNode.CanInsert := true; // < --
    ANewNode.CanEdit   := true;
    ANewNode.CanRemove := true;
    ANewNode.TreeToken  := uktxmlfiletreenodetokens.xmlfiletrntkComment;
    ANewNode.TextValue := ALine;
    ANewNode.Text := uktstrings.PadDelimitersCopy(ALine, '<!--', '-->');

    ATreeviewParentNode.UpdateExpand();
    //ANewNode.Focused := true;
  end;
end;

procedure Tfrmmain.InsertTextAt
  (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
   AContainerParentNode: TUKTSXMLTreeNode; AIndex: Integer);
var ANewNode: TUKTSXMLTreeNode;
    ALine: string;
    IsInsertion: Boolean;
begin
  IsInsertion := true;
  ALine := '';
  if (CaptureText(IsInsertion, (* var *) ALine)) then
  begin
    // add child node to non-visual node
    ANewNode :=
      (AContainerParentNode.InsertAt(AIndex) as TUKTSXMLTreeNode);

    ANewNode.CanInsert := true; // < --
    ANewNode.CanEdit   := true;
    ANewNode.CanRemove := true;
    ANewNode.TreeToken  := uktxmlfiletreenodetokens.xmlfiletrntkText;
    ANewNode.TextValue := ALine;
    // to-do: avoid wrong characters in text
    ANewNode.Text := uktstrings.PadDelimitersCopy(ALine, '"', '"');

    ATreeviewParentNode.UpdateExpand();
    //ANewNode.Focused := true;
  end;
end;

procedure Tfrmmain.InsertSingleAt
  (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
   AContainerParentNode: TUKTSXMLTreeNode; AIndex: Integer);
var ANewNode: TUKTSXMLTreeNode;
    ALine: string;
    IsInsertion: Boolean;
begin
  IsInsertion := true;
  ALine := '';
  if (CaptureSingle(IsInsertion, (* var *) ALine)) then
  begin
    // add child node to non-visual node
    ANewNode :=
      (AContainerParentNode.InsertAt(AIndex) as TUKTSXMLTreeNode);

    ANewNode.CanInsert := true; // < --
    ANewNode.CanEdit   := true;
    ANewNode.CanRemove := true;
    ANewNode.TreeToken := uktxmlfiletreenodetokens.xmlfiletrntkSingle;
    ANewNode.TextValue := ALine;
    ANewNode.Text := uktstrings.PadDelimitersCopy(ALine, '<', '/>');

    ATreeviewParentNode.UpdateExpand();
    //ANewNode.Focused := true;
  end;
end;

procedure Tfrmmain.InsertBlockAt
  (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
   AContainerParentNode: TUKTSXMLTreeNode; AIndex: Integer);
var ANewNode: TUKTSXMLTreeNode;
    ALine: string;
    IsInsertion: Boolean;
begin
  IsInsertion := true;
  ALine := '';
  if (CaptureBlock(IsInsertion, (* var *) ALine)) then
  begin
    // add child node to non-visual node
    ANewNode :=
      (AContainerParentNode.InsertAt(AIndex) as TUKTSXMLTreeNode);

    ANewNode.CanInsert := true; // < --
    ANewNode.CanEdit   := true;
    ANewNode.CanRemove := true;
    ANewNode.TreeToken := uktxmlfiletreenodetokens.xmlfiletrntkBlock;
    ANewNode.TextValue := ALine;
    ANewNode.Text := uktstrings.PadDelimitersCopy(ALine, '<', '>');

    ATreeviewParentNode.UpdateExpand();
    //ANewNode.Focused := true;
  end;
end;

procedure Tfrmmain.acToolsExportPreviewExecute(Sender: TObject);
var AText: string;
begin
  AText := '';
  Document.GenerateDocument(AText);
  uktmsgdlgsmemos.ShowMessage(AText);
end;

procedure Tfrmmain.acToolsTreeviewCollapseExecute(Sender: TObject);
var ANode: TUKTPanelTreeviewNode;
begin
  ANode := (Self.MainTreeview.FocusedNode as TUKTPanelTreeviewNode);
  if (ANode <> nil) then
  begin
    ANode.Collapse();
  end;
end;

procedure Tfrmmain.acToolsTreeviewEmptyExecute(Sender: TObject);
var ANode: TUKTPanelTreeviewNode;
begin
  ANode := (Self.MainTreeview.FocusedNode as TUKTPanelTreeviewNode);
  if (ANode <> nil) then
  begin
    ANode.Empty();
  end;
end;

procedure Tfrmmain.acToolsTreeviewExpandExecute(Sender: TObject);
var ANode: TUKTPanelTreeviewNode;
begin
  ANode := (Self.MainTreeview.FocusedNode as TUKTPanelTreeviewNode);
  if (ANode <> nil) then
  begin
    ANode.Expand();
  end;
end;

procedure Tfrmmain.acToolsTreeviewExploreExecute(Sender: TObject);
var ANode: TUKTPanelTreeviewNode;
begin
  ANode := (Self.MainTreeview.FocusedNode as TUKTPanelTreeviewNode);
  if (ANode <> nil) then
  begin
    ANode.Explore();
  end;
end;

procedure Tfrmmain.InsertComment
  (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
   AContainerParentNode: TUKTSXMLTreeNode);
var ANewNode: TUKTSXMLTreeNode;
    ALine: string;
    IsInsertion: Boolean;
begin
  IsInsertion := true;
  if (CaptureComment(IsInsertion, (* var *) ALine)) then
  begin
    // add child node to non-visual node
    ANewNode := NewNode(AContainerParentNode);
    ANewNode.CanInsert := true; // < --
    ANewNode.CanEdit   := true;
    ANewNode.CanRemove := true;
    ANewNode.TreeToken  := uktxmlfiletreenodetokens.xmlfiletrntkComment;
    ANewNode.TextValue := ALine;
    ANewNode.Text := '<!-- ... -->';

    ATreeviewParentNode.UpdateExpand();
    //ANewNode.Focused := true;
  end;
end;

procedure Tfrmmain.InsertText
  (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
   AContainerParentNode: TUKTSXMLTreeNode);
var ANewNode: TUKTSXMLTreeNode;
    ALine: string;
    IsInsertion: Boolean;
begin
  IsInsertion := true;
  ALine := '';
  if (CaptureText(IsInsertion, (* var *) ALine)) then
  begin
    // add child node to non-visual node
    ANewNode := NewNode(AContainerParentNode);
    ANewNode.CanInsert := true; // < --
    ANewNode.CanEdit   := true;
    ANewNode.CanRemove := true;
    ANewNode.TreeToken  := uktxmlfiletreenodetokens.xmlfiletrntkText;
    ANewNode.TextValue := ALine;
    ANewNode.Text := uktstrings.PadDelimitersCopy(ALine, '"', '"');

    ATreeviewParentNode.UpdateExpand();
    //ANewNode.Focused := true;
  end;
end;

procedure Tfrmmain.InsertSingle
  (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
   AContainerParentNode: TUKTSXMLTreeNode);
var ANewNode: TUKTSXMLTreeNode;
    ALine: string;
    IsInsertion: Boolean;
begin
  IsInsertion := true;
  ALine := '';
  if (CaptureSingle(IsInsertion, (* var *) ALine)) then
  begin
    // add child node to non-visual node
    ANewNode := NewNode(AContainerParentNode);
    ANewNode.CanInsert := true; // < --
    ANewNode.CanEdit   := true;
    ANewNode.CanRemove := true;
    ANewNode.TreeToken  := uktxmlfiletreenodetokens.xmlfiletrntkSingle;
    ANewNode.TextValue := ALine;
    ANewNode.Text := uktstrings.PadDelimitersCopy(ALine, '<', '/>');

    ATreeviewParentNode.UpdateExpand();
    //ANewNode.Focused := true;
  end;
end;

procedure Tfrmmain.InsertBlock
  (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
   AContainerParentNode: TUKTSXMLTreeNode);
var ANewNode: TUKTSXMLTreeNode;
    ALine: string;
    IsInsertion: Boolean;
begin
  IsInsertion := true;
  ALine := '';
  if (CaptureBlock(IsInsertion, (* var *) ALine)) then
  begin
    // add child node to non-visual node
    ANewNode := NewNode(AContainerParentNode);
    ANewNode.CanInsert := true; // < --
    ANewNode.CanEdit   := true;
    ANewNode.CanRemove := true;
    ANewNode.TreeToken  := uktxmlfiletreenodetokens.xmlfiletrntkBlock;
    ANewNode.TextValue := ALine;
    ANewNode.Text := uktstrings.PadDelimitersCopy(ALine, '<', '>');

    ATreeviewParentNode.UpdateExpand();
    //ANewNode.Focused := true;
  end;
end;

procedure Tfrmmain.InsertSpace
  (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
   AContainerParentNode: TUKTSXMLTreeNode);
var ANewNode: TUKTSXMLTreeNode;
    ALine: string;
    IsInsertion: Boolean;
begin
  // add child node to non-visual node
  ANewNode := NewNode(AContainerParentNode);

  ANewNode.CanInsert := true; // < --
  ANewNode.CanEdit   := true;
  ANewNode.CanRemove := true;
  ANewNode.TreeToken  := uktxmlfiletreenodetokens.xmlfiletrntkSpace;
  ANewNode.TextValue := #32;
  ANewNode.Text := resSharedTagSpace;

  ATreeviewParentNode.UpdateExpand();
  //ANewNode.Focused := true;
end;

procedure Tfrmmain.InsertTab
  (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
   AContainerParentNode: TUKTSXMLTreeNode);
var ANewNode: TUKTSXMLTreeNode;
begin
  // add child node to non-visual node
  ANewNode := NewNode(AContainerParentNode);

  ANewNode.CanInsert := true; // < --
  ANewNode.CanEdit   := true;
  ANewNode.CanRemove := true;
  ANewNode.TreeToken  := uktxmlfiletreenodetokens.xmlfiletrntkTab;
  ANewNode.TextValue := #9;
  ANewNode.Text := resSharedTagTab;

  ATreeviewParentNode.UpdateExpand();
  //ANewNode.Focused := true;
end;

procedure Tfrmmain.InsertEoPg
  (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
   AContainerParentNode: TUKTSXMLTreeNode);
var ANewNode: TUKTSXMLTreeNode;
    ALine: string;
    IsInsertion: Boolean;
begin
  // add child node to non-visual node
  ANewNode := NewNode(AContainerParentNode);

  ANewNode.CanInsert := true; // < --
  ANewNode.CanEdit   := true;
  ANewNode.CanRemove := true;
  ANewNode.TreeToken  := uktxmlfiletreenodetokens.xmlfiletrntkEoPg;
  ANewNode.TextValue := #12;
  ANewNode.Text := resSharedTagEoPg;

  ATreeviewParentNode.UpdateExpand();
  //ANewNode.Focused := true;
end;

procedure Tfrmmain.InsertEoLn
  (ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
   AContainerParentNode: TUKTSXMLTreeNode);
var ANewNode: TUKTSXMLTreeNode;
    ALine: string;
    IsInsertion: Boolean;
begin
  // add child node to non-visual node
  ANewNode := NewNode(AContainerParentNode);

  ANewNode.CanInsert := true; // < --
  ANewNode.CanEdit   := true;
  ANewNode.CanRemove := true;
  ANewNode.TreeToken  := uktxmlfiletreenodetokens.xmlfiletrntkEoLn;
  ANewNode.TextValue := #13#10;
  ANewNode.Text := resSharedTagEoLn;

  ATreeviewParentNode.UpdateExpand();
  //ANewNode.Focused := true;
end;

procedure Tfrmmain.SelectInsertOption
  (APanelParentNode: TUKTMsgPanelTreeViewNode;
   AParentNode: TUKTSXMLTreeNode;
   EachOption: TXMLFileTreeNodeToken);
begin
  case (EachOption) of
    uktxmlfiletreenodetokens.xmlfiletrntkTab:
      begin
        InsertTab
          (APanelParentNode, AParentNode);
      end;
    uktxmlfiletreenodetokens.xmlfiletrntkSpace:
      begin
        InsertSpace
          (APanelParentNode, AParentNode);
      end;
    uktxmlfiletreenodetokens.xmlfiletrntkEoLn:
      begin
        InsertEoLn
          (APanelParentNode, AParentNode);
      end;
    uktxmlfiletreenodetokens.xmlfiletrntkEoPg:
      begin
        InsertEoPg
          (APanelParentNode, AParentNode);
      end;
    uktxmlfiletreenodetokens.xmlfiletrntkText:
      begin
        InsertText
          (APanelParentNode, AParentNode);
      end;
    uktxmlfiletreenodetokens.xmlfiletrntkComment:
      begin
        InsertComment
          (APanelParentNode, AParentNode);
      end;
    uktxmlfiletreenodetokens.xmlfiletrntkSingle:
      begin
        InsertSingle
          (APanelParentNode, AParentNode);
      end;
    uktxmlfiletreenodetokens.xmlfiletrntkBlock:
      begin
        InsertBlock
          (APanelParentNode, AParentNode);
      end;
  end;
end;

procedure Tfrmmain.EditText
  (APanelNode: TUKTMsgPanelTreeViewNode;
   AContainerNode: TUKTSXMLTreeNode);
var ALine: string;
    IsInsertion: Boolean;
begin
  IsInsertion := false;
  ALine := AContainerNode.TextValue;
  if (CaptureText(IsInsertion, (* var *) ALine)) then
  begin
    AContainerNode.TextValue := ALine;
    AContainerNode.Text := uktstrings.PadDelimitersCopy(ALine, '"', '"');
  end;
end;

procedure Tfrmmain.EditComment
  (APanelNode: TUKTMsgPanelTreeViewNode;
   AContainerNode: TUKTSXMLTreeNode);
var ALine: string;
    IsInsertion: Boolean;
begin
  IsInsertion := false;
  ALine := AContainerNode.TextValue;
  if (CaptureComment(IsInsertion, (* var *) ALine)) then
  begin
    AContainerNode.TextValue := ALine;
    AContainerNode.Text := ALine;
  end;
end;

procedure Tfrmmain.EditBlock
  (APanelNode: TUKTMsgPanelTreeViewNode;
   AContainerNode: TUKTSXMLTreeNode);
var ALine: string;
    IsInsertion: Boolean;
begin
  IsInsertion := false;
  ALine := AContainerNode.TextValue;
  if (CaptureBlock(IsInsertion, (* var *) ALine)) then
  begin
    AContainerNode.TextValue := ALine;
    AContainerNode.Text := uktstrings.PadDelimitersCopy(ALine, '<', '>');
  end;
end;

procedure Tfrmmain.EditSingle
  (APanelNode: TUKTMsgPanelTreeViewNode;
   AContainerNode: TUKTSXMLTreeNode);
var ALine: string;
    IsInsertion: Boolean;
begin
  IsInsertion := false;
  ALine := AContainerNode.TextValue;
  if (CaptureSingle(IsInsertion, (* var *) ALine)) then
  begin
    AContainerNode.TextValue := ALine;
    AContainerNode.Text := uktstrings.PadDelimitersCopy(ALine, '<', '/>');
  end;
end;

procedure Tfrmmain.SelectEditOption
  (APanelNode: TUKTMsgPanelTreeViewNode;
   AContainerNode: TUKTSXMLTreeNode);
var ATitle, AMessage, AAnswer: string;
    EachOption: TXMLFileTreeNodeToken;
begin
  EachOption := AContainerNode.TreeToken;
  case (EachOption) of
    uktxmlfiletreenodetokens.xmlfiletrntkText:
      begin
        EditText(APanelNode, AContainerNode);
      end;
    uktxmlfiletreenodetokens.xmlfiletrntkComment:
      begin
        EditComment(APanelNode, AContainerNode);
      end;
    uktxmlfiletreenodetokens.xmlfiletrntkSingle:
      begin
        EditSingle(APanelNode, AContainerNode);
      end;
    uktxmlfiletreenodetokens.xmlfiletrntkBlock:
      begin
        EditBlock(APanelNode, AContainerNode);
      end;
  end;
end;

function Tfrmmain.GetOptions(): TUKTOnlyStringKeyValueList;
var EachOption: TXMLFileTreeNodeToken;
    AKey, AValue: string;
begin
  Result := TUKTOnlyStringKeyValueList.Create();

  EachOption := uktxmlfiletreenodetokens.xmlfiletrntkNone;
  AKey   := IntToStr(ord(EachOption));
  AValue := uktxmlfiletreenodetokens.TokenToText(EachOption);
  Result.Insert
    (TUKTOnlyStringKeyValueItem.CreateItem(AKey, AValue));

  EachOption := uktxmlfiletreenodetokens.xmlfiletrntkEoPg;
  AKey   := IntToStr(ord(EachOption));
  AValue := uktxmlfiletreenodetokens.TokenToText(EachOption);
  Result.Insert
    (TUKTOnlyStringKeyValueItem.CreateItem(AKey, AValue));

  EachOption := uktxmlfiletreenodetokens.xmlfiletrntkEoLn;
  AKey   := IntToStr(ord(EachOption));
  AValue := uktxmlfiletreenodetokens.TokenToText(EachOption);
  Result.Insert
    (TUKTOnlyStringKeyValueItem.CreateItem(AKey, AValue));

  EachOption := uktxmlfiletreenodetokens.xmlfiletrntkSpace;
  AKey   := IntToStr(ord(EachOption));
  AValue := uktxmlfiletreenodetokens.TokenToText(EachOption);
  Result.Insert
    (TUKTOnlyStringKeyValueItem.CreateItem(AKey, AValue));

  EachOption := uktxmlfiletreenodetokens.xmlfiletrntkComment;
  AKey   := IntToStr(ord(EachOption));
  AValue := uktxmlfiletreenodetokens.TokenToText(EachOption);
  Result.Insert
    (TUKTOnlyStringKeyValueItem.CreateItem(AKey, AValue));

  EachOption := uktxmlfiletreenodetokens.xmlfiletrntkBlock;
  AKey   := IntToStr(ord(EachOption));
  AValue := uktxmlfiletreenodetokens.TokenToText(EachOption);
  Result.Insert
    (TUKTOnlyStringKeyValueItem.CreateItem(AKey, AValue));

  EachOption := uktxmlfiletreenodetokens.xmlfiletrntkSingle;
  AKey   := IntToStr(ord(EachOption));
  AValue := uktxmlfiletreenodetokens.TokenToText(EachOption);
  Result.Insert
    (TUKTOnlyStringKeyValueItem.CreateItem(AKey, AValue));

  EachOption := uktxmlfiletreenodetokens.xmlfiletrntkText;
  AKey   := IntToStr(ord(EachOption));
  AValue := uktxmlfiletreenodetokens.TokenToText(EachOption);
  Result.Insert
    (TUKTOnlyStringKeyValueItem.CreateItem(AKey, AValue));

  EachOption := uktxmlfiletreenodetokens.xmlfiletrntkEntity;
  AKey   := IntToStr(ord(EachOption));
  AValue := uktxmlfiletreenodetokens.TokenToText(EachOption);
  Result.Insert
    (TUKTOnlyStringKeyValueItem.CreateItem(AKey, AValue));

  EachOption := uktxmlfiletreenodetokens.xmlfiletrntkHexaDecimal;
  AKey   := IntToStr(ord(EachOption));
  AValue := uktxmlfiletreenodetokens.TokenToText(EachOption);
  Result.Insert
    (TUKTOnlyStringKeyValueItem.CreateItem(AKey, AValue));
end;

procedure Tfrmmain.SelectInsertAtOption
  (APanelParentNode: TUKTMsgPanelTreeViewNode;
   AParentNode: TUKTSXMLTreeNode;
   EachOption: TXMLFileTreeNodeToken;
   AIndex: Integer);
begin
  case (EachOption) of
    uktxmlfiletreenodetokens.xmlfiletrntkSpace:
      begin
        InsertSpaceAt
          (APanelParentNode, AParentNode, AIndex);
      end;
    uktxmlfiletreenodetokens.xmlfiletrntkEoLn:
      begin
        InsertEoLnAt
          (APanelParentNode, AParentNode, AIndex);
      end;
    uktxmlfiletreenodetokens.xmlfiletrntkEoPg:
      begin
        InsertEoPgAt
          (APanelParentNode, AParentNode, AIndex);
      end;
    uktxmlfiletreenodetokens.xmlfiletrntkText:
      begin
        InsertTextAt
          (APanelParentNode, AParentNode, AIndex);
      end;
    uktxmlfiletreenodetokens.xmlfiletrntkComment:
      begin
        InsertCommentAt
          (APanelParentNode, AParentNode, AIndex);
      end;
    uktxmlfiletreenodetokens.xmlfiletrntkSingle:
      begin
        InsertSingleAt
          (APanelParentNode, AParentNode, AIndex);
      end;
    uktxmlfiletreenodetokens.xmlfiletrntkBlock:
      begin
        InsertBlockAt
          (APanelParentNode, AParentNode, AIndex);
      end;
  end;
end;

function Tfrmmain.RetrieveFocused
  (var ATreeviewNode: TUKTMsgPanelTreeViewNode;
   var AContainerNode: TUKTSXMLTreeNode): Boolean;
begin
  Result := false;

  // obtain focused visual node from treeview control
  ATreeviewNode :=
    (Self.MainTreeview.FocusedNode as TUKTMsgPanelTreeViewNode);

  Result := (ATreeviewNode <> nil);
  if (Result) then
  begin
    // obtain related non-visual node from container,
    // from visual node
    AContainerNode :=
      (ATreeviewNode.ContainerTreeNode as TUKTSXMLTreeNode);
    Result := (AContainerNode <> nil);
  end;
  // Goal: Returns a valid container node that is represented by,
  // a treeview node.
end;

function Tfrmmain.RetrieveFocusedParent
  (var ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
   var AContainerParentNode: TUKTSXMLTreeNode): Boolean;
var ATreeviewSiblingNode:  TUKTMsgPanelTreeViewNode;
    AContainerSiblingNode: TUKTSXMLTreeNode;
begin
  Result := false;

  ATreeviewParentNode  := nil;
  AContainerParentNode := nil;

  ATreeviewSiblingNode  := nil;
  AContainerSiblingNode := nil;

  Result :=
   (RetrieveFocused(
    (* var *) ATreeviewSiblingNode,
    (* var *) AContainerSiblingNode));

  if (Result) then
  begin
    ATreeviewParentNode :=
      (ATreeviewSiblingNode.Parent() as TUKTMsgPanelTreeViewNode);
    AContainerParentNode :=
      (AContainerSiblingNode.Parent() as TUKTSXMLTreeNode);
  end;
end;

function Tfrmmain.RetrieveFocusedAndParent(
  var ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
  var ATreeviewNode: TUKTMsgPanelTreeViewNode;
  var AContainerParentNode: TUKTSXMLTreeNode;
  var AContainerNode: TUKTSXMLTreeNode): Boolean;
begin
  Result := false;

  ATreeviewParentNode  := nil;
  AContainerParentNode := nil;

  ATreeviewNode  := nil;
  AContainerNode := nil;

  Result :=
   (RetrieveFocused(
    (* var *) ATreeviewNode,
    (* var *) AContainerNode));

  if (Result) then
  begin
    ATreeviewParentNode :=
      (ATreeviewNode.Parent() as TUKTMsgPanelTreeViewNode);
    AContainerParentNode :=
      (AContainerNode.Parent() as TUKTSXMLTreeNode);
  end;
end;

function Tfrmmain.MarkClipboardSource(): Boolean;
var ATreeviewNode: TUKTMsgPanelTreeViewNode;
    AContainerNode: TUKTSXMLTreeNode;
begin
  Result := false;

  ATreeviewNode  := nil;
  AContainerNode := nil;

  Result :=
    RetrieveFocused(
      (* var *) ATreeviewNode,
      (* var *) AContainerNode);
  if (Result) then
  begin
    ClipboardSourceRootContainerNode := AContainerNode;
  end;
end;

function Tfrmmain.MarkClipboardDest(): Boolean;
var ATreeviewNode: TUKTMsgPanelTreeViewNode;
    AContainerNode: TUKTSXMLTreeNode;
begin
  Result := false;

  // @to-do: revisar validacion,
  // si se puede pegar bloque o sencillo,
  // en root, por ejemplo

  ATreeviewNode  := nil;
  AContainerNode := nil;

  Result :=
    RetrieveFocused(
      (* var *) ATreeviewNode,
      (* var *) AContainerNode);
  if (Result) then
  begin
    ClipboardDestRootContainerNode := AContainerNode;
  end;
end;

function Tfrmmain.SelectOptions
  (var EachOption: TXMLFileTreeNodeToken): Boolean;
var AOptions: TUKTOnlyStringKeyValueList;
    AMsgTitle, AMsgContents, AKey: string; ThisOptionIndex: Integer;
begin
  Result := false;

  // allocate key-value list
  AOptions := GetOptions();

  ThisOptionIndex := ord(EachOption);
  AKey := IntToStr(ThisOptionIndex);

  AMsgTitle   := resNewElementTitle;
  AMsgContents := resNewElementContents;
  Result :=
    ((uktonlystringkeyvalueinputdlgs.InputOnlyValueOptions
     (AMsgTitle, AMsgContents, AOptions, (* var *) AKey)));

  if (Result)  then
  begin
    ThisOptionIndex := StrToInt(AKey);
    EachOption := TXMLFileTreeNodeToken(ThisOptionIndex);
  end;

  // deallocate key-value list
  AOptions.Free();
end;

procedure Tfrmmain.acToolsTreeviewItemDeleteExecute(Sender: TObject);
var ATreeviewNode: TUKTMsgPanelTreeviewNode;
    AContainerNode: TUKTSXMLTreeNode;
begin
  // @to-do: revisar que hacer para que el "usuario" del control,
  // no modifique el control "treeview", directamente
  // ...

  ATreeviewNode  := nil;
  AContainerNode := nil;

  if (RetrieveFocused(
    (* var *) ATreeviewNode,
    (* var *) AContainerNode)) then
  begin
      if (AContainerNode.CanRemove) then
      begin
        // remove non-visual node
        AContainerNode.Remove();
      end else
      begin
        uktmsgdlgs.ShowMessage(resCannotRemoveNode);
      end;
  end;
end;

procedure Tfrmmain.acToolsTreeviewItemInsertAfterExecute(Sender: TObject);
var ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
var ATreeviewNode: TUKTMsgPanelTreeViewNode;
var AContainerParentNode: TUKTSXMLTreeNode;
var AContainerNode: TUKTSXMLTreeNode;

  ATitle, AMessage: string; ThisOption: Integer;
  CanContinue, CanAdd: Boolean;
  EachOption: TXMLFileTreeNodeToken;
  AIndex: Integer;
begin
  ATreeviewParentNode  := nil;
  AContainerParentNode := nil;

  ATreeviewNode  := nil;
  AContainerNode := nil;

  CanContinue :=
    RetrieveFocusedAndParent(
      (* var *) ATreeviewParentNode,
      (* var *) ATreeviewNode,
      (* var *) AContainerParentNode,
      (* var *) AContainerNode);

  if (CanContinue) then
  begin
    // clear additional return value
    EachOption := uktxmlfiletreenodetokens.xmlfiletrntkNone;

    CanAdd := SelectOptions((* var *) EachOption);
    if (CanAdd)  then
    begin
      AIndex := (AContainerNode.LocalIndex() + 1);
      SelectInsertAtOption
        (ATreeviewParentNode, AContainerParentNode, EachOption, AIndex);
      Document.Modified := true;
    end;
  end;
end;

procedure Tfrmmain.acToolsTreeviewItemInsertBeforeExecute(Sender: TObject);
var ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
var ATreeviewNode: TUKTMsgPanelTreeViewNode;
var AContainerParentNode: TUKTSXMLTreeNode;
var AContainerNode: TUKTSXMLTreeNode;

  ATitle, AMessage: string; ThisOption: Integer;
  CanContinue, CanAdd: Boolean;
  EachOption: TXMLFileTreeNodeToken;
  AIndex: Integer;
begin
  ATreeviewParentNode  := nil;
  AContainerParentNode := nil;

  ATreeviewNode  := nil;
  AContainerNode := nil;

  CanContinue :=
    RetrieveFocusedAndParent(
      (* var *) ATreeviewParentNode,
      (* var *) ATreeviewNode,
      (* var *) AContainerParentNode,
      (* var *) AContainerNode);

  if (CanContinue) then
  begin
    // clear additional return value
    EachOption := uktxmlfiletreenodetokens.xmlfiletrntkNone;

    CanAdd := SelectOptions((* var *) EachOption);
    if (CanAdd)  then
    begin
      AIndex := AContainerNode.LocalIndex();
      SelectInsertAtOption
        (ATreeviewParentNode, AContainerParentNode, EachOption, AIndex);
      Document.Modified := true;
    end;
  end;
end;

procedure Tfrmmain.acToolsTreeviewItemInsertLastExecute(Sender: TObject);
var ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
    AContainerParentNode: TUKTSXMLTreeNode;
    CanAdd: Boolean;
    EachOption: TXMLFileTreeNodeToken;
begin
  ATreeviewParentNode  := nil;
  AContainerParentNode := nil;

  if (RetrieveFocused(
    (* var *) ATreeviewParentNode,
    (* var *) AContainerParentNode)) then
  begin
    // clear additional return value
    EachOption := uktxmlfiletreenodetokens.xmlfiletrntkNone;

    CanAdd := SelectOptions((* var *) EachOption);
    if (CanAdd)  then
    begin
      SelectInsertOption
        (ATreeviewParentNode, AContainerParentNode, EachOption);

      Document.Modified := true;
    end;
  end;
end;

procedure Tfrmmain.acToolsTreeviewItemPropertiesExecute(Sender: TObject);
var ATreeviewNode: TUKTMsgPanelTreeviewNode;
    AContainerNode: TUKTSXMLTreeNode;
begin
  // @to-do: revisar que hacer para que el "usuario" del control,
  // no modifique el control "treeview", directamente
  // ...

  // obtain focused visual node from treeview control
  ATreeviewNode := (Self.MainTreeview.FocusedNode as TUKTMsgPanelTreeviewNode);
  if (ATreeviewNode <> nil) then
  begin
    // obtain related non-visual node from container,
    // from visual node
    AContainerNode :=
      (ATreeviewNode.ContainerTreeNode as TUKTSXMLTreeNode);
    if (AContainerNode <> nil) then
    begin
      SelectEditOption(ATreeviewNode, AContainerNode);
      Document.Modified := true;
    end;
  end;
end;

procedure Tfrmmain.acToolsTreeviewItemSelectOffExecute(Sender: TObject);
var ATreeviewNode: TUKTMsgPanelTreeViewNode;
    AContainerNode: TUKTSXMLTreeNode;
begin
  // obtain focused visual node from treeview control
  ATreeviewNode :=
    (Self.MainTreeview.FocusedNode as TUKTMsgPanelTreeViewNode);
  if (ATreeviewNode <> nil) then
  begin
    // obtain related non-visual node from container,
    // from visual node
    AContainerNode :=
      (ATreeviewNode.ContainerTreeNode as TUKTSXMLTreeNode);
    if (AContainerNode <> nil) then
    begin
      AContainerNode.Selected := false;
    end;
  end;
end;

procedure Tfrmmain.acToolsTreeviewItemSelectOnExecute(Sender: TObject);
var ATreeviewNode: TUKTMsgPanelTreeViewNode;
    AContainerNode: TUKTSXMLTreeNode;
begin
  // obtain focused visual node from treeview control
  ATreeviewNode :=
    (Self.MainTreeview.FocusedNode as TUKTMsgPanelTreeViewNode);
  if (ATreeviewNode <> nil) then
  begin
    // obtain related non-visual node from container,
    // from visual node
    AContainerNode :=
      (ATreeviewNode.ContainerTreeNode as TUKTSXMLTreeNode);
    if (AContainerNode <> nil) then
    begin
      AContainerNode.Selected := true;
    end;
  end;
end;

procedure Tfrmmain.acViewFontSizeIncreaseExecute(Sender: TObject);
begin
  MainTreeview.Font.Size := (MainTreeview.Font.Size + 2);
end;

procedure Tfrmmain.acViewFontSizeReduceExecute(Sender: TObject);
begin
  MainTreeview.Font.Size := (MainTreeview.Font.Size - 2);
end;

procedure Tfrmmain.acViewToggleAddressbarExecute(Sender: TObject);
begin
  Self.AddressPanel.Visible := not Self.AddressPanel.Visible;
  ResizeTopPanel();
end;

procedure Tfrmmain.acViewToggleToolBarsExecute(Sender: TObject);
begin
  //
end;

procedure Tfrmmain.acViewToogleModeExecute(Sender: TObject);
begin
  (*
  if (pgconMain.ActivePage = tbshSourceCode) then
  begin
    pgconMain.ActivePage := tbshVisual;
    Application.ProcessMessages();

    RebuiltTreeview();

    //MainTreeview.Show();
    //MainTreeview.SetFocus();
  end else
  begin
    pgconMain.ActivePage := tbshSourceCode;
    Application.ProcessMessages();
  end;
  *)
end;

procedure Tfrmmain.acViewToggleToolBarEditSearchExecute(Sender: TObject);
begin
  Self.EditSearchToolBar.Visible := not Self.EditSearchToolBar.Visible;
  ResizeTopPanel();
end;

procedure Tfrmmain.acViewToggleToolBarFileExecute(Sender: TObject);
begin
  Self.FileToolBar.Visible := not Self.FileToolBar.Visible;
  ResizeTopPanel();
end;

procedure Tfrmmain.acViewToogleToolBarQuickExecute(Sender: TObject);
begin
  Self.QuickToolBar.Visible := not Self.QuickToolBar.Visible;
  ResizeTopPanel();
end;

procedure Tfrmmain.acViewToolBarsConfigureExecute(Sender: TObject);
begin
  //
end;

procedure Tfrmmain.acViewToggleToolBarTreeviewExecute(Sender: TObject);
begin
  Self.TreeviewToolBar.Visible := not Self.TreeviewToolBar.Visible;
  ResizeTopPanel();
end;

procedure Tfrmmain.AnyToolButtonMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  Self.MainStatusBar.SimpleText:= (Sender as TToolButton).Hint;
end;

procedure Tfrmmain.FormCreate(Sender: TObject);
begin
  Self.BeenActivated := false;
  Self.ToolBars := TFPObjectList.Create(false);

  Self.MainTreeview  := nil;

  Self.Document      := nil;

  ClipBoardClear();
end;

procedure Tfrmmain.FormDestroy(Sender: TObject);
begin
  ClipBoardClear();

  Self.Document      := nil;

  Self.MainTreeview  := nil;

  Self.ToolBars := nil;
  Self.ToolBars.Free();
end;

procedure Tfrmmain.FormShow(Sender: TObject);
begin
  if (not Self.BeenActivated) then
  begin
    FormShowFirstTime(Sender);
  end else
  begin
    Self.BeenActivated := true;
    FormShowAgain(Sender);
  end;
end;

procedure Tfrmmain.PreparePlainNewDocument();
begin
  // remove previous root, if any,
  // else, no problem
  Document.TreeContainer.Items.DropRoot();

  // add a new root node in runtime,
  // previous versions of tree collections,
  // root lifetime depended of collection lifetime
  Document.RootNode := Document.CreateRoot();
    //TUKTSXMLTreeNode(Document.TreeContainer.Items.InsertRoot());

  Document.RootNode.TreeToken  := TXMLFileTreeNodeToken.xmlfiletrntkDocument;
  Document.RootNode.CanInsert := true;
  Document.RootNode.CanEdit   := false;
  Document.RootNode.CanRemove := false;
  Document.RootNode.NewLineAfter := true;
  Document.RootNode.TextValue := '';
  Document.RootNode.Text  := resSharedTagDoc;
end;

function Tfrmmain.DocumentBeforeNewFile(Sender: TObject): Boolean;
begin
  Result := true;

  PreparePlainNewDocument();

  Document.EncodingNode := TUKTSXMLTreeNode(Document.RootNode.Insert());
  Document.EncodingNode.TreeToken := TXMLFileTreeNodeToken.xmlfiletrntkEncoding;
  Document.EncodingNode.CanInsert := false;
  Document.EncodingNode.CanEdit   := true;
  Document.EncodingNode.CanRemove := false;
  Document.EncodingNode.NewLineAfter := true;
  Document.EncodingNode.TextValue := 'encoding="ISO-8859-1"';
  Document.EncodingNode.Text := '<?encoding="ISO-8859-1?>';

  Document.MainNode := TUKTSXMLTreeNode(Document.RootNode.Insert());
  Document.MainNode.TreeToken := TXMLFileTreeNodeToken.xmlfiletrntkBlock;
  Document.MainNode.CanInsert := true;
  Document.MainNode.CanEdit   := true;
  Document.MainNode.CanRemove := false;
  Document.MainNode.NewLineAfter := true;
  Document.MainNode.TextValue := resSharedTagMain;
  Document.MainNode.Text :=
    uktstrings.PadDelimitersCopy(resSharedTagMain, '<', '>');

  Document.EoFNode := TUKTSXMLTreeNode(Document.RootNode.Insert());
  Document.EoFNode.TreeToken := TXMLFileTreeNodeToken.xmlfiletrntkEoLn;
  Document.EoFNode.CanInsert := false;
  Document.EoFNode.CanEdit   := false;
  Document.EoFNode.CanRemove := false;
  Document.EoFNode.NewLineAfter := false;
  Document.EoFNode.TextValue := #26;
  Document.EoFNode.Text := resSharedTagEoF;
end;

procedure Tfrmmain.DocumentAfterNewFile(Sender: TObject);
begin
  // update form*s title*s text
  Self.Caption     := Document.FullFileName();
  // update addressbar text
  AddressEdit.Text := Document.FullPath;
end;

function Tfrmmain.DocumentBeforeNewAsFile(Sender: TObject): Boolean;
begin
  Result := true;
  // reset treecontainer, with a new ( "document" ) root-node
  PreparePlainNewDocument();
end;

procedure Tfrmmain.DocumentAfterNewAsFile(Sender: TObject);
begin
  // update form*s title*s text
  Self.Caption:= Document.FullFileName();
  // update addressbar text
  AddressEdit.Text := Document.FullPath;
end;

function Tfrmmain.DocumentBeforeOpenFile(Sender: TObject): Boolean;
begin
  Result := true;
  // reset treecontainer, with a new ( "document" ) root-node
  PreparePlainNewDocument();
end;

procedure Tfrmmain.DocumentAfterOpenFile(Sender: TObject);
begin
  // update form*s title*s text
  Self.Caption     := Document.FullFileName();
  // update addressbar text
  AddressEdit.Text := Document.FullPath;
end;

procedure Tfrmmain.DocumentAfterSaveFile(Sender: TObject);
var APath: string;
//    AText: string; TextFile: System.Text;
begin
  APath := Document.FullPath;

  // @to-do: move code to doc component
  (*
  AText := '';
  GenerateDocument(AText);

  System.Assign(TextFile, APath);
  System.Rewrite(TextFile);

  Write(TextFile, AText);

  System.Close(TextFile);
  *)

  // update form*s title*s text
  Self.Caption     := Document.FullFileName();
  // update addressbar text
  AddressEdit.Text := APath;
end;

procedure Tfrmmain.FormShowFirstTime(Sender: TObject);
begin
  PrepareToolPanel();
  PrepareFileFilters();
  PrepareDialogs();

  // prepare data container
  PrepareDocumentManager();

  // after pagecontrol is ready
  PrepareTreeview();

  Document.NewFile();

  PrepareResources();
end;

procedure Tfrmmain.FormShowAgain(Sender: TObject);
begin
//
end;

procedure Tfrmmain.ClipBoardClear();
begin
  ClipboardSourceRootContainerNode := nil;
  ClipboardDestRootContainerNode   := nil;
end;

function Tfrmmain.HeightOfToolBars(): Integer;
var I, L: Integer; EachToolBar: TToolBar;
begin
  Result := 0;

  L := Pred(Self.ToolBars.Count);
  for I := 0 to L do
  begin
    EachToolBar := (Self.ToolBars.Items[I] as TToolBar);
    if (EachToolBar.Visible) then
    begin
      Inc(Result, DefaultToolBarHeight);
    end;
  end;
end;

procedure Tfrmmain.ResizeToolBars();
var H: Integer;
begin
  H := HeightOfToolBars();
  ToolBarsPanel.Height := H;
end;

procedure Tfrmmain.ResizeTopPanel();
var H: Integer;
begin
  // check toolbars panel
  H := HeightOfToolBars();

  // check address panel
  Inc(H, AddressPanel.Height);

  Self.TopPanel.Height := 0;
  Application.ProcessMessages();
  Self.TopPanel.Height := H;
  Application.ProcessMessages();
end;

procedure Tfrmmain.PrepareToolBars();
begin
  // add toolbars references
  Self.ToolBars.Add(Self.QuickToolBar);
  Self.ToolBars.Add(Self.FileToolBar);
  Self.ToolBars.Add(Self.EditSearchToolBar);
  Self.ToolBars.Add(Self.TreeviewToolBar);
  Self.ToolBars.Add(Self.TagsToolBar);

  // check visible initial state
  Self.QuickToolBar.Visible := true;
  Self.FileToolBar.Visible := false;
  Self.EditSearchToolBar.Visible := false;
  Self.TreeviewToolBar.Visible := true;
  Self.TagsToolBar.Visible := true;

  ResizeToolBars();
end;

procedure Tfrmmain.PrepareToolPanel();
begin
  PrepareToolBars();
  ResizeTopPanel();
end;

procedure Tfrmmain.PrepareFileFilters();
begin
  // "file filters" for open & save operations
  SharedFileFilters := TCustomUKTFileFiltersContainer.Create(Self);
  // "file filters" for open a template
  NewAsFileFilters  := TCustomUKTFileFiltersContainer.Create(Self);

  SharedFileFilters.LoadFilter(extSXML, fltSXML);
  SharedFileFilters.LoadFilter(extXML,  fltXML);
  SharedFileFilters.LoadFilter(extTemplate_SXML, fltTemplate_SXML);
  SharedFileFilters.LoadFilter(extText, fltText);
  SharedFileFilters.LoadFilter(extALL,  fltALL);

  NewAsFileFilters.LoadFilter(extTemplate_SXML, fltTemplate_SXML);
  NewAsFileFilters.LoadFilter(extSXML, fltSXML);
  NewAsFileFilters.LoadFilter(extXML,  fltXML);
  NewAsFileFilters.LoadFilter(extText, fltText);
  NewAsFileFilters.LoadFilter(extALL,  fltALL);

  opdlgOpenDialog.Filter  := SharedFileFilters.Filter();
  opdlgNewAsDialog.Filter := NewAsFileFilters.Filter();
  svdlgSaveDialog.Filter  := SharedFileFilters.Filter();

  opdlgOpenDialog.Title  := resOpenDialog_Title;
  opdlgNewAsDialog.Title := resNewAsDialog_Title;
  svdlgSaveDialog.Title  := resSaveDialog_Title;

  opdlgOpenDialog.FilterIndex  :=0;
  opdlgNewAsDialog.FilterIndex :=0;
  svdlgSaveDialog.FilterIndex  :=0;

  opdlgOpenDialog.DefaultExt  := extSXML;
  opdlgNewAsDialog.DefaultExt := extTemplate_SXML;
  svdlgSaveDialog.DefaultExt  := extSXML;
end;

procedure Tfrmmain.PrepareDialogs();
begin
  srchdlgSearch  := TUKTSearchTextDialog.Create(nil);
  srchdlgReplace := TUKTReplaceTextDialog.Create(nil);
end;

procedure Tfrmmain.PrepareDocumentManager();
begin
  // create document file management
  Document := TCustomUKTANSIXMLDocument.Create(Self);

  Document.AskOverwrite := true;

  // which filename extensions (sufixes) will be used
  Document.ExtNew    := wldSXML;
  Document.ExtNewAs  := wldTemplate_SXML;
  Document.ExtOpen   := wldSXML;
  Document.ExtSave   := wldSXML;
  Document.ExtSaveAs := wldSXML;

  // asign event-handlers,
  // @to-do: change to design time, later
  Document.BeforeNewFile   :=
    {$IFNDEF DELPHI}@{$ENDIF}DocumentBeforeNewFile;
  Document.AfterNewFile    :=
    {$IFNDEF DELPHI}@{$ENDIF}DocumentAfterNewFile;

  Document.BeforeNewAsFile :=
    {$IFNDEF DELPHI}@{$ENDIF}DocumentBeforeNewAsFile;
  Document.AfterNewAsFile  :=
    {$IFNDEF DELPHI}@{$ENDIF}DocumentAfterNewAsFile;

  Document.BeforeOpenFile  :=
    {$IFNDEF DELPHI}@{$ENDIF}DocumentBeforeOpenFile;
  Document.AfterOpenFile   :=
    {$IFNDEF DELPHI}@{$ENDIF}DocumentAfterOpenFile;

  Document.AfterSaveFile   :=
    {$IFNDEF DELPHI}@{$ENDIF}DocumentAfterSaveFile;
end;

procedure Tfrmmain.PrepareTreeview();
begin
  MainTreeview := TCustomUKTSXMLPanelTreeView.Create(Self);
  MainTreeview.Activated:=true;

  MainTreeview.ShowRoot  := TRUE;
  MainTreeview.Align:=alClient;
  MainTreeview.BorderStyle := bsNone;
  MainTreeview.BorderWidth := 0;
  //MainTreeview.BorderSpacing := TControlBorderSpacing;
  MainTreeview.HideFocus := false;

  Self.ClientPanel.InsertControl(MainTreeview);
  MainTreeview.SetFocus();
  Application.ProcessMessages();

  Document.TreeContainer.InsertClient(MainTreeview);
end;

procedure Tfrmmain.PrepareResourcesMenuBar();
begin
  // --> menu bar*s captions:
  miMainFile.Caption       := resmiMainFile_Caption;
  miMainEdit.Caption       := resmiMainEdit_Caption;
  miMainSearch.Caption     := resmiMainSearch_Caption;
  miMainView.Caption       := resmiMainView_Caption;
  miMainTools.Caption      := resmiMainTools_Caption;
  miMainTreeview.Caption   := resmiMainTreeview_Caption;
  miMainTags.Caption       := resmiMainTags_Caption;
  miMainHelp.Caption       := resmiMainHelp_Caption;

  // --> menu bar*s file captions:
  miFileNew.Caption         := resmiFileNew_Caption;
  miFileNewAs.Caption       := resmiFileNewAs_Caption;
  miFileOpen.Caption        := resmiFileOpen_Caption;
  miFileSave.Caption        := resmiFileSave_Caption;
  miFileSaveAs.Caption      := resmiFileSaveAs_Caption;
  miFileSavePreview.Caption := resmiFileSavePreview_Caption;
  miFileSaveRename.Caption  := resmiFileSaveRename_Caption;
  miFileSaveCopyAs.Caption  := resmiFileSaveCopyAs_Caption;
  miFileProperties.Caption  := resmiFileProperties_Caption;
  miFileClose.Caption       := resmiFileClose_Caption;
  miFileExit.Caption        := resmiFileExit_Caption;

  // --> menu bar*s file hints:
  miFileNew.Hint         := resmiFileNew_Hint;
  miFileNewAs.Hint       := resmiFileNewAs_Hint;
  miFileOpen.Hint        := resmiFileOpen_Hint;
  miFileSave.Hint        := resmiFileSave_Hint;
  miFileSaveAs.Hint      := resmiFileSaveAs_Hint;
  miFileSavePreview.Hint := resmiFileSavePreview_Hint;
  miFileSaveRename.Hint  := resmiFileSaveRename_Hint;
  miFileSaveCopyAs.Hint  := resmiFileSaveCopyAs_Hint;
  miFileProperties.Hint  := resmiFileProperties_Hint;
  miFileClose.Hint       := resmiFileClose_Hint;
  miFileExit.Hint        := resmiFileExit_Hint;
end;

procedure Tfrmmain.PrepareResourcesOther();
var ACaption: string;
begin
  ACaption := uktstrings.TrimCopy(resAddressLabel_Caption);
  ACaption := uktstrings.PadPosfixCopy(ACaption, ':');

  AddressLabel.Caption := ACaption;
end;

procedure Tfrmmain.PrepareResources();
begin
  PrepareResourcesMenuBar();
  PrepareResourcesOther();
end;

procedure Tfrmmain.RebuiltTreeview();
var AClient: IUKTMessageClient;
begin
  if (Self.MainTreeview <> nil) then
  begin
    AClient := MainTreeview;
    Document.TreeContainer.RemoveClient(AClient);

    MainTreeview.Free();
    //Self.tbshVisual.RemoveControl(MainTreeview);
    Self.MainTreeview := nil;

    //Self.TreeContainer.Destroy();
    //Self.TreeContainer := nil;
  end;

  PrepareTreeview();
end;

end.

