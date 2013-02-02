unit udmMainShared;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Controls;

type

  { TdmMainShared }

  TdmMainShared = class(TDataModule)
    MainImages: TImageList;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  dmMainShared: TdmMainShared;

implementation

{$R *.lfm}

end.

