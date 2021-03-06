unit UntPadrao1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, Vcl.ToolWin;

type
    TExecutar = (navegacao, sentencaSQL, exibePanels,
    desabilitaBotoes, habilitaBotoes, exibeBotoes);
    TFrmPadrao1 = class(TForm)
    ImageList1: TImageList;
    ImageList2: TImageList;
    ImageList3: TImageList;
    ToolBar1: TToolBar;
    btn_Pesquisa: TToolButton;
    btn_Ordenar: TToolButton;
    separador1: TToolButton;
    btn_primeiro: TToolButton;
    btn_Anterior: TToolButton;
    btn_proximo: TToolButton;
    btn_ultimo: TToolButton;
    Separador2: TToolButton;
    btn_Inserir: TToolButton;
    btn_Editar: TToolButton;
    btn_Excluir: TToolButton;
    Separador3: TToolButton;
    btn_salvar: TToolButton;
    btn_Cancelar: TToolButton;
    Separador4: TToolButton;
    btn_Imprimir: TToolButton;
    Separador5: TToolButton;
    btn_sair: TToolButton;
    StatusBar1: TStatusBar;
    FDTabela: TFDTable;
    DataSource1: TDataSource;
    PanelEntrada: TPanel;
    LblStatus: TLabel;
    Label1: TLabel;
    valorCampo: TEdit;
    btnOK: TSpeedButton;
    CheckHabilita: TDBCheckBox;
    PnlFicha: TPanel;
    procedure btn_primeiroClick(Sender: TObject);
    procedure btn_AnteriorClick(Sender: TObject);
    procedure btn_proximoClick(Sender: TObject);
    procedure btn_ultimoClick(Sender: TObject);
    procedure btn_InserirClick(Sender: TObject);
    procedure btn_EditarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_CancelarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FrmMenuPrincipalcad_ChamadoExecute(Sender: TObject);

  private
    FExecutar: TExecutar;
    procedure SetExecutar(const Value: TExecutar);
    { Private declarations }
  public
     property Executar: TExecutar read FExecutar write SetExecutar;
    { Public declarations }
  end;

var
  FrmPadrao1: TFrmPadrao1;
   //Define o tipo do campo ID
  tipoID: integer;
  //Define o nome da tabela em uso
  nomeTabela: String;
  //Define operacao de inclusao
  operacaoIncluir: Integer;
  //Define as a��es de Inclus�o/Edi��o/Exclus�o
  modoEdicao: String;
  //Define o titulo das Janelas Filhas
  nomeJanela: String;
  //Armazena datas no formato String
  valData1, valData2: String;
  //Armazena o nome de uma tarefa em Andamento
  tarefa: String;
  //Controle do bot�o pesquisar da Janela PesqData
  tarefaClick: integer;
  //Montagem da mensagem de informa��o
  mensagem: String;

implementation

{$R *.dfm}

uses UntDM;

{ TFrmPadrao1 }

procedure TFrmPadrao1.btn_AnteriorClick(Sender: TObject);
begin
  FDTabela.Prior;
  Executar:= navegacao;
  Executar:= exibePanels;
end;

procedure TFrmPadrao1.btn_CancelarClick(Sender: TObject);
begin
  operacaoIncluir:= 0;

  FDTabela.Cancel;

 mensagem:= 'A inclus�o ou altera��o deste registro foi abortada.';
  Application.MessageBox(PChar(mensagem), 'Aten��o',
    MB_OK+MB_ICONERROR);

  Executar:= habilitaBotoes;

  //Habilita a exibi��o de objetos
  ValorCampo.Clear;
  ValorCampo.Enabled:= True;
  btnOK.Enabled:= True;
  CheckHabilita.Enabled:= False;
  PnlFicha.Enabled:= False;

  if FDTabela.FieldByName('STATUS').AsString = 'N' then
    LblStatus.Visible:= True
  else
    LblStatus.Visible:= False;
end;

procedure TFrmPadrao1.btn_EditarClick(Sender: TObject);
begin
  FDTabela.Edit;

  //Habilita a exibi��o de objetos
  ValorCampo.Enabled:= False;
  btnOK.Enabled:= False;
  CheckHabilita.Enabled:= True;
  PnlFicha.Enabled:= True;

  FDTabela.FieldByName('DATA_ALT').AsDateTime:= Date;

  //Bot�es e barra de Status
  Executar:= desabilitaBotoes;
  StatusBar1.Panels[2].Text:= 'Altera��o de registro';

  Executar:= exibePanels;
end;

procedure TFrmPadrao1.btn_ExcluirClick(Sender: TObject);
var confExcl: integer;
begin
  confExcl:= Application.MessageBox(
    'Confirma a exclus�o desse registro?',
    'Aten��o',
    MB_YESNO+MB_DEFBUTTON2+MB_ICONQUESTION);

    if confExcl = IDYES then
    begin
      FDTabela.Delete;

      mensagem:= 'O registro foi excluido com sucesso.';
      Application.MessageBox(PChar(mensagem), 'Informa��o',
        MB_OK+MB_ICONINFORMATION);
    end;

    if confExcl = IDNO then
    begin
      StatusBar1.Panels[2].Text:= 'Exclus�o Cancelada';
    end;
    Executar:= habilitaBotoes;
    Executar:= exibePanels;
