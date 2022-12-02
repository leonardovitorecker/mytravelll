unit Splash;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, REST.Types,
  FMX.Objects, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, System.JSON;
type
  TVersao = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Rect_update: TRectangle;
    LayoutTop: TLayout;
    LayoutUpdate: TLayout;
    Image_download: TImage;
    lbl_texto: TLabel;
    lbl_titulo: TLabel;
    Image_seta: TImage;
    LayoutBarra: TLayout;
    rect_botao: TRectangle;
    btn_update: TSpeedButton;
    lbl_versao: TLabel;
    rectFundo: TRectangle;
    ImageFundo: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Btn_updateClick(Sender: TObject);
    procedure Btn_updateMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Btn_updateMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
   
  
  private
    procedure OnFinishUpdate(Sender: TObject);
    { Private declarations }
  public
   versao_app: string;
    versao_server: string;
    { Public declarations }
  end;

var
  Versao: TVersao;

implementation

uses CadastroUsuario, UOpenURL;
{$R *.fmx}




procedure TVersao.Btn_updateClick(Sender: TObject);
var
url : string;
begin
{$IFDEF ANDROID}
url:='https://drive.google.com/file/d/12Kt9TPUOUIUbuMayaXoPzPQTHE1N-GFC/view?usp=sharing';
{$ELSE}
url:= 'https://drive.google.com/file/d/12Kt9TPUOUIUbuMayaXoPzPQTHE1N-GFC/view?usp=sharing';
{$ENDIF}

OpenURL(url, false);
end;

procedure TVersao.Btn_updateMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
rect_botao.Opacity := 0.5
end;

procedure TVersao.Btn_updateMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
rect_botao.Opacity := 1;
end;

procedure TVersao.FormCreate(Sender: TObject);
begin
     versao_app := '1,0';
   versao_server := '0,0' ;
   lbl_versao.Text := 'Vers�o ' + versao_app;
    Rect_update.Margins.Top := Versao.height  + 50;
end;

procedure TVersao.FormShow(Sender: TObject);
var
t: TThread;
begin
t:= TThread.CreateAnonymousThread(
procedure
var
JsonObj: TJSONObject;
begin
  sleep(2000);
  try
    RESTRequest1.Execute;
    except
    on ex: Exception do
    begin
      raise Exception.Create('Error ao acessar o servidor' + ex.Message);
   exit;
   end;
    end;
    try
    JsonObj := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(
    RESTRequest1.Response.JSONValue.ToString),0) as TJSONObject;

    versao_server := TJSONObject(JsonObj).GetValue('Versao').Value;
   
  finally
  JsonObj.DisposeOf;

  end;
end);
 t.Onterminate := OnFinishUpdate;
 t.Start;
 end;



procedure TVersao.OnFinishUpdate(Sender: TObject);
begin

  if Assigned(TThread(Sender).FatalException) then
  begin
    showmessage(Exception(TThread(Sender).FatalException).Message);
    exit;
  end;
  if versao_app > versao_server then
  begin
    rectFundo.Visible := true;
    ImageFundo.Position.Y :=0;
    imageFundo.Opacity :=0;
    rectFundo.BringToFront;
    rectFundo.AnimateFloat('Margins.Top',0,0.8, TAnimationType.InOut,
    TInterpolationType.Back);
    imageFundo.AnimateFloatDelay('Opacity',1,0.4,0.9);
     if not Assigned(FormCadastro) then
      Application.CreateForm(TFormCadastro, FormCadastro);
     FormCadastro.show();
     FormCadastro.CTabActionProximo.Execute;
  end;

  if versao_app < versao_server then
  begin
    Rect_update.Visible := true;
    image_seta.Position.Y := 0;
    image_seta.Opacity := 0;
    lbl_titulo.Opacity:= 0;
    lbl_texto.Opacity :=0;
    rect_botao.Opacity:=0;

    rect_update.BringToFront;


    rect_update.AnimateFloat('Margins.Top',0,0.8, TAnimationType.InOut,
    TInterpolationType.Back);
    image_seta.AnimateFloatDelay('Opacity',1,0.4,0.9);

        lbl_titulo.AnimateFloatDelay('Opacity', 1, 0.7, 1.3);
        lbl_texto.AnimateFloatDelay('Opacity', 1, 0.7, 1.6);
        rect_botao.AnimateFloatDelay('Opacity', 1, 0.7, 1.9);




  end;
end;

end.
