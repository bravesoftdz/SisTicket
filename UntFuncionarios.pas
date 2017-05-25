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
    EdtNome: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Email: TLabel;
    Telefone: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EdtNasc: TDBEdit;
    EdtEmail: TDBEdit;
    EdtTel: TDBEdit;
    EdtRamal: TDBEdit;
    EdtCelular: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    FDQryDepto: TFDQuery;
    DSDepto: TDataSource;
    Label4: TLabel;
    Label5: TLabel;
    EdtDataAlt: TDBEdit;
    EdtDataInc: TDBEdit;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    ImgOk: TImage;
    ImgErro: TImage;
    Label13: TLabel;
    EdtSenha: TDBEdit;
    EdtUser: TDBEdit;
    EdtSenhaConfirma: TEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label12: TLabel;
    EdtCargo: TDBEdit;
    FDTabelaid: TFDAutoIncField;
    FDTabeladata_inc: TDateField;
    FDTabeladata_alt: TDateField;
    FDTabelanome: TStringField;
    FDTabeladata_nasc: TStringField;
    FDTabelaemail: TStringField;
    FDTabelatelefone: TStringField;
    FDTabelacelular: TStringField;
    FDTabelaramal: TStringField;
    FDTabelaid_departamento: TIntegerField;
    FDTabelastatus: TStringField;
    FDTabelacargo: TStringField;
    FDTabelausuario: TStringField;
    FDTabelasenha: TStringField;
    FDTabelafk_id_nivel: TIntegerField;
    SpeedButton2: TSpeedButton;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EdtSenhaConfirmaExit(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure EdtSenhaConfirmaEnter(Sender: TObject);
    procedure btn_EditarClick(Sender: TObject);
    procedure btn_InserirClick(Sender: TObject);
    procedure EdtSenhaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFuncionarios: TFrmFuncionarios;


implementation

{$R *.dfm}

uses UntDM, UntDepartamento, UntLogin;





procedure TFrmFuncionarios.btn_EditarClick(Sender: TObject);
  begin
    inherited;
    GroupBox1.Enabled := true;
    GroupBox2.Enabled := true;
  end;

procedure TFrmFuncionarios.btn_InserirClick(Sender: TObject);
  begin
    inherited;
    GroupBox1.Enabled := true;
    GroupBox2.Enabled := true;
    EdtNome.SetFocus;
    EdtSenhaConfirma.Clear;
  end;

procedure TFrmFuncionarios.btn_salvarClick(Sender: TObject);
  begin
      if (EdtNome.Text <> '') AND (EdtNasc.Text <> '') AND (EdtEmail.Text <> '') AND (EdtUser.Text <> '') AND (EdtCargo.Text <> '')
      AND (EdtTel.Text <> '') AND (EdtSenha.Text <> '') then
      inherited
      else
         begin
          showmessage ('Verifique as informações obrigatórias!')
         end;
      GroupBox1.Enabled := true;
      GroupBox2.Enabled := true;
  end;

procedure TFrmFuncionarios.EdtSenhaConfirmaEnter(Sender: TObject);
  begin
            ImgOk.Visible := False;
            ImgErro.Visible := False;
            label13.Visible := False;
  end;

procedure TFrmFuncionarios.EdtSenhaConfirmaExit(Sender: TObject);
  begin
        if (EdtSenhaConfirma.Text = EdtSenha.Text) then
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
          refresh;
  end;


procedure TFrmFuncionarios.EdtSenhaExit(Sender: TObject);
begin
  inherited;
  begin
        if (EdtSenhaConfirma.Text = EdtSenha.Text) then
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
          refresh;
  end;
end;


procedure TFrmFuncionarios.FormActivate(Sender: TObject);
  begin
    inherited;
    FDTabela.Close;
    FDTabela.Open();
    FDQryDepto.Close;
    FDQryDepto.Open();
    EdtSenhaConfirma.Text := EdtSenha.Text;
  end;


procedure TFrmFuncionarios.SpeedButton1Click(Sender: TObject);
  begin
    inherited;
    if (nivel = 1) then
      FrmDepartamento.ShowModal
      else
      showmessage ('Usuário não tem permissão de Incluir departamento, Consulte um Administrador')
  end;

end.
