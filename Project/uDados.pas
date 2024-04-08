unit uDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDados = class(TDataModule)
    FDConnection1: TFDConnection;
    QueryClientes: TFDQuery;
    SourceClientes: TDataSource;
    procedure QueryClientesAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dados: TDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uPrincipal;

{$R *.dfm}

procedure TDados.QueryClientesAfterPost(DataSet: TDataSet);
begin
 with Frmprincipal do
 begin
  FRedis.DEL([MemoChave.Text]); // É necessario limpar a chave da memoria caso haja alteração de informações
  MemoDesc.Lines.Add('Chave liberada da memória');
 end;
end;

end.
