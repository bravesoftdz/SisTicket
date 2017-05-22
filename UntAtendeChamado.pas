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
    Hist�rico: TTabSheet;
    Label12: TLabel;
    DBEdit6: TDBEdit;
    FDTblTipoMotivoid: TFDAutoIncField;
    FDTblTipoMotivodescricao: TStringField;
    FDQryHistorico: TFDQuery;
    DSHistorico: TDataSource;
    Label13: TLabel;
    Memo1: TMemo;
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
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

procedure TFrmAtendeChamado.SpeedButton4Click(Sender: TObject);
var
  StrSql: String;
  logado: Integer;
begin
  inherited;
  if Memo1.Text = '' then
  begin
    Label3.Font.Color := clRed;
    Label3.Caption := 'Digite a descri��o do hist�rico.';
    Memo1.SetFocus;

  end
  else
  begin
  //N�o terminado
  {logado := FrmLogin.i
    StrSql:= 'INSERT INTO historico (data, descricao, id_chamado, id_funcionario) VALUES (NOW(), '+#39+Memo1.Text+#39+', 1, '+id_funcio_logado+' )';

    FDQryHistorico.Close;
    FDQryHistorico.SQL.Clear;
    FDQryHistorico.SQL.Add(StrSql);
    FDQryHistorico.Open;   }
  end;



end;

end.
