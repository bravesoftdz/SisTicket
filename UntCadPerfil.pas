unit UntCadPerfil;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntPadrao1, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin;

type
  TFrmCadPerfil = class(TFrmPadrao1)
    FDTabelaid: TIntegerField;
    FDTabeladata_inc: TSQLTimeStampField;
    FDTabeladata_alt: TSQLTimeStampField;
    FDTabelastatus: TStringField;
    FDTabelaper_descricao: TStringField;
    FDTabelaper_ocultar: TStringField;
    FDTabelaper_perfil: TStringField;
    FDTabelaper_perfil_i: TStringField;
    FDTabelaper_perfil_a: TStringField;
    FDTabelaper_perfil_e: TStringField;
    FDTabelaper_funcio: TStringField;
    FDTabelaper_funcio_i: TStringField;
    FDTabelaper_funcio_a: TStringField;
    FDTabelaper_funcio_e: TStringField;
    PanelSup: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadPerfil: TFrmCadPerfil;

implementation

{$R *.dfm}

uses UntDM;

end.
