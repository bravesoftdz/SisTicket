unit UntAtendeChamado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntPadrao1, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.Mask, Vcl.Grids, Vcl.DBGrids;

type
  TFrmAtendeChamado = class(TFrmPadrao1)
    FDQryFuncionarios: TFDQuery;
    DSFuncionarios: TDataSource;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    DBMemo1: TDBMemo;
    Label4: TLabel;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBEdit3: TDBEdit;
    DBGrid1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    Label10: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DBGrid2: TDBGrid;
    Label11: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    FDTblStatus: TFDTable;
    DSStatus: TDataSource;
    FDTblStatusid: TFDAutoIncField;
    FDTblStatusdescricao: TStringField;
    FDQryFuncionarioXChamado: TFDQuery;
    DSFuncionarioxChamado: TDataSource;
    FDTblTipoMotivo: TFDTable;
    DSTipoMotivo: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Histórico: TTabSheet;
    Label12: TLabel;
    FDTblTipoMotivoid: TFDAutoIncField;
    FDTblTipoMotivodescricao: TStringField;
    FDQryHistorico: TFDQuery;
    DSHistorico: TDataSource;
    Label13: TLabel;
    Memo1: TMemo;
    Label14: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAtendeChamado: TFrmAtendeChamado;

implementation

{$R *.dfm}

uses UntDM, UntListaChamados, UntLogin;

procedure TFrmAtendeChamado.FormActivate(Sender: TObject);
begin
  inherited;
  FDQryFuncionarios.Close;
  FDQryFuncionarios.Open();

  FDTblStatus.Close;
  FDTblStatus.Open();
end;

procedure TFrmAtendeChamado.FormCreate(Sender: TObject);
begin
  inherited;
  label14.Caption := DateToStr(Date);
end;

procedure TFrmAtendeChamado.FormShow(Sender: TObject);
var
  StrSql: String;
begin
  inherited;
  StrSql:= 'SELECT * FROM historico WHERE id_chamado = '+IntToStr(id_chamado);

  FDQryHistorico.Close;
  FDQryHistorico.SQL.Clear;
  FDQryHistorico.SQL.Add(StrSql);
  FDQryHistorico.Open;
end;

procedure TFrmAtendeChamado.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  Label13.Font.Color := clBlack;
  Label13.Caption := '';
  Memo1.Clear;
  Memo1.SetFocus;
end;

procedure TFrmAtendeChamado.SpeedButton4Click(Sender: TObject);
var
  StrSql: String;
  logado: Integer;
begin
  inherited;
  if Memo1.Text = '' then
  begin
    Label13.Font.Color := clRed;
    Label13.Caption := 'Digite a descrição do histórico.';
    Memo1.SetFocus;

  end
  else
  begin
    StrSql:= 'INSERT INTO historico (data, descricao, id_chamado, id_funcionario) VALUES ('+#39+DateToStr(Date)+#39+', '+#39+Memo1.Text+#39+', '+IntToStr(id_chamado)+', '+IntToStr(id_funcio_logado)+' )';

    FDQryHistorico.Close;
    FDQryHistorico.SQL.Clear;
    FDQryHistorico.SQL.Add(StrSql);
    FDQryHistorico.ExecSQL;
    MessageDlg('Foi inserido o seu histórico.',mtInformation,[mbOK],0);
    Memo1.Clear;
  end;



end;

end.
