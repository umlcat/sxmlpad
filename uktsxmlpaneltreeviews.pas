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

unit uktsxmlpaneltreeviews;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  ukttreecntrs,
  uktmsgtypes,
  uktmsgtreecntrs,
  uktguidstrs,
  uktpaneltreeviews,
  uktmsgpaneltreeviews,
  uktxmlfileansisymbols,
  uktxmlfiletreenodetokens,
  uktsxmltreecntrs,
  dummy;

type

(* TCustomUKTSXMLPanelTreeView *)

  TCustomUKTSXMLPanelTreeView = class(TCustomUKTMsgPanelTreeView)
  private
    (* Private declarations *)
  protected
    (* Protected declarations *)

    procedure InsertNode
      (const AContainerParentNode: TUKTContainerTreeNode); override;

    procedure UpdateStateUponToken
      (var AContainerNode: TUKTSXMLTreeNode);

    procedure TreeNodeAfterInsertHandler
      (const AMsgRec: TUKTMessageParamsRecord); override;

    procedure TreeNodeAfterChangeSymbol
      (const AMsgRec: TUKTMessageParamsRecord);
    procedure TreeNodeAfterChangeTextValue
      (const AMsgRec: TUKTMessageParamsRecord);
    procedure TreeNodeAfterChangeTreeToken
      (const AMsgRec: TUKTMessageParamsRecord);

    procedure AssignHandlers(); override;
  public
    (* Public declarations *)
  end;


implementation

(* TCustomUKTSXMLPanelTreeView *)

procedure TCustomUKTSXMLPanelTreeView.InsertNode
  (const AContainerParentNode: TUKTContainerTreeNode);
var ATreeviewParentNode: TUKTMsgPanelTreeViewNode;
begin
  // find the node from treeview that references the given parent node,
  // from the container
  ATreeviewParentNode := NodeOf(AContainerParentNode);
  if (ATreeviewParentNode <> nil) then
  begin
    // remove all subitems
    ATreeviewParentNode.Empty();

    // refresh subitems
    //ATreeviewParentNode.InternalExplore();

    //ATreeviewParentNode.Hide();

    ATreeviewParentNode.UpdateExpand();
  end;
end;

procedure TCustomUKTSXMLPanelTreeView.UpdateStateUponToken
  (var AContainerNode: TUKTSXMLTreeNode);
var ATreeviewNode: TUKTMsgPanelTreeViewNode;
begin
  ATreeviewNode := Self.NodeOf(AContainerNode);
  if (ATreeviewNode <> nil) then
  begin
    case (AContainerNode.TreeToken) of
      uktxmlfiletreenodetokens.xmlfiletrntkDocument:
        begin
          Self.DoNothing();
        end;

      uktxmlfiletreenodetokens.xmlfiletrntkEoF:
        begin
          Self.DoNothing();
        end;
      uktxmlfiletreenodetokens.xmlfiletrntkEoPg:
        begin
          Self.DoNothing();
        end;
      uktxmlfiletreenodetokens.xmlfiletrntkEoLn:
        begin
          Self.DoNothing();
        end;

      uktxmlfiletreenodetokens.xmlfiletrntkTab:
        begin
          Self.DoNothing();
        end;
      uktxmlfiletreenodetokens.xmlfiletrntkSpace:
        begin
          Self.DoNothing();
        end;

      uktxmlfiletreenodetokens.xmlfiletrntkBlock:
        begin
          Self.DoNothing();
        end;
      uktxmlfiletreenodetokens.xmlfiletrntkSingle:
        begin
          // force change to "empty" status
          ATreeviewNode.UpdateExpand();
          ATreeviewNode.Explore();
        end;

      uktxmlfiletreenodetokens.xmlfiletrntkComment:
        begin
          Self.DoNothing();
        end;
      uktxmlfiletreenodetokens.xmlfiletrntkEncoding:
        begin
          Self.DoNothing();
        end;

      uktxmlfiletreenodetokens.xmlfiletrntkText:
        begin
          Self.DoNothing();
        end;

      else
        begin
          Self.DoNothing();
        end;
    end;
  end;
end;

procedure TCustomUKTSXMLPanelTreeView.TreeNodeAfterInsertHandler
  (const AMsgRec: TUKTMessageParamsRecord);
var AContainerParentNode, AContainerNewNode: TUKTSXMLTreeNode;
begin
  AContainerParentNode := TUKTSXMLTreeNode(AMsgRec.Sender);
  AContainerNewNode    := TUKTSXMLTreeNode(AMsgRec.Param);
  if (AContainerNewNode <> nil) then
  begin
    if (AContainerNewNode.IsRoot()) then
    begin
      InsertRootNode(AContainerNewNode);
    end else
    begin
      InsertNode(AContainerParentNode);
    end;
  end;
end;

procedure TCustomUKTSXMLPanelTreeView.TreeNodeAfterChangeSymbol
  (const AMsgRec: TUKTMessageParamsRecord);
var AContainerNode: TUKTSXMLTreeNode;
begin
  AContainerNode := TUKTSXMLTreeNode(AMsgRec.Sender);
  UpdateStateUponToken(AContainerNode);
end;

procedure TCustomUKTSXMLPanelTreeView.TreeNodeAfterChangeTextValue
  (const AMsgRec: TUKTMessageParamsRecord);
begin
  //
end;

procedure TCustomUKTSXMLPanelTreeView.TreeNodeAfterChangeTreeToken
  (const AMsgRec: TUKTMessageParamsRecord);
var AContainerNode: TUKTSXMLTreeNode;
begin
  AContainerNode := TUKTSXMLTreeNode(AMsgRec.Sender);
  UpdateStateUponToken(AContainerNode);
end;

procedure TCustomUKTSXMLPanelTreeView.AssignHandlers();
var AMsgID: TGUID;
begin
  // --> keep previous message-handlers
  inherited AssignHandlers();

  // --> declare additional message-handlers

  uktguidstrs.DoubleStrToGUID
    (msgTreeNodeAfterChangeSymbol, AMsgID);
  FMsgHandlerList.Insert
    (AMsgID, {$IFDEF FPC}@{$ENDIF}TreeNodeAfterChangeSymbol);

  uktguidstrs.DoubleStrToGUID
    (msgTreeNodeAfterChangeTextValue, AMsgID);
  FMsgHandlerList.Insert
    (AMsgID, {$IFDEF FPC}@{$ENDIF}TreeNodeAfterChangeTextValue);

  uktguidstrs.DoubleStrToGUID
    (msgTreeNodeAfterChangeTreeToken, AMsgID);
  FMsgHandlerList.Insert
    (AMsgID, {$IFDEF FPC}@{$ENDIF}TreeNodeAfterChangeTreeToken);
end;

end.

