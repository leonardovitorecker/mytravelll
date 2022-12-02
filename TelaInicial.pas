unit TelaInicial;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.Edit, FMX.TabControl,
  System.Actions, FMX.ActnList, FMX.Ani, FMX.StdCtrls, FMX.Styles.Objects,
  REST.Types, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
   System.JSON, System.Sensors, System.Sensors.Components,FMX.Maps, FMX.ListBox;

type
  TFrmTelaInicial = class(TForm)
    LayoutTelaInteiraInicial: TLayout;
    StyleBookTelaInicial: TStyleBook;
    TabControlTelaInicial: TTabControl;
    TabItemHome: TTabItem;
    TabItemPerfilUsuario: TTabItem;
    ActionListTelaInicial: TActionList;
    CTabActionHome: TChangeTabAction;
    CTabActionMeuVeiculo: TChangeTabAction;
    CTabActionPerfilUsuario: TChangeTabAction;
    TabItemMeuVeiculo: TTabItem;
    LayoutCenterInicial: TLayout;
    LabelMeusVeiculos: TLabel;
    LayoutLabelMeuVeiculo: TLayout;
    LayoutMenuBarraMeuVeiculo: TLayout;
    LayoutCadMeuVeiculo: TLayout;
    LayoutBarra2MeuVeiculo: TLayout;
    ImageHomeMeuVeiculo: TImage;
    ImageMenuMeuVeiculo: TImage;
    ImageMeusVeiculos: TImage;
    ImagePerfilMeuVeiculo: TImage;
    LabelCadNovoVeiculo: TLabel;
    LayoutTelaInteiraPerfil: TLayout;
    LayoutLabelPerfil: TLayout;
    LabelEditarPerfil: TLabel;
    LayoutCenterEditarPerfil: TLayout;
    LayoutNomeEditarPerfil: TLayout;
    RoundRectNomeEditarPerfil: TRoundRect;
    EditNomeEditarPerfil: TEdit;
    LayoutTelefoneEditarPerfil: TLayout;
    RoundRectTelefoneEditarPerfil: TRoundRect;
    EditTelefoneEditarPerfil: TEdit;
    LayoutEmailEditarPerfil: TLayout;
    RoundRectEmailEditarPerfil: TRoundRect;
    EditEmailEditarPerfil: TEdit;
    LayoutSalvarEditarPerfil: TLayout;
    RoundRectSalvarEditarPerfil: TRoundRect;
    LabelSalvarEditarPerfil: TLabel;
    LayoutBarraPerfil: TLayout;
    LayoutBarra2Perfil: TLayout;
    ImagePerfilHome1: TImage;
    ImagePerfilMenu: TImage;
    ImagePerfilVeiculo: TImage;
    ImagePerfil: TImage;
    LayoutBarraHome: TLayout;
    LayoutBarra2Home: TLayout;
    ImageHome: TImage;
    ImageHomeMenu: TImage;
    ImageHomeVeiculo: TImage;
    ImagePerfilHome: TImage;
    CTabActionGPS: TChangeTabAction;
    VertScrollBoxVeiculos: TVertScrollBox;
    layoutCenter: TLayout;
    LayoutOrigem: TLayout;
    RoundRectOrigem: TRoundRect;
    EditOrigem: TEdit;
    LayoutDestino: TLayout;
    RoundRectDestino: TRoundRect;
    EditDestino: TEdit;
    LayoutDistancia: TLayout;
    LabelDistancia: TLabel;
    LayoutTempo: TLayout;
    LabelTempo: TLabel;
    LayoutCalcularRota: TLayout;
    SpeedButtonCalcularRota: TSpeedButton;
    TabItemGPS: TTabItem;
    Z: TLayout;
    Layout2BarraGPS: TLayout;
    ImageHomeGPS: TImage;
    ImageGPS: TImage;
    ImageVeiculoGPS: TImage;
    ImagePerfilGPS: TImage;
    LayoutFundo: TLayout;
    MapViewGPS: TMapView;
    SwitcGPS: TSwitch;
    labelDestino: TLabel;
    LabelOrigem: TLabel;
    LocationSensor1: TLocationSensor;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    CbxVeiculos: TComboBox;
    Layout1: TLayout;
    RoundRect1: TRoundRect;
    procedure RoundRectSalvarEditarPerfilClick(Sender: TObject);
    procedure ImagePerfilMeuVeiculoClick(Sender: TObject);
    procedure LabelCadNovoVeiculoClick(Sender: TObject);
    procedure ImageHomeGPSClick(Sender: TObject);
    procedure ImagePerfilHome1Click(Sender: TObject);
    procedure ImageHomeMeuVeiculoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SwitcGPSSwitch(Sender: TObject);
    procedure LocationSensor1LocationChanged(Sender: TObject; const OldLocation,
      NewLocation: TLocationCoord2D);
    procedure SpeedButtonCalcularRotaClick(Sender: TObject);




  private
  procedure CarregarListaVeiculos(id: integer; nome: string;
  idusuario: integer);
  procedure GetVeiculosBase;

    { Private declarations }
  public
  var
  idVeiculoGlobal: integer;

    { Public declarations }
  end;

