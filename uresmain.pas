unit uresmain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,
  dummy;

{$INCLUDE 'sxmlpad_language.inc'}

{$IFDEF sxmlpad_language_english}
resourcestring
  // --> menu bar*s captions:
  resmiMainFile_Caption       = '&File';
  resmiMainEdit_Caption       = '&Edit';
  resmiMainSearch_Caption     = '&Search';
  resmiMainView_Caption       = '&View';
  resmiMainTools_Caption      = '&Tools';
  resmiMainTreeview_Caption   = 'Treeview';
  resmiMainTags_Caption       = 'Tags';
  resmiMainHelp_Caption       = 'Help';

  // --> menu bar*s file captions:
  resmiFileNew_Caption         = 'New ...';
  resmiFileNewAs_Caption       = 'New with Template ...';
  resmiFileOpen_Caption        = 'Open ...';
  resmiFileSave_Caption        = 'Save ...';
  resmiFileSaveAs_Caption      = 'Save As ...';
  resmiFileSavePreview_Caption = 'Save Preview ...';
  resmiFileSaveRename_Caption  = 'Rename File As ...';
  resmiFileSaveCopyAs_Caption  = 'Save a Copy As ...';
  resmiFileProperties_Caption  = 'File &Properties...';
  resmiFileClose_Caption       = 'Close';
  resmiFileExit_Caption        = 'Exit';


  // --> menu bar*s file hints:
  resmiFileNew_Hint         = 'New ...';
  resmiFileNewAs_Hint       = 'New with Template ...';
  resmiFileOpen_Hint        = 'Open ...';
  resmiFileSave_Hint        = 'Save ...';
  resmiFileSaveAs_Hint      = 'Save As ...';
  resmiFileSavePreview_Hint = 'Save Preview ...';
  resmiFileSaveRename_Hint  = 'Rename File As ...';
  resmiFileSaveCopyAs_Hint  = 'Save a Copy As ...';
  resmiFileProperties_Hint  = 'File &Properties...';
  resmiFileClose_Hint       = 'Close';
  resmiFileExit_Hint        = 'Exit';

  // --> menu bar*s "edit" menu captions:
  resmiEditUndo_Caption           = 'Undo';
  resmiEditRedo_Caption           = 'Redo';
  resmiEditSelectAll_Caption      = 'Select All';
  resmiEditSelectNone_Caption     = 'Cancel Selection';
  resmiEditCut_Caption            = 'Cut';
  resmiEditCopy_Caption           = 'Copy';
  resmiEditPaste_Caption          = 'Paste';
  resmiEditDuplicate_Caption      = 'Paste Duplicate';
  resmiEditClearClipboard_Caption = 'Clear Clipboard';

  // --> menu bar*s "search" menu captions:
  miSearchFind.Caption         := resmiSearchFind_Caption;
  miSearchFindAgain.Caption    := resmiSearchFindAgain_Caption;
  miSearchReplace.Caption      := resmiSearchReplace_Caption;
  miSearchReplaceAgain.Caption := resmiSearchReplaceAgain_Caption;

  // --> menu bar*s "view" menu captions:
  resmiViewToolBarsConfigure_Caption = 'Configure ToolBars...';
  resmiViewToolBarQuick_Caption      = 'Toggle Quick ToolBar';
  resmiViewToolBarFile_Caption       = 'Toggle File ToolBar';
  resmiViewToolBarEditSearch_Caption = 'Toggle EditSearch ToolBar';
  resmiViewToolBarTreeview_Caption   = 'Toogle Treeview ToolBar';
  resmiViewFontSizeReduce_Caption    = 'Reduce Font Size';
  resmiViewFontSizeIncrease_Caption  = 'Increase Font Size';
  resmiViewToggleAddressbar_Caption  = 'Toggle Addressbar';

  // --> menu bar*s "tools" menu captions:
  resmiToolsConfigureTools_Caption = 'Configure Tools ...';
  resmiToolsExportPreview_Caption  = 'Export Preview ...';

  // --> menu bar*s "treeview" menu captions:
  resmiTreeviewExplore_Caption          = 'Explore Treeview';
  resmiTreeviewExpand_Caption           = 'Expand Treeview';
  resmiTreeviewCollapse_Caption         = 'Collapse Treeview';
  resmiTreeviewEmpty_Caption            = 'Empty Treeview';
  resmiTreeviewItemSelectOff_Caption    = 'Treeview Item Select Off';
  resmiTreeviewItemSelectOn_Caption     = 'Treeview Item Select On';
  resmiTreeviewItemInsertLast_Caption   = 'Insert Last Item to Treeview ...';
  resmiTreeviewItemDelete_Caption       = 'Delete Item from Treeview ...';
  resmiTreeviewItemProperties_Caption   = 'Edit Properties from Treeview Item...';
  resmiTreeviewItemInsertBefore_Caption = 'Insert Item Before ...';
  resmiTreeviewItemInsertAfter_Caption  = 'Insert Item After ...';

  // --> menu bar*s "tags" menu captions:
  resmiTagsNewBlockTag_Caption          = 'New Block Tag...';
  resmiTagsNewSingleTag_Caption         = 'New Single Tag...';
  resmiTagsNewCommentTag_Caption        = 'New Comment Tag...';
  resmiTagsNewTextTag_Caption           = 'New Text Tag...';

  // --> menu bar*s "help" menu captions:
  resmiHelpAbout_Caption       = 'About ...';

  resAddressLabel_Caption  = 'Path:';

  resCannotRemoveNode = 'Cannot remove this node';

  resAbout_Contents = 'About sxmlpad.';

  resTagsWithoutDelimiters = 'Tags without Delimiters';
  resCommentWithoutDelimiters = 'Comment without Delimiters';

  resNewElementTitle    = 'New Element';
  resNewElementContents = 'Select Element Type:';

  resTagBlockInsert = 'Insert Block Tag';
  resTagBlockEdit   = 'Edit Block Tag';

  resTagSingleInsert = 'Insert Single Tag';
  resTagSingleEdit   = 'Edit Single Tag';

  resTagCommentInsert = 'Insert Comment Tag';
  resTagCommentEdit   = 'Edit Comment Tag';

  resTagTextInsert    = 'Insert Text';
  resTagTextEdit      = 'Edit Text';
  resTagTextCapture   = 'Capture Text';

  // --> Dialogs:
  resOpenDialog_Title = 'Open an existing file';
  resNewAsDialog_Title = 'Create New file with a template';
  resSaveDialog_Title = 'Save file as';
  resRenameAsDialog_Title = 'Rename file as';
  resSaveCopyAsDialog_Title = 'Save a copy of file as';
{$ENDIF}