end;


procedure TFrmPadrao1.btn_InserirClick(Sender: TObject);
begin
  operacaoIncluir:= 1;

  if FDTabela.Active = False then
  begin
    FDTabela.Open();
  end;

  FDTabela.Insert;

  //Habilita a exibi��o de objetos
  ValorCampo.Enabled:= False;
  btnOK.Enabled:= False;
  CheckHabilita.Enabled:= False;
  LblStatus.Visible:= False;
  PnlFicha.Enabled:= True;

  //Inclus�o de registro
  FDTabela.FieldByName('STATUS').AsString:= 'S';
  FDTabela.FieldByName('DATA_INC').AsDateTime:= Date;

  //Bot�es e barra de Status
  Executar:= desabilitaBotoes;
  StatusBar1.Panels[2].Text:=
      'Inclus�o de novo registro';

  Executar:= exibePanels;
//  operacaoIncluir:= 0;
end;


procedure TFrmPadrao1.btn_primeiroClick(Sender: TObject);
begin
  FDTabela.First;
  Executar:= navegacao;
  Executar:= exibePanels;
end;

procedure TFrmPadrao1.btn_proximoClick(Sender: TObject);
begin
  FDTabela.Next;
  Executar:= navegacao;
  Executar:= exibePanels;
end;

procedure TFrmPadrao1.btn_sairClick(Sender: TObject);
begin
  FDTabela.Close;
  Close;
end;

procedure TFrmPadrao1.btn_salvarClick(Sender: TObject);
begin
  operacaoIncluir:= 0;

  FDTabela.Post;

  mensagem:= 'O registro foi incluido ou alterado com sucesso.';
  Application.MessageBox(PChar(mensagem), 'Informa��o',
  MB_OK+MB_ICONINFORMATION);

  Executar:= habilitaBotoes;

  //Habilita a exibi��o de objetos
  ValorCampo.Clear;
  ValorCampo.Enabled:= True;
  btnOK.Enabled:= True;
  CheckHabilita.Enabled:= False;
  PnlFicha.Enabled:= False;

  if FDTabela.FieldByName('STATUS').AsString = 'N' then
    LblStatus.Visible:= True
  else
    LblStatus.Visible:= False;
end;

procedure TFrmPadrao1.btn_ultimoClick(Sender: TObject);
begin
  FDTabela.Last;
  Executar:= navegacao;
  Executar:= exibePanels;
end;

procedure TFrmPadrao1.FrmMenuPrincipalcad_ChamadoExecute(Sender: TObject);
begin
    ShowMessage('cadastro');
end;

