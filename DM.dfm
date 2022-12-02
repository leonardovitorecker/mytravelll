object DataModul: TDataModul
  OldCreateOrder = False
  Height = 310
  Width = 335
  object Connection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\LEONARDO\Desktop\documenst\trabalho de delphi\' +
        'Banco\mytravel1.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    AfterConnect = connectionAfterConnect
    BeforeConnect = ConnectionBeforeConnect
    Left = 40
    Top = 32
  end
  object QueryUsuarioCadastro: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'select * from usuario'
      'where email =:pEmail')
    Left = 128
    Top = 32
    ParamData = <
      item
        Name = 'PEMAIL'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object QueryUsuarioCadastroid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QueryUsuarioCadastronome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 40
    end
    object QueryUsuarioCadastrotelefone: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      Size = 13
    end
    object QueryUsuarioCadastroemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 60
    end
    object QueryUsuarioCadastrosenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
      Size = 40
    end
  end
  object QueryBuscaUsuario: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'select * from usuario'
      'where id=:pId')
    Left = 256
    Top = 32
    ParamData = <
      item
        Name = 'PID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QueryBuscaUsuarioid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QueryBuscaUsuarionome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 40
    end
    object QueryBuscaUsuariotelefone: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      Size = 13
    end
    object QueryBuscaUsuarioemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 60
    end
    object QueryBuscaUsuariosenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
      Size = 40
    end
  end
  object QueryVeiculo: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'select * from veiculo')
    Left = 64
    Top = 120
    object QueryVeiculoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QueryVeiculonome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 40
    end
    object QueryVeiculomarca: TStringField
      FieldName = 'marca'
      Origin = 'marca'
      Size = 13
    end
    object QueryVeiculomodelo: TStringField
      FieldName = 'modelo'
      Origin = 'modelo'
      Size = 60
    end
    object QueryVeiculoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
    end
    object QueryVeiculoanoFabricacao: TStringField
      FieldName = 'anoFabricacao'
      Origin = 'anoFabricacao'
      Size = 40
    end
    object QueryVeiculocombustivel: TStringField
      FieldName = 'combustivel'
      Origin = 'combustivel'
      Size = 10
    end
    object QueryVeiculomediaLitro: TBCDField
      FieldName = 'mediaLitro'
      Origin = 'mediaLitro'
      Precision = 10
      Size = 2
    end
  end
  object QueryBuscaVeiculo: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'select * from veiculo'
      'where idusuario=:pId')
    Left = 144
    Top = 120
    ParamData = <
      item
        Name = 'PID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object QueryBuscaVeiculoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QueryBuscaVeiculonome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 40
    end
    object QueryBuscaVeiculomarca: TStringField
      FieldName = 'marca'
      Origin = 'marca'
      Size = 13
    end
    object QueryBuscaVeiculomodelo: TStringField
      FieldName = 'modelo'
      Origin = 'modelo'
      Size = 60
    end
    object QueryBuscaVeiculoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
    end
    object QueryBuscaVeiculoanoFabricacao: TStringField
      FieldName = 'anoFabricacao'
      Origin = 'anoFabricacao'
      Size = 40
    end
    object QueryBuscaVeiculocombustivel: TStringField
      FieldName = 'combustivel'
      Origin = 'combustivel'
      Size = 10
    end
    object QueryBuscaVeiculomediaLitro: TBCDField
      FieldName = 'mediaLitro'
      Origin = 'mediaLitro'
      Precision = 10
      Size = 2
    end
  end
  object QueryVeiculoEditDelete: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'select * from veiculo'
      'where id=:pId')
    Left = 256
    Top = 128
    ParamData = <
      item
        Name = 'PID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QueryVeiculoEditDeleteid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QueryVeiculoEditDeletenome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 40
    end
    object QueryVeiculoEditDeletemarca: TStringField
      FieldName = 'marca'
      Origin = 'marca'
      Size = 13
    end
    object QueryVeiculoEditDeletemodelo: TStringField
      FieldName = 'modelo'
      Origin = 'modelo'
      Size = 60
    end
    object QueryVeiculoEditDeleteidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
    end
    object QueryVeiculoEditDeleteanoFabricacao: TStringField
      FieldName = 'anoFabricacao'
      Origin = 'anoFabricacao'
      Size = 40
    end
    object QueryVeiculoEditDeletecombustivel: TStringField
      FieldName = 'combustivel'
      Origin = 'combustivel'
      Size = 10
    end
    object QueryVeiculoEditDeletemediaLitro: TBCDField
      FieldName = 'mediaLitro'
      Origin = 'mediaLitro'
      Precision = 10
      Size = 2
    end
  end
end
