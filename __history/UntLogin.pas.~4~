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
    procedure EdtNomeChange(Sender: TObject);
    procedure spbOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses UntPrincipal, UntDM;


procedure TFrmLogin.spbOkClick(Sender: TObject);
var mensagem, StrSql: String;
begin
  spbOk.Text:= 'Autenticando usuário...';

  refresh;
  spbOk.Enabled:= False;
  EdtNome.Enabled:= False;
  EdtSenha.Enabled:= False;
  sleep(1000);

  StrSql:= 'select u.*, p.* '+
           'from usuario u inner join perfil p '+
           'on u.usu_id_perfil = p.id '+
           'where u.usu_login = ' + #39 +
           EdtNome.Text + #39 +
           ' and u.usu_senha = ' + #39 +
           EdtSenha.Text + #39;

  FrmMenuPrincipal.QueryLogin.Close;
  FrmMenuPrincipal.QueryLogin.SQL.Clear;
  FrmMenuPrincipal.QueryLogin.SQL.Add(StrSql);
  FrmMenuPrincipal.QueryLogin.Open;

  if FrmMenuPrincipal.QueryLogin.FieldByName('status').AsString = 'N' then
  begin
    mensagem:= 'Você está cadastrado no sistema mas não ' + #13 +
      'possui autorização para usá-lo neste momento. ' +#13+#13+
      'Consulte o administrador do sistema.';

      Application.MessageBox(PChar(mensagem),
      'Login não autorizado',
      MB_OK+MB_ICONERROR);
  end;

  if (FrmMenuPrincipal.QueryLogin.RecordCount = 1) then
  begin
    FrmMenuPrincipal.StatusBar1.Panels[2].Text:=
    'Usuário: ' + FrmLogin.EdtNome.Text +
    ' - ' +
    FrmMenuPrincipal.QueryLogin.FieldByName('USU_DEPARTAMENTO').AsString;

    FrmLogin.Close;
  end;

  if (FrmMenuPrincipal.QueryLogin.RecordCount = 0) then
  begin
    mensagem:= 'Nome ou senha do usuário são inválidos.' +#13+#13+
    'Se você esqueceu a sua senha, consulte ' +#13+
    'o administrador do sistema.';

      Application.MessageBox(PChar(mensagem),
      'Login não autorizado',
      MB_OK+MB_ICONERROR);

      spbOk.Enabled:= True;
      EdtNome.Enabled:= True;
      EdtSenha.Enabled:= True;
      EdtNome.Clear;
      EdtSenha.Clear;
      EdtNome.SetFocus;
      showmessage := 'Login não autorizado... '+
      'Tente novamente';
  end;
end;

end.