procedure TFrmPadrao1.SetExecutar(const Value: TExecutar);
begin
  FExecutar:= Value;
  case value of
    //Habilita bot�es de navega��o
    navegacao:
    begin
      if FDTabela.Eof = True then
      begin
        btn_Proximo.Enabled:= False;
        btn_Ultimo.Enabled:= False;
      end
      else
      begin
        btn_Proximo.Enabled:= True;
        btn_Ultimo.Enabled:= True;
      end;

      if FDTabela.Bof = True then
      begin
        btn_Primeiro.Enabled:= False;
        btn_Anterior.Enabled:= False;
      end
      else
      begin
        btn_Primeiro.Enabled:= True;
        btn_Anterior.Enabled:= True;
      end;
    end;

    //Executar a senten�a SQL
    sentencaSQL:
    begin
      FDTabela.Close;
      FDTabela.Open();

      if (FDTabela.RecordCount = 0) and (operacaoIncluir = 0) then
      begin
        mensagem:= 'N�o foi encontrado nenhum registro que ' +
        #13 + 'satisfa�a a sua pesquisa.';
        Application.MessageBox(PChar(mensagem),'Informa��o',
          MB_OK+MB_ICONINFORMATION);
      end;
    end;

    //Exibe os textos nos paines de barra de status
    exibePanels:
    begin
      StatusBar1.Panels[0].Text:= 'INC: ' +
        FDTabela.FieldByName('DATA_INC').AsString;
      StatusBar1.Panels[1].Text:= 'ALT: ' +
        FDTabela.FieldByName('DATA_ALT').AsString;
      StatusBar1.Panels[3].Text:= 'ID-C�digo: ' +
        FDTabela.FieldByName('ID').AsString;

      if (FDTabela.RecordCount = 0) and (operacaoIncluir = 0) then
      begin
        StatusBar1.Panels[0].Text:= '';
        StatusBar1.Panels[1].Text:= '';
        StatusBar1.Panels[2].Text:= '';
        StatusBar1.Panels[3].Text:= '';
      end;

      if FDTabela.FieldByName('STATUS').AsString = 'N' then
        LblStatus.Visible:= True
      else
        LblStatus.Visible:= False;
    end;

    //Desabilita bot�es ao incluir ou alterar um registro
    desabilitaBotoes:
    begin
      btn_Pesquisa.Enabled:= False;
      btn_Ordenar.Enabled:= False;
      btn_Primeiro.Enabled:= False;
      btn_Anterior.Enabled:= False;
      btn_Proximo.Enabled:= False;
      btn_Ultimo.Enabled:= False;
      btn_Inserir.Enabled:= False;
      btn_Editar.Enabled:= False;
      btn_Excluir.Enabled:= False;
      btn_Salvar.Enabled:= True;
      btn_Cancelar.Enabled:= True;
      btn_Imprimir.Enabled:= False;
      btn_Sair.Enabled:= False;
    end;

    //Habilitar bot�es ao Salvar ou Cancelar uma inc ou alt
    habilitaBotoes:
    begin
    btn_Pesquisa.Enabled:= True;
      if FDTabela.RecordCount > 0 then
      begin
        btn_Ordenar.Enabled:= True;
      end
      else
      begin
        btn_Ordenar.Enabled:= False;
      end;
      btn_Inserir.Enabled:= True;
      if FDTabela.RecordCount = 0 then
      begin
        btn_Editar.Enabled:= False;
        btn_Excluir.Enabled:= False;
        btn_Imprimir.Enabled:= False;
        btn_Primeiro.Enabled:= False;
        btn_Anterior.Enabled:= False;
        btn_Proximo.Enabled:= False;
        btn_Ultimo.Enabled:= False;
      end
      else
      begin
        btn_Editar.Enabled:= True;
        btn_Excluir.Enabled:= True;
        btn_Imprimir.Enabled:= True;
        btn_Primeiro.Enabled:= True;
        btn_Anterior.Enabled:= True;
        btn_Proximo.Enabled:= True;
        btn_Ultimo.Enabled:= True;
      end;
      btn_Salvar.Enabled:= False;
      btn_Cancelar.Enabled:= False;
      btn_Sair.Enabled:= True;
    end;

    //Exibe bot�es conforme o perfil do usuario
    exibeBotoes:
    begin
      if modoEdicao = 'NNN' then
      begin
        btn_Inserir.Visible:= False;
        btn_Editar.Visible:= False;
        btn_Excluir.Visible:= False;
        btn_Salvar.Visible:= False;
        btn_Cancelar.Visible:= False;
        separador1.Visible:= False;
        separador4.Visible:= False;
      end;

      if modoEdicao = 'NNS' then
      begin
        btn_Inserir.Visible:= False;
        btn_Editar.Visible:= False;
        btn_Excluir.Visible:= True;
        btn_Salvar.Visible:= False;
        btn_Cancelar.Visible:= False;
        separador3.Visible:= True;
        separador4.Visible:= False;
      end;

      if modoEdicao = 'NSN' then
      begin
        btn_Inserir.Visible:= False;
        btn_Editar.Visible:= True;
        btn_Excluir.Visible:= False;
        btn_Salvar.Visible:= True;
        btn_Cancelar.Visible:= True;
        separador3.Visible:= True;
        separador4.Visible:= True;
      end;

      if modoEdicao = 'SNN' then
      begin
        btn_Inserir.Visible:= True;
        btn_Editar.Visible:= False;
        btn_Excluir.Visible:= False;
        btn_Salvar.Visible:= True;
        btn_Cancelar.Visible:= True;
        separador3.Visible:= True;
        separador4.Visible:= True;
      end;

      if modoEdicao = 'NSS' then
      begin
        btn_Inserir.Visible:= False;
        btn_Editar.Visible:= True;
        btn_Excluir.Visible:= True;
        btn_Salvar.Visible:= True;
        btn_Cancelar.Visible:= True;
        separador3.Visible:= True;
        separador4.Visible:= True;
      end;

      if modoEdicao = 'SNS' then
      begin
        btn_Inserir.Visible:= True;
        btn_Editar.Visible:= False;
        btn_Excluir.Visible:= True;
        btn_Salvar.Visible:= True;
        btn_Cancelar.Visible:= True;
        separador3.Visible:= True;
        separador4.Visible:= True;
      end;

      if modoEdicao = 'SSN' then
      begin
        btn_Inserir.Visible:= True;
        btn_Editar.Visible:= False;
        btn_Excluir.Visible:= True;
        btn_Salvar.Visible:= True;
        btn_Cancelar.Visible:= True;
        separador3.Visible:= True;
        separador4.Visible:= True;
      end;

      if modoEdicao = 'SSS' then
      begin
        btn_Inserir.Visible:= True;
        btn_Editar.Visible:= True;
        btn_Excluir.Visible:= True;
        btn_Salvar.Visible:= True;
        btn_Cancelar.Visible:= True;
        separador3.Visible:= True;
        separador4.Visible:= True;
      end;
    end;
  end;
end;
end.
