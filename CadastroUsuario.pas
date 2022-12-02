unit CadastroUsuario;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.Layouts,
  FMX.ExtCtrls, System.Actions, IdHashSHA, FMX.ActnList;

type
  TFormCadastro = class(TForm)
    LayoutTelaInteira: TLayout;
    LayoutCenter: TLayout;
    ImageLogo1: TImage;
    LayoutConSenha: TLayout;
    RoundRectConSenha: TRoundRect;
    EditConSenha: TEdit;
    LayoutSenha: TLayout;
    RoundRectSenha: TRoundRect;
    EditSenha: TEdit;
    LayoutCadastrar: TLayout;
    RoundRectCadastrar: TRoundRect;
    LabelCadastrar: TLabel;
    ActionListCadastro: TActionList;
    CTabActionProximo: TChangeTabAction;
    CTabActionCadastrar: TChangeTabAction;
    CTabActionLogin: TChangeTabAction;
    TabControlCadastro: TTabControl;
    TabItemProximo: TTabItem;
    TabItemLogin: TTabItem;
    TabItemCadastrar: TTabItem;
    StyleBookCadastro: TStyleBook;
    LayoutLogin: TLayout;
    LayoutCenterLogin: TLayout;
    ImageLogoLogin: TImage;
    LayoutLoginSenha: TLayout;
    RoundRectLoginSenha: TRoundRect;
    EditLoginSenha: TEdit;
    LayoutLoginEmail: TLayout;
    RoundRectLoginEmail: TRoundRect;
    EditLoginEmail: TEdit;
    LayoutLogar: TLayout;
    RoundRectLogar: TRoundRect;
    LabelLogar: TLabel;
    LayoutPrincipalProximo: TLayout;
    LayoutCenterProximo: TLayout;
    ImageLogoProximo: TImage;
    LayoutEmail: TLayout;
    RoundRectEmail: TRoundRect;
    EditEmail: TEdit;
    LayoutNome: TLayout;
    RoundRectNome: TRoundRect;
    EditNome: TEdit;
    LayoutProximo: TLayout;
    RoundRectProximo: TRoundRect;
    LabelProximo: TLabel;
    LayoutTelefone: TLayout;
    RoundRectTelefone: TRoundRect;
    EditTelefone: TEdit;
    LayoutBarra: TLayout;
    LabelCadastro: TLabel;
    LabelLogin: TLabel;
    LayoutLoginBarra: TLayout;
    LabelProximoCriarConta: TLabel;
    LabelProximoLogin: TLabel;
    LayoutCadastroBarra: TLayout;
    LabelCadastroCriarConta: TLabel;
    LabelCadastroLogin: TLabel;

    procedure RoundRectProximoClick(Sender: TObject);

    procedure RoundRectCadastrarClick(Sender: TObject);
    procedure RoundRectLogarClick(Sender: TObject);
    procedure LabelProximoLoginClick(Sender: TObject);
    procedure LabelCadastroClick(Sender: TObject);
    procedure LabelCadastroLoginClick(Sender: TObject);




  private
    { Private declarations }
  public
    IdUsuarioGlobal: integer; { Public declarations }
  end;

var
  FormCadastro: TFormCadastro;

implementation

uses DM, TelaInicial;
{$R *.fmx}

function SHA1FromString(const AString: string): string;
var
  SHA1: TIdHashSHA1;
begin
  SHA1 := TIdHashSHA1.Create;
  try
    Result := SHA1.HashStringAsHex(AString);
  finally
    SHA1.Free;
  end;
end;


procedure TFormCadastro.LabelCadastroClick(Sender: TObject);
begin
CTabActionProximo.Execute;
LabelProximoCriarConta.StyledSettings := labelCadastroCriarConta.StyledSettings -[TStyledSetting.ssFontColor];
 labelProximoCriarConta.FontColor:=$FF4C38F6;
end;