var
  FrmTelaInicial: TFrmTelaInicial;

implementation


uses DM, CadastroUsuario, UnitVeiculo, FrameVeiculo, System.Permissions
{$IFDEF ANDROID}
, Androidapi.Helpers,Androidapi.JNI.JavaTypes, Androidapi.JNI.Os
{$ENDIF}
;


 {$R *.fmx}

procedure TFrmTelaInicial.ImagePerfilHome1Click(Sender: TObject);
begin
CTabActionHome.Execute;
end;

procedure TFrmTelaInicial.ImageHomeGPSClick(Sender: TObject);
begin

CTabActionGPS.Execute;
end;

procedure TFrmTelaInicial.ImageHomeMeuVeiculoClick(Sender: TObject);
begin
getVeiculosBase;
CTabActionMeuVeiculo.Execute;
end;

procedure TFrmTelaInicial.CarregarListaVeiculos(id: integer; nome: string;
idusuario: integer);
var frame: TFrameVeiculos ;
begin
frame := TFrameVeiculos.Create(nil);
frame.Position.Y := 9999999;
frame.Align := TAlignLayout.Top;
frame.tag := id;
idVeiculoGlobal := frame.tag;
frame.LabelNomeVeiculo.Text := nome;
frame.ImageEditarVeiculo.tag := id;
frame.ImageExcluirVeiculo.tag := id;

VertScrollBoxVeiculos.AddObject(frame) ;



end;
 procedure TFrmTelaInicial.FormCreate(Sender: TObject);
begin
MapViewGPS.MapType := TMapType.Normal;
end;


procedure TFrmTelaInicial.GetVeiculosBase;
 begin

    DataModul.QueryBuscaVeiculo.Close;
   dataModul.QueryBuscaVeiculo.Open();
   dataModul.QueryBuscaVeiculo.ParamByName('pID').AsInteger := FormCadastro.IdUsuarioGlobal ;

   while not dataModul.QueryBuscaVeiculo.Eof  do
    begin
      CarregarListaVeiculos(dataModul.QueryBuscaVeiculoid.AsInteger,
      dataModul.QueryBuscaVeiculoNome.AsString,
      dataModul.QueryBuscaVeiculoidusuario.AsInteger);
      dataModul.QueryBuscaVeiculo.next;
    end;
 end;


procedure TFrmTelaInicial.ImagePerfilMeuVeiculoClick(Sender: TObject);
var
id: integer;
begin
dataModul.QueryBuscaUsuario.Close;
dataModul.QueryBuscaUsuario.Open();
dataModul.QueryBuscaUsuario.ParamByName('pID').AsInteger := FormCadastro.IdUsuarioGlobal;

EditNomeEditarPerfil.Text:= dataModul.QueryBuscaUsuarioNome.AsString;
EditEmailEditarPerfil.Text := dataModul.QueryBuscaUsuarioEmail.AsString;
EditTelefoneEditarPerfil.Text := dataModul.QueryBuscaUsuarioTelefone.AsString;
EditEmailEditarPerfil.Enabled:= false;
CTabActionPerfilUsuario.Execute;


end;


procedure TFrmTelaInicial.LabelCadNovoVeiculoClick(Sender: TObject);
begin

      if not Assigned(FormVeiculo) then
      Application.CreateForm(TFormVeiculo, FormVeiculo);
     FormVeiculo.show();
end;



