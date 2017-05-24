unit UntLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.jpeg;

type
  TFrmLogin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EdtSenha: TEdit;
    EdtNome: TEdit;
    Image1: TImage;
    spbOk: TSpeedButton;
    spbCancelar: TSpeedButton;
    lblStatusLogin: TLabel;
    procedure spbCancelarClick(Sender: TObject);
    procedure spbOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EdtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSenhaKeyPress(Sender: TObject; var Key: Char);
    {procedure EdtNomeChange(Sender: TObject);
    procedure spbOkClick(Sender: TObject);  }
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;
  id_funcio_logado: Integer;

implementation

{$R *.dfm}

uses UntPrincipal, UntDM;

var
  TentaLogin, nivel : Integer;

procedure TFrmLogin.EdtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    EdtSenha.SetFocus;
  end;
end;

procedure TFrmLogin.EdtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    spbOk.Click;
  end;
end;

procedure TFrmLogin.FormActivate(Sender: TObject);
begin
  TentaLogin := 0;
end;

procedure TFrmLogin.spbCancelarClick(Sender: TObject);
begin
Application.Terminate;
end;

procedure TFrmLogin.spbOkClick(Sender: TObject);
var
  mensagem, StrSql, niveldesc: String;
begin
  if (EdtNome.Text <> '') and (EdtSenha.Text <> '') then
  begin
    lblStatusLogin.Font.Color:= clGray;
    lblStatusLogin.Caption:= 'Autenticando usuário...';

    refresh;
    spbOk.Enabled:= False;
    EdtNome.Enabled:= False;
    EdtSenha.Enabled:= False;
    sleep(1000);

    StrSql:= 'SELECT * FROM funcionario WHERE usuario = '+ #39 + EdtNome.Text + #39 +' AND senha = '+ #39 + EdtSenha.Text + #39;

    FrmMenuPrincipal.QueryLogin.Close;
    FrmMenuPrincipal.QueryLogin.SQL.Clear;
    FrmMenuPrincipal.QueryLogin.SQL.Add(StrSql);
    FrmMenuPrincipal.QueryLogin.Open;

    if FrmMenuPrincipal.QueryLogin.FieldByName('status').AsString = 'N' then
    begin
      mensagem:= 'Você está cadastrado no sistema mas não ' + #13 +
        'possui autorização para usá-lo neste momento. ' +#13+#13+
        'Consulte o administrador do sistema.';

        Application.MessageBox(PChar(mensagem), 'Login não autorizado', MB_OK+MB_ICONERROR);
    end;

    if (FrmMenuPrincipal.QueryLogin.RecordCount = 1) then
    begin
      // Gravando o Id do Funcionario para usar em outras telas
      id_funcio_logado := FrmMenuPrincipal.QueryLogin.FieldByName('id').AsInteger;

      // Preendo o StatusBar do MenuPrincipal
      FrmMenuPrincipal.StatusBar1.Panels[2].Text := 'Usuário: '+ FrmMenuPrincipal.QueryLogin.FieldByName('id').AsString +' - '+ FrmLogin.EdtNome.Text;

      nivel := FrmMenuPrincipal.QueryLogin.FieldByName('fk_id_nivel').AsInteger;
      StrSql := 'SELECT nivel_descricao FROM nivel WHERE id_nivel = '+IntToStr(nivel);
      FrmMenuPrincipal.QueryLogin.Close;
      FrmMenuPrincipal.QueryLogin.SQL.Clear;
      FrmMenuPrincipal.QueryLogin.SQL.Add(StrSql);
      FrmMenuPrincipal.QueryLogin.Open;
      niveldesc := FrmMenuPrincipal.QueryLogin.FieldByName('nivel_descricao').AsString;
      FrmMenuPrincipal.StatusBar1.Panels[3].Text := 'Nível: '+ niveldesc;

      FrmLogin.Close;
    end
    else
    begin
      if TentaLogin = 0 then
      begin
        mensagem:= 'Login ou senha são inválidos. Tente novamente!';
      end;

      if TentaLogin >= 1 then
      begin
        mensagem:= 'Login ou senha são inválidos. Se você esqueceu a sua senha, consulte o administrador do sistema.';
      end;

      TentaLogin := TentaLogin +1;

      lblStatusLogin.Font.Color:= clRed;
      lblStatusLogin.Caption := mensagem;
      refresh;
      spbOk.Enabled:= true;
      EdtNome.Enabled:= true;
      EdtSenha.Enabled:= true;
      EdtNome.SetFocus;
    end;
  end
  else
  begin
    if EdtNome.Text = '' then
    begin
      EdtNome.SetFocus;
      mensagem := 'Digite o login da sua conta do SisTicket.';
    end
    else if EdtSenha.Text = '' then
    begin
      EdtSenha.SetFocus;
      mensagem := 'Digite a senha da sua conta do SisTicket.';
    end;
    lblStatusLogin.Font.Color:= clRed;
    lblStatusLogin.Caption := mensagem;
  end;
end;

end.
