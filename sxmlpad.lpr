program sxmlpad;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, ufrmmain, udmMainShared, uktansisxmldocs, uresmain, 
uktsxmlpaneltreeviews, uktansisxmldocres;

{$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(Tfrmmain, frmmain);
  Application.CreateForm(TdmMainShared, dmMainShared);
  Application.Run;
end.