procedure TFrmTelaInicial.LocationSensor1LocationChanged(Sender: TObject;
  const OldLocation, NewLocation: TLocationCoord2D);
  var MyMarker : TMapMarkerDescriptor;
  posicao: TMapCoordinate;
begin
 MapViewGPS.Location := TMapCoordinate.Create(NewLocation.Latitude,
 NewLocation.Longitude);
 posicao.Latitude := NewLocation.Latitude;
 posicao.Longitude := NewLocation.Longitude;
 MyMarker := TMapMarkerDescriptor.Create(posicao, 'Estou aqui');
 MyMarker.Draggable := true;
 MyMarker.Visible := true;
 MyMarker.Snippet := 'EU';
 MapViewGPS.AddMarker(MyMarker);
 labelOrigem.Text := NewLocation.Latitude.ToString().Replace(',', '.');
 labelDestino.Text := NewLocation.Longitude.ToString().Replace(',', '.');
end;

procedure TFrmTelaInicial.RoundRectSalvarEditarPerfilClick(Sender: TObject);
begin

dataModul.QueryBuscaUsuario.close;
dataModul.QueryBuscaUsuario.open;
dataModul.QueryBuscaUsuario.ParamByName('pID').AsInteger := FormCadastro.IdUsuarioGlobal;
   dataModul.QueryBuscaUsuario.Edit;
       dataModul.QueryBuscaUsuarionome.AsString := EditNomeEditarPerfil.Text;
       dataModul.QueryBuscaUsuariotelefone.AsString := EditTelefoneEditarPerfil.Text;
      dataModul.QueryBuscaUsuarioemail.AsString := EditEmailEditarPerfil.Text;

      dataModul.QueryBuscaUsuario.Post;


      dataModul.connection.CommitRetaining;

end;



procedure TFrmTelaInicial.SpeedButtonCalcularRotaClick(Sender: TObject);
var
retorno: TJSONObject;
prows: TJSONPair;
arrayr: TJSONArray;
orows: TJSONObject;
arraye: TJSONArray;
oelementos: TJSONObject;
oduracao, odistancia: TJSONObject;

distancia_str, duracao_str: string;
distancia_int, duracao_int: integer;
begin
  RESTRequest1.Resource :=
    'json?origins={origem}&destinations={destino}&mode=driving&language=pt-BR&key=AIzaSyA-ZAeSD4K6XsLBmeSKdB59Cg_H4Ve-kCM';

  RESTRequest1.Params.AddUrlSegment('origem', EditOrigem.Text);

  RESTRequest1.Params.AddUrlSegment('destino', EditDestino.Text);

  RESTRequest1.Execute;



  retorno := RESTRequest1.Response.JSONValue as TJSONObject;



  if retorno.GetValue('status').Value <> 'OK' then

  begin

    showmessage('Ocorreu um erro ao calcular a a viagem.');

    exit;

  end;



  prows := retorno.Get('rows');

  arrayr := prows.JSONValue as TJSONArray;

  orows := arrayr.Items[0] as TJSONObject;

  arraye := orows.GetValue('elements') as TJSONArray;

  oelementos := arraye.Items[0] as TJSONObject;



  odistancia := oelementos.GetValue('distance') as TJSONObject;

  oduracao := oelementos.GetValue('duration') as TJSONObject;



  distancia_str := odistancia.GetValue('text').Value;

  distancia_int := odistancia.GetValue('value').Value.ToInteger;



  duracao_str := oduracao.GetValue('text').Value;

  duracao_int := oduracao.GetValue('value').Value.ToInteger;



  LabelDistancia.Text := 'Distancia: ' + distancia_str;

  LabelTempo.Text := 'Tempo: ' + duracao_str;
end;

procedure TFrmTelaInicial.SwitcGPSSwitch(Sender: TObject);

{$IFDEF ANDROID}
var
APermissaoGPS: string;
{$ENDIF}
begin
{$IFDEF ANDROID}
APermissaoGPS := JStringToString(TJManifest_permission.JavaClass.ACCESS_FINE_LOCATION);

PermissionsService.RequestPermissions([APermissaoGPS],
procedure(const APermissions: TArray<string>;
const AGrantResults: TArray<TPermissionStatus>)
begin
if(Length(AGrantResults) = 1) and (AGrantResults[0] = TPermissionStatus.Granted) then
LocationSensor1.Active := True
else
LocationSensor1.Active := False

end)
{$ENDIF}
end;
end.
