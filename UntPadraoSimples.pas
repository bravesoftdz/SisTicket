unit UntPadraoSimples;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.ToolWin, System.ImageList, Vcl.ImgList;

type
  TFrmPadraoSimples = class(TForm)
    Panel1: TPanel;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ImageList1: TImageList;
    ImageList2: TImageList;
    ImageList3: TImageList;
    ToolBar1: TToolBar;
    btn_inserir: TToolButton;
    btn_editar: TToolButton;
    btn_excluir: TToolButton;
    ToolButton4: TToolButton;
    btn_imprimir: TToolButton;
    btn_sair: TToolButton;
    ToolButton5: TToolButton;
    Panel2: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    FDTable1: TFDTable;
    procedure Edit1Change(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPadraoSimples: TFrmPadraoSimples;

implementation

{$R *.dfm}

uses UntDM;

procedure TFrmPadraoSimples.Edit1Change(Sender: TObject);
begin
  FDTable1.Locate('descricao', Edit1.Text, [loCaseInsensitive,loPartialKey]);
end;

procedure TFrmPadraoSimples.FormActivate(Sender: TObject);
begin
  FDTable1.Close;
  FDTable1.Open();
end;

procedure TFrmPadraoSimples.btn_excluirClick(Sender: TObject);
var confExcl: integer;
begin
  confExcl:= Application.MessageBox('Confirma a exclus�o deste registro?', 'Aten��o', MB_YESNO+MB_DEFBUTTON2+MB_ICONQUESTION);

  if confExcl = IDYES then
  begin
    FDTable1.Delete;

    Application.MessageBox('Registro exclu�do com sucesso.', 'Informa��o', MB_OK+MB_ICONINFORMATION);
  end
  else
    Application.MessageBox('A exclus�o do registro do registro foi abortada.', 'Informa��o', MB_OK+MB_ICONERROR);
end;

procedure TFrmPadraoSimples.btn_sairClick(Sender: TObject);
begin
  Close;
end;

end.
