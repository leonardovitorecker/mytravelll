program MyTravel;

uses
  System.StartUpCopy,
  FMX.Forms,
  CadastroUsuario in 'CadastroUsuario.pas' {FormCadastro},
  DM in 'DM.pas' {DataModul: TDataModule},
  TelaInicial in 'TelaInicial.pas' {FrmTelaInicial},
  UnitVeiculo in 'UnitVeiculo.pas' {FormVeiculo},
  Splash in 'Splash.pas' {Versao},
  FrameVeiculo in 'FrameVeiculo.pas' {FrameVeiculos: TFrame},
  UOpenURL in 'UOpenURL.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDataModul, DataModul);
  Application.CreateForm(TVersao, Versao);
  Application.Run;
end.
