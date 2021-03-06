unit UntCadDepartamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntCadSimples, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TFrmCadDepartamento = class(TFrmCadSimples)
    Image1: TImage;
    procedure btn_salvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadDepartamento: TFrmCadDepartamento;

implementation

{$R *.dfm}

uses UntDepartamento;


procedure TFrmCadDepartamento.btn_salvarClick(Sender: TObject);
begin
  inherited;
  if FrmDepartamento.FDTable1.Active = False then
  begin
    FrmDepartamento.FDTable1.Open();
  end;

  FrmDepartamento.FDTable1.Insert;

  Application.MessageBox('O registro foi inclu�do ou alterado com sucesso.', 'Informa��o', MB_OK+MB_ICONINFORMATION);

  btn_salvar.Enabled:= false;
  btn_cancelar.Enabled:= false;
  btn_sair.Enabled:= true;
  PnlFicha.Enabled:= false;

end;

end.
