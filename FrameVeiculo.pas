unit FrameVeiculo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Layouts;

type
  TFrameVeiculos = class(TFrame)
    LayoutFundoVeiculo: TLayout;
    RectangleVeiculo: TRectangle;
    LabelNomeVeiculo: TLabel;
    RectangleIcones: TRectangle;
    ImageExcluirVeiculo: TImage;
    ImageEditarVeiculo: TImage;
    procedure ImageExcluirVeiculoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}
uses CadastroUsuario, TelaInicial, DM;
procedure TFrameVeiculos.ImageExcluirVeiculoClick(Sender: TObject);
var
i: integer;
begin
dataModul.QueryVeiculoEditDelete.Close;
DataModul.QueryVeiculoEditDelete.Open();
dataModul.QueryVeiculoEditDelete.ParamByName('pID').AsInteger :=FrmTelaInicial.idVeiculoGlobal;

dataModul.QueryVeiculoEditDelete.Delete;
showMessage('excluido');
end;

end.
