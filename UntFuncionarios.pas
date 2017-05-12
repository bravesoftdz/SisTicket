unit UntFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntPadrao1, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.Mask;

type
  TFrmFuncionarios = class(TFrmPadrao1)
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Email: TLabel;
    Telefone: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    FDQryDepto: TFDQuery;
    DSDepto: TDataSource;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    FDTabelaid: TFDAutoIncField;
    FDTabelanome: TStringField;
    FDTabeladata_nasc: TStringField;
    FDTabelaemail: TStringField;
    FDTabelatelefone: TStringField;
    FDTabelacelular: TStringField;
    FDTabelaramal: TStringField;
    FDTabelaid_departamento: TIntegerField;
    FDTabelastatus: TStringField;
    FDTabeladata_inc: TDateField;
    FDTabeladata_alt: TDateField;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    EdtSenhaConfirma: TEdit;
    FDTabelacargo: TStringField;
    FDTabelausuario: TStringField;
    FDTabelasenha: TStringField;
    FDTabelafk_id_nivel: TIntegerField;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    ImgOk: TImage;
    ImgErro: TImage;
    DBRadioGroup1: TDBRadioGroup;
    Label13: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EdtSenhaConfirmaExit(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure EdtSenhaConfirmaEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFuncionarios: TFrmFuncionarios;

implementation

{$R *.dfm}

uses UntDM, UntDepartamento;





procedure TFrmFuncionarios.btn_salvarClick(Sender: TObject);
begin
    if (DBEdit9.Text='') or (DBEdit10.Text = '') or (DBEdit1.Text = '') or (DBEdit2.Text = '') or (DBEdit3.Text = '')
    and (DBEdit4.Text = '') or (DBEdit11.Text = '') then
    showmessage ('Verifique as informações!')
    else
  inherited;

end;

procedure TFrmFuncionarios.EdtSenhaConfirmaEnter(Sender: TObject);
begin
  inherited;
          ImgOk.Visible := False;
          ImgErro.Visible := False;
          label13.Visible := False;
end;

procedure TFrmFuncionarios.EdtSenhaConfirmaExit(Sender: TObject);
begin
  inherited;
      if (EdtSenhaConfirma.Text = DBEdit10.Text) then
        begin
          ImgOk.Visible := True;
          ImgErro.Visible := False;
          label13.Visible := False;
        end
      else
        begin
          ImgErro.Visible := True;
          ImgOk.Visible := False;
          label13.Visible := True;
        end;
end;

procedure TFrmFuncionarios.FormActivate(Sender: TObject);
begin
  inherited;
  FDTabela.Close;
  FDTabela.Open();
  FDQryDepto.Close;
  FDQryDepto.Open();
end;


procedure TFrmFuncionarios.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  FrmDepartamento.ShowModal;
end;

end.
