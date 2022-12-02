unit DM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, IOUtils;

type
  TDataModul = class(TDataModule)
    Connection: TFDConnection;
    QueryUsuarioCadastro: TFDQuery;
    QueryBuscaUsuario: TFDQuery;
    QueryVeiculo: TFDQuery;
    QueryUsuarioCadastroid: TFDAutoIncField;
    QueryUsuarioCadastronome: TStringField;
    QueryUsuarioCadastrotelefone: TStringField;
    QueryUsuarioCadastroemail: TStringField;
    QueryUsuarioCadastrosenha: TStringField;
    QueryBuscaUsuarioid: TFDAutoIncField;
    QueryBuscaUsuarionome: TStringField;
    QueryBuscaUsuariotelefone: TStringField;
    QueryBuscaUsuarioemail: TStringField;
    QueryBuscaUsuariosenha: TStringField;
    QueryVeiculoid: TFDAutoIncField;
    QueryVeiculonome: TStringField;
    QueryVeiculomarca: TStringField;
    QueryVeiculomodelo: TStringField;
    QueryVeiculoidusuario: TIntegerField;
    QueryVeiculoanoFabricacao: TStringField;
    QueryVeiculocombustivel: TStringField;
    QueryVeiculomediaLitro: TBCDField;
    QueryBuscaVeiculo: TFDQuery;
    QueryBuscaVeiculoid: TFDAutoIncField;
    QueryBuscaVeiculonome: TStringField;
    QueryBuscaVeiculomarca: TStringField;
    QueryBuscaVeiculomodelo: TStringField;
    QueryBuscaVeiculoidusuario: TIntegerField;
    QueryBuscaVeiculoanoFabricacao: TStringField;
    QueryBuscaVeiculocombustivel: TStringField;
    QueryBuscaVeiculomediaLitro: TBCDField;
    QueryVeiculoEditDelete: TFDQuery;
    QueryVeiculoEditDeleteid: TFDAutoIncField;
    QueryVeiculoEditDeletenome: TStringField;
    QueryVeiculoEditDeletemarca: TStringField;
    QueryVeiculoEditDeletemodelo: TStringField;
    QueryVeiculoEditDeleteidusuario: TIntegerField;
    QueryVeiculoEditDeleteanoFabricacao: TStringField;
    QueryVeiculoEditDeletecombustivel: TStringField;
    QueryVeiculoEditDeletemediaLitro: TBCDField;
    procedure connectionAfterConnect(Sender: TObject);
    procedure ConnectionBeforeConnect(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModul: TDataModul;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TDataModul.connectionAfterConnect(Sender: TObject);
 var
 strSQL : string;
begin

 StrSQL := 'CREATE TABLE IF NOT EXISTS usuario(' +
            'id integer not null primary key autoincrement, ' +
            'nome varchar(40),' +
            'telefone varchar(13), ' +
            'email varchar(60), '+
            'senha varchar(40))';

  connection.ExecSQL(strSQL);

 strSQL := EmptyStr;

  StrSQL := 'CREATE TABLE IF NOT EXISTS veiculo(' +
            'id integer not null primary key autoincrement, ' +
            'nome varchar(40),' +
            'marca varchar(13), ' +
            'modelo varchar(60), '+
            'anoFabricacao varchar(40), '+
            'combustivel varchar(10),  '+
            'mediaLitro decimal(10,2), '+
            'idusuario integer not null, '+
            'foreign key (idusuario) references usuario(id))';

 connection.ExecSQL(strSQL);
 QueryUsuarioCadastro.Active := true   ;
 QueryBuscaUsuario.Active :=true ;
 QueryVeiculo.Active:= true;


end;


procedure TDataModul.ConnectionBeforeConnect(Sender: TObject);
begin
var
  strPath: string;
begin
{$IF DEFINED(iOS) or DEFINED(ANDROID)}
  strPath := System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath,
    'mytravel.db');
{$ENDIF}
{$IFDEF MSWINDOWS}
  strPath := System.IOUtils.TPath.Combine
    ('C:\Users\LEONARDO\Desktop\documenst\trabalho de delphi\Banco\',
    'mytravel1.db');
{$ENDIF}
  connection.Params.Values['UseUnicode'] := 'False';
  connection.Params.Values['DATABASE'] := strPath;
end;
end;


end.