{$IFDEF sxmlpad_language_spanisheurope}
resourcestring
  // --> menu bar*s captions:
  resmiMainFile_Caption       = '&Fichero';
  resmiMainEdit_Caption       = '&Edicion';
  resmiMainSearch_Caption     = 'Bu&squeda';
  resmiMainView_Caption       = '&Ver';
  resmiMainTools_Caption      = 'Herramien&tas';
  resmiMainTreeview_Caption   = 'Vistaarbol';
  resmiMainTags_Caption       = 'Marcadores';
  resmiMainHelp_Caption       = 'Ayuda';

  // --> menu bar*s file captions:
  resmiFileNew_Caption         = 'Nuevo ...';
  resmiFileNewAs_Caption       = 'Nuevo con Plantilla ...';
  resmiFileOpen_Caption        = 'Abrir ...';
  resmiFileSave_Caption        = 'Guardar ...';
  resmiFileSaveAs_Caption      = 'Guardar Como ...';
  resmiFileSavePreview_Caption = 'Vista Previa de Guardar ...';
  resmiFileSaveRename_Caption  = 'Guardar Fichero Como ...';
  resmiFileSaveCopyAs_Caption  = 'Guardar una copia Como ...';
  resmiFileProperties_Caption  = '&Propiedades de Fichero...';
  resmiFileClose_Caption       = 'Cerrar';
  resmiFileExit_Caption        = 'Salir';

  // --> menu bar*s file hints:
  resmiFileNew_Hint         = 'Nuevo ...';
  resmiFileNewAs_Hint       = 'Nuevo con Plantilla ...';
  resmiFileOpen_Hint        = 'Abrir ...';
  resmiFileSave_Hint        = 'Guardar ...';
  resmiFileSaveAs_Hint      = 'Guardar Como ...';
  resmiFileSavePreview_Hint = 'Vista Previa de Guardar ...';
  resmiFileSaveRename_Hint  = 'Guardar Fichero Como ...';
  resmiFileSaveCopyAs_Hint  = 'Guardar una copia Como ...';
  resmiFileProperties_Hint  = '&Propiedades de Fichero...';
  resmiFileClose_Hint       = 'Cerrar';
  resmiFileExit_Hint        = 'Salir';

  // --> menu bar*s "edit" menu captions:
  resmiEditUndo_Caption           = 'Deshacer';
  resmiEditRedo_Caption           = 'Rehacer';
  resmiEditSelectAll_Caption      = 'Seleccionar Todo';
  resmiEditSelectNone_Caption     = 'Cancelar Seleccion';
  resmiEditCut_Caption            = 'Cortar';
  resmiEditCopy_Caption           = 'Copiar';
  resmiEditPaste_Caption          = 'Pegar';
  resmiEditDuplicate_Caption      = 'Pegar Duplicado';
  resmiEditClearClipboard_Caption = 'Limpiar Portapapeles';

  // --> menu bar*s "search" menu captions:
  resmiSearchFind_Caption         = 'Buscar ...';
  resmiSearchFindAgain_Caption    = 'Buscar de nuevo ...';
  resmiSearchReplace_Caption      = 'Reemplazar ...';
  resmiSearchReplaceAgain_Caption = 'Reemplazar de nuevo ...';

  // --> menu bar*s "view" menu captions:
  resmiViewToolBarsConfigure_Caption = 'Configurar Barras Herramientas...';
  resmiViewToolBarQuick_Caption      = 'Mostrar/Ocultar Barra Rapida';
  resmiViewToolBarFile_Caption       = 'Mostrar/Ocultar Barra Archivo';
  resmiViewToolBarEditSearch_Caption = 'Mostrar/Ocultar Barra EdicionBusqueda';
  resmiViewToolBarTreeview_Caption   = 'Mostrar/Ocultar Barra VistaArbol';
  resmiViewFontSizeReduce_Caption    = 'Reducir Tamaño Letra';
  resmiViewFontSizeIncrease_Caption  = 'Agrandar Tamaño Letra';
  resmiViewToggleAddressbar_Caption  = 'Mostrar/Ocultar Barra Direccion';

  // --> menu bar*s "tools" menu captions:
  resmiToolsConfigureTools_Caption = 'Configurar Herramientas ...';
  resmiToolsExportPreview_Caption  = 'Vista Previa Exportar ...';

  // --> menu bar*s "treeview" menu captions:
  resmiTreeviewExplore_Caption          = 'Explorar VistaArbol';
  resmiTreeviewExpand_Caption           = 'Expandir VistaArbol';
  resmiTreeviewCollapse_Caption         = 'Colapsar VistaArbol';
  resmiTreeviewEmpty_Caption            = 'Vaciar VistaArbol';
  resmiTreeviewItemSelectOff_Caption    = 'Marcar Seleccion elemento';
  resmiTreeviewItemSelectOn_Caption     = 'Desmarcar Seleccion elemento';
  resmiTreeviewItemInsertLast_Caption   = 'Insertar ultimo elemento ...';
  resmiTreeviewItemDelete_Caption       = 'Eliminar elemento ...';
  resmiTreeviewItemProperties_Caption   = 'Editar Propiedades de elemento ...';
  resmiTreeviewItemInsertBefore_Caption = 'Insertar elemento antes ...';
  resmiTreeviewItemInsertAfter_Caption  = 'Insertar elemento despues ...';

  // --> menu bar*s "tags" menu captions:
  resmiTagsNewBlockTag_Caption          = 'Nueva Etiqueta Bloque...';
  resmiTagsNewSingleTag_Caption         = 'Nueva Etiqueta Sencilla...';
  resmiTagsNewCommentTag_Caption        = 'Nueva Etiqueta Comentario...';
  resmiTagsNewTextTag_Caption           = 'Nueva Etiqueta Texto...';

  // --> menu bar*s "help" menu captions:
  resmiHelpAbout_Caption       = 'Acerca ...';


  resAddressLabel_Caption  = 'Ruta:';

  resCannotRemoveNode = 'No se puede eliminar este elemento';

  resAbout_Contents = 'Acerca de sxmlpad.';

  resTagsWithoutDelimiters = 'Marcador sin delimitadores';
  resCommentWithoutDelimiters = 'Comentario sin delimitadores';

  resNewElementTitle    = 'Nuevo Elemento';
  resNewElementContents = 'Seleccione Tipo de Elemento:';

  resTagBlockInsert = 'Insertar Bloque de Marcadores';
  resTagBlockEdit   = 'Editar Bloque de Marcadores';

  resTagSingleInsert = 'Insertar Marcador Simple';
  resTagSingleEdit   = 'Editar Marcador Simple';

  resTagCommentInsert = 'Insertar Marcador de Comentario';
  resTagCommentEdit   = 'Editar Marcador de Comentario';

  resTagTextInsert    = 'Insertar Solo Texto';
  resTagTextEdit      = 'Editar Texto';
  resTagTextCapture   = 'Capturar Texto';

  // --> Dialogs:
  resOpenDialog_Title = 'Abrir un archivo existente';
  resNewAsDialog_Title = 'Crear archivo nuevo con plantilla';
  resSaveDialog_Title = 'Guardar archivo como';
  resRenameAsDialog_Title = 'Renombrar archivo como';
  resSaveCopyAsDialog_Title = 'Guardar una copia de un archivo como';
{$ENDIF}

