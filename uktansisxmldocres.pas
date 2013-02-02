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

unit uktansisxmldocres;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,
  dummy;

{$INCLUDE 'sxmlpad_language.inc'}

{$IFDEF sxmlpad_language_english}
resourcestring

  // --> common tags captions:
  resSharedTagDoc   = '[DOCUMENT]';
  resSharedTagMain  = 'main';
  resSharedTagSpace = '[SPACE]';
  resSharedTagTab   = '[TAB]';
  resSharedTagEoLn  = '[END-OF-LINE]';
  resSharedTagEoPg  = '[END-OF-PAGE]';
  resSharedTagEoF   = '[END-OF-FILE]';
{$ENDIF}

{$IFDEF sxmlpad_language_spanisheurope}
resourcestring

  // --> common tags captions:
  resSharedTagDoc   = '[DOCUMENTO]';
  resSharedTagMain  = 'main';
  resSharedTagSpace = '[ESPACIO]';
  resSharedTagTab   = '[TABULADOR]';
  resSharedTagEoLn  = '[FIN-DE-LINEA]';
  resSharedTagEoPg  = '[FIN-DE-PAGINA]';
  resSharedTagEoF   = '[FIN-DE-ARCHIVO]';
{$ENDIF}

{$IFDEF sxmlpad_language_spanishlatam}
resourcestring

  // --> common tags captions:
  resSharedTagDoc   = '[DOCUMENTO]';
  resSharedTagMain  = 'main';
  resSharedTagSpace = '[ESPACIO]';
  resSharedTagTab   = '[TABULADOR]';
  resSharedTagEoLn  = '[FIN-DE-LINEA]';
  resSharedTagEoPg  = '[FIN-DE-PAGINA]';
  resSharedTagEoF   = '[FIN-DE-ARCHIVO]';
{$ENDIF}


implementation

end.

