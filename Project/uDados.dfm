object Dados: TDados
  Height = 300
  Width = 506
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\amanc\OneDrive\Documentos\GitHub\REDIS\DB\BD.F' +
        'DB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 56
    Top = 24
  end
  object QueryClientes: TFDQuery
    Active = True
    AfterPost = QueryClientesAfterPost
    Connection = FDConnection1
    SQL.Strings = (
      'Select * from clientes')
    Left = 56
    Top = 88
  end
  object SourceClientes: TDataSource
    DataSet = QueryClientes
    Left = 160
    Top = 88
  end
end