{$IFDEF sxmlpad_language_spanishlatam}
resourcestring
  // --> menu bar*s captions:
  resmiMainFile_Caption       = 'Archivo';
  resmiMainEdit_Caption       = '&Edicion';
  resmiMainSearch_Caption     = 'Bu&squeda';
  resmiMainView_Caption       = '&Ver';
  resmiMainTools_Caption      = 'Herramien&tas';
  resmiMainTreeview_Caption   = 'Vistaarbol';
  resmiMainTags_Caption       = 'Marcadores';
  resmiMainHelp_Caption       = 'Ayuda';

  // --> menu bar*s file captions:
  resmiFileNew_Caption         = 'Nuevo ...';
  resmiFileNewAs_Caption       = 'Nuevo con Plantilla ...';
  resmiFileOpen_Caption        = 'Abrir ...';
  resmiFileSave_Caption        = 'Guardar ...';
  resmiFileSaveAs_Caption      = 'Guardar Como ...';
  resmiFileSavePreview_Caption = 'Vista Previa de Guardar ...';
  resmiFileSaveRename_Caption  = 'Guardar Archivo Como ...';
  resmiFileSaveCopyAs_Caption  = 'Guardar una copia Como ...';
  resmiFileProperties_Caption  = '&Propiedades de Archivo...';
  resmiFileClose_Caption       = 'Cerrar';
  resmiFileExit_Caption        = 'Salir';


  // --> menu bar*s file hints:
  resmiFileNew_Hint         = 'Nuevo ...';
  resmiFileNewAs_Hint       = 'Nuevo con Plantilla ...';
  resmiFileOpen_Hint        = 'Abrir ...';
  resmiFileSave_Hint        = 'Guardar ...';
  resmiFileSaveAs_Hint      = 'Guardar Como ...';
  resmiFileSavePreview_Hint = 'Vista Previa de Guardar ...';
  resmiFileSaveRename_Hint  = 'Guardar Archivo Como ...';
  resmiFileSaveCopyAs_Hint  = 'Guardar una copia Como ...';
  resmiFileProperties_Hint  = '&Propiedades de Archivo...';
  resmiFileClose_Hint       = 'Cerrar';
  resmiFileExit_Hint        = 'Salir';

  // --> menu bar*s "edit" menu captions:
  resmiEditUndo_Caption           = 'Deshacer';
  resmiEditRedo_Caption           = 'Rehacer';
  resmiEditSelectAll_Caption      = 'Seleccionar Todo';
  resmiEditSelectNone_Caption     = 'Cancelar Seleccion';
  resmiEditCut_Caption            = 'Cortar';
  resmiEditCopy_Caption           = 'Copiar';
  resmiEditPaste_Caption          = 'Pegar';
  resmiEditDuplicate_Caption      = 'Pegar Duplicado';
  resmiEditClearClipboard_Caption = 'Limpiar Portapapeles';

  // --> menu bar*s "search" menu captions:
  resmiSearchFind_Caption         = 'Buscar ...';
  resmiSearchFindAgain_Caption    = 'Buscar de nuevo ...';
  resmiSearchReplace_Caption      = 'Reemplazar ...';
  resmiSearchReplaceAgain_Caption = 'Reemplazar de nuevo ...';

  // --> menu bar*s "view" menu captions:
  resmiViewToolBarsConfigure_Caption = 'Configurar Barras Herramientas...';
  resmiViewToolBarQuick_Caption      = 'Mostrar/Ocultar Barra Rapida';
  resmiViewToolBarFile_Caption       = 'Mostrar/Ocultar Barra Archivo';
  resmiViewToolBarEditSearch_Caption = 'Mostrar/Ocultar Barra EdicionBusqueda';
  resmiViewToolBarTreeview_Caption   = 'Mostrar/Ocultar Barra VistaArbol';
  resmiViewFontSizeReduce_Caption    = 'Reducir Tamaño Letra';
  resmiViewFontSizeIncrease_Caption  = 'Agrandar Tamaño Letra';
  resmiViewToggleAddressbar_Caption  = 'Mostrar/Ocultar Barra Direccion';

  // --> menu bar*s "tools" menu captions:
  resmiToolsConfigureTools_Caption = 'Configurar Herramientas ...';
  resmiToolsExportPreview_Caption  = 'Vista Previa Exportar ...';

  // --> menu bar*s "treeview" menu captions:
  resmiTreeviewExplore_Caption          = 'Explorar VistaArbol';
  resmiTreeviewExpand_Caption           = 'Expandir VistaArbol';
  resmiTreeviewCollapse_Caption         = 'Collapsar VistaArbol';
  resmiTreeviewEmpty_Caption            = 'Vaciar VistaArbol';
  resmiTreeviewItemSelectOff_Caption    = 'Marcar Seleccion elemento';
  resmiTreeviewItemSelectOn_Caption     = 'Desmarcar Seleccion elemento';
  resmiTreeviewItemInsertLast_Caption   = 'Insertar ultimo elemento ...';
  resmiTreeviewItemDelete_Caption       = 'Eliminar elemento ...';
  resmiTreeviewItemProperties_Caption   = 'Editar Propiedades de elemento ...';
  resmiTreeviewItemInsertBefore_Caption = 'Insertar elemento antes ...';
  resmiTreeviewItemInsertAfter_Caption  = 'Insertar elemento despues ...';

  // --> menu bar*s "tags" menu captions:
  resmiTagsNewBlockTag_Caption          = 'Nueva Etiqueta Bloque...';
  resmiTagsNewSingleTag_Caption         = 'Nueva Etiqueta Sencilla...';
  resmiTagsNewCommentTag_Caption        = 'Nueva Etiqueta Comentario...';
  resmiTagsNewTextTag_Caption           = 'Nueva Etiqueta Texto...';

  // --> menu bar*s "help" menu captions:
  resmiHelpAbout_Caption       = 'Acerca ...';

  resAddressLabel_Caption  = 'Ruta:';

  resCannotRemoveNode = 'No se puede eliminar este elemento';

  resAbout_Contents = 'Acerca de sxmlpad.';

  resTagsWithoutDelimiters = 'Marcador sin delimitadores';
  resCommentWithoutDelimiters = 'Comentario sin delimitadores';

  resNewElementTitle    = 'Nuevo Elemento';
  resNewElementContents = 'Seleccione Tipo de Elemento:';

  resTagBlockInsert = 'Insertar Bloque de Marcadores';
  resTagBlockEdit   = 'Editar Bloque de Marcadores';

  resTagSingleInsert = 'Insertar Marcador Simple';
  resTagSingleEdit   = 'Editar Marcador Simple';

  resTagCommentInsert = 'Insertar Marcador de Comentario';
  resTagCommentEdit   = 'Editar Marcador de Comentario';

  resTagTextInsert    = 'Insertar Solo Texto';
  resTagTextEdit      = 'Editar Texto';
  resTagTextCapture   = 'Capturar Texto';

  // --> Dialogs:
  resOpenDialog_Title = 'Abrir un archivo existente';
  resNewAsDialog_Title = 'Crear archivo nuevo con plantilla';
  resSaveDialog_Title = 'Guardar archivo como';
  resRenameAsDialog_Title = 'Renombrar archivo como';
  resSaveCopyAsDialog_Title = 'Guardar una copia de un archivo como';
{$ENDIF}

implementation

end.

