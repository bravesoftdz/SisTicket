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
    GroupBox2: TGroupBox;
    Label10: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DBMemo2: TDBMemo;
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
    FDQryHistoricoChamado: TFDQuery;
    DSHistoricoChamado: TDataSource;
    FDTblTipoMotivo: TFDTable;
    DSTipoMotivo: TDataSource;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAtendeChamado: TFrmAtendeChamado;

implementation

{$R *.dfm}

uses UntDM, UntListaChamados;

procedure TFrmAtendeChamado.FormActivate(Sender: TObject);
begin
  inherited;
  FDQryFuncionarios.Close;
  FDQryFuncionarios.Open();

  FDTblStatus.Close;
  FDTblStatus.Open();
end;

end.
