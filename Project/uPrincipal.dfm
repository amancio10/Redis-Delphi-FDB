object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Busca de clientes com REDIS'
  ClientHeight = 405
  ClientWidth = 662
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 392
    Top = 259
    Width = 139
    Height = 15
    Caption = 'Chave Redis / Pesquisa DB'
  end
  object SpeedButton1: TSpeedButton
    Left = 391
    Top = 328
    Width = 186
    Height = 30
    Caption = 'Atualizar tempo em cache para:'
    Flat = True
    OnClick = SpeedButton1Click
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 8
    Width = 385
    Height = 344
    DataSource = Dados.SourceClientes
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMIAL'
        Title.Caption = 'E-mail'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TEL'
        Title.Caption = 'Tel.'
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 391
    Top = 364
    Width = 263
    Height = 33
    Caption = 'Buscar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object MemoDesc: TMemo
    Left = 391
    Top = 8
    Width = 263
    Height = 241
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 364
    Width = 380
    Height = 33
    DataSource = Dados.SourceClientes
    TabOrder = 3
  end
  object edtTimeCache: TEdit
    Left = 583
    Top = 332
    Width = 71
    Height = 23
    TabOrder = 4
    Text = '10'
    OnKeyPress = edtTimeCacheKeyPress
  end
  object MemoChave: TMemo
    Left = 392
    Top = 280
    Width = 262
    Height = 41
    Lines.Strings = (
      'Select * from clientes')
    TabOrder = 5
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 520
    Top = 56
  end
end
