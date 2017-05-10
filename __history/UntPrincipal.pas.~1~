unit UntPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, System.ImageList, Vcl.ImgList,
  Vcl.ToolWin, Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.ComCtrls, Vcl.ExtCtrls, WiniNet;

type
  TFrmMenuPrincipal = class(TForm)
    ImageList1: TImageList;
    ActionManager1: TActionManager;
    cad_Funcionario: TAction;
    cad_Chamado: TAction;
    Action1: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    ActionToolBar1: TActionToolBar;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Action2: TAction;
    Panel1: TPanel;
    Chamados: TAction;
    procedure Action1Execute(Sender: TObject);
    procedure cad_FuncionarioExecute(Sender: TObject);
    procedure cad_ChamadoExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure ChamadosExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMenuPrincipal: TFrmMenuPrincipal;
  //variavel que cuida da conexão, inicia como falsa, se caso em cada passo ou no inicio do sistema estiver offline, ela dá message e não abre o form para não travar em timeout de SQL
  conexao:boolean;

implementation

{$R *.dfm}

uses UntPadrao1, UntFuncionarios, UntChamado, UntListaChamados;

procedure TFrmMenuPrincipal.ChamadosExecute(Sender: TObject);
begin
  FrmListaChamados.ShowModal;
end;

procedure TFrmMenuPrincipal.Action1Execute(Sender: TObject);
begin
  Close;
end;

procedure TFrmMenuPrincipal.Action2Execute(Sender: TObject);
  var i:dword;
begin
 if conexao = true then
 begin
   FrmListaChamados.ShowModal;
 end
  else
  showmessage('Conecte-se a Internet antes de utilizar o sistema de chamados.');
end;



procedure TFrmMenuPrincipal.cad_ChamadoExecute(Sender: TObject);
  var i:dword;
begin
 if conexao = true then
 begin
   Frmchamado.ShowModal;
 end
  else
  showmessage('Conecte-se a Internet antes de utilizar o sistema de chamados.');
end;


procedure TFrmMenuPrincipal.cad_FuncionarioExecute(Sender: TObject);
begin
 if conexao = true then
 begin
   FrmFuncionarios.ShowModal;
 end
  else
  showmessage('Conecte-se a Internet antes de utilizar o sistema de chamados.');
end;



procedure TFrmMenuPrincipal.FormActivate(Sender: TObject);
var i:dword;
begin
  conexao := false;
  WindowState:= wsMaximized;
  StatusBar1.Panels[1].Text:= FormatDateTime(' dddd ", " dd " de " mmmm " de "yyyy', Now);
  if InternetGetConnectedState(@i,0)   then
   begin
    StatusBar1.Panels[3].Text:= 'Conectado!';
    conexao := true
   end
    else
      StatusBar1.Panels[3].Text:= 'Não Conectado, verifique sua conexão!';
end;



procedure TFrmMenuPrincipal.FormClose(Sender: TObject;
var Action: TCloseAction);
begin
  Close;
end;

procedure TFrmMenuPrincipal.FormCloseQuery(Sender: TObject;
var CanClose: Boolean);
var confSaida: Integer;
begin
  confSaida := Application.MessageBox('Tem certeza que deseja sair do sistema?', 'Atenção', MB_YESNO+MB_DEFBUTTON2+MB_ICONQUESTION);
  if confSaida = IDYES then
    Application.Terminate
  else
  CanClose:= false;
end;



procedure TFrmMenuPrincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text:= TimeToStr(Time);
end;

end.