procedure TFormCadastro.LabelCadastroLoginClick(Sender: TObject);
begin
CTabActionLogin.Execute;
labelLogin.StyledSettings := labelLogin.StyledSettings - [TStyledSetting.ssFontColor];
labelLogin.FontColor:=$FF4C38F6;
end;

procedure TFormCadastro.LabelProximoLoginClick(Sender: TObject);
begin
CTabActionLogin.Execute;
labelLogin.StyledSettings := labelLogin.StyledSettings - [TStyledSetting.ssFontColor];
labelLogin.FontColor:=$FF4C38F6;
end;

procedure TFormCadastro.RoundRectCadastrarClick(Sender: TObject);
var
  senha: string;

begin
  senha := SHA1FromString(EditSenha.Text);
  DataModul.QueryUsuarioCadastro.Close;
  DataModul.QueryUsuarioCadastro.Open();

  if (EditSenha.Text <> EmptyStr) or (EditConSenha.Text <> EmptyStr) then
  begin
    if (EditConSenha.Text = EditSenha.Text) then
    begin
      DataModul.QueryUsuarioCadastro.Append;
      DataModul.QueryUsuarioCadastroNome.AsString := EditNome.Text;
      DataModul.QueryUsuarioCadastroEmail.AsString := EditEmail.Text;
      DataModul.QueryUsuarioCadastroTelefone.AsString := EditTelefone.Text;
      DataModul.QueryUsuarioCadastroSenha.AsString := senha;
      DataModul.QueryUsuarioCadastro.Post;
      DataModul.Connection.CommitRetaining;
      IdUsuarioGlobal:= DataModul.QueryUsuarioCadastroid.AsInteger;

      if not Assigned(FrmTelaInicial) then
      Application.CreateForm(TFrmTelaInicial, FrmTelaInicial);
     FrmTelaInicial.show();
     FrmTelaInicial.CTabActionHome.Execute;

    end
       else
    begin
      ShowMessage('As senhas n�o coincidem');
    end;

  end
  else
  begin
    EditSenha.SetFocus;
    EditConSenha.SetFocus;
    ShowMessage('preencha os campos');
  end;

end;

procedure TFormCadastro.RoundRectLogarClick(Sender: TObject);
var
senha: string;
begin
   senha:= SHA1FromString(EditLoginSenha.Text);
   DataModul.QueryUsuarioCadastro.Close;
   DataModul.QueryUsuarioCadastro.ParamByName('pEmail').AsString := EditLoginEmail.Text;
   DataModul.QueryUsuarioCadastro.Open();

   if (DataModul.QueryUsuarioCadastro <> nil) then
   begin
     if (DataModul.QueryUsuarioCadastroEmail.AsString = EditLoginEmail.Text) then
     begin
    if(DataModul.QueryUsuarioCadastroSenha.AsString = senha) then
     begin
       idUsuarioGlobal := DataModul.QueryUsuarioCadastroId.AsInteger;
       if not Assigned(FrmTelaInicial) then
      Application.CreateForm(TFrmTelaInicial, FrmTelaInicial);
      FrmTelaInicial.show();
     FrmTelaInicial.CTabActionHome.Execute;
     end
     else
     begin
       ShowMessage('Senha est� incorreta');
     end;
     end
     else
     begin
       ShowMessage('Email est� incorreto');
     end;
   end
   else
   ShowMessage('Erro interno ocorrido, acione o suporte');
end;

procedure TFormCadastro.RoundRectProximoClick(Sender: TObject);
begin
  if (EditNome.Text = EmptyStr) then
  begin
    EditNome.SetFocus;
  end
  else if (EditEmail.Text = EmptyStr) then
  begin
    EditEmail.SetFocus;
  end
  else if (EditTelefone.Text = EmptyStr) then
  begin
    EditTelefone.SetFocus;
  end
  else
  begin
    CTabActionCadastrar.Execute;
    LabelCadastroCriarConta.StyledSettings := labelLogin.StyledSettings - [TStyledSetting.ssFontColor];
    LabelCadastroCriarConta.FontColor:=$FF4C38F6;
  end;

end;

end.
