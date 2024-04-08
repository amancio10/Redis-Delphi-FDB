unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  //
  Redis.Client,
  Redis.NetLib.INDY,
  Redis.Commons,
  //
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, FireDAC.Stan.StorageJSON,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls;

type
  TFrmPrincipal = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    MemoDesc: TMemo;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    DBNavigator1: TDBNavigator;
    edtTimeCache: TEdit;
    MemoChave: TMemo;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edtTimeCacheKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    FRedis : iRedisClient;
    SQLKey : string;
    TimeCache : Integer;
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses uDados, FireDAC.Stan.Intf, Redis.Values;

procedure TFrmPrincipal.Button1Click(Sender: TObject);
var
  FDStream : TStringStream; // Use TStringStream em vez de TStream
  KeyRedis : TRedisString;
  SQLKey   : string;
  //
  lInicio : TDateTime;
  lFinal  : TDateTime;
begin
  lInicio := Now;

  TimeCache := StrToint(edtTimeCache.Text);
  FDStream := TStringStream.Create(''); // Crie um TStringStream vazio

  SQLKey := MemoChave.Text;
  try
   KeyRedis := FRedis.GET(SQLKey);

   if KeyRedis.HasValue then
   begin
    FDStream.WriteString(KeyRedis);
    FDStream.Position := 0;

    with Dados do
     QueryClientes.LoadFromStream(FDStream, sfJSON);

    lFinal  := Now;                           {Máscara de hora completa 'hh:nn:ss.zzz'}
    MemoDesc.Lines.Add('Resultado do CACHE : ' + FormatDateTime('ss.zzz', (lInicio - lFinal)) + ' Seguntos');
   end
   else
   begin

    With Dados do
    begin
      QueryClientes.Open(SQLKey);
      QueryClientes.SaveToStream(FDStream, sfJSON);
    end;

    FDStream.Position := 0;
    FRedis.&SET(SQLKey, FDStream.DataString, TimeCache);

    lFinal  := Now;                           {Máscara de hora completa 'hh:nn:ss.zzz'}
    MemoDesc.Lines.Add('Resultado do BANCO : ' + FormatDateTime('ss.zzz', (lInicio- lFinal)) + ' Seguntos');
   end;

  finally
    FDStream.Free;
  end;
end;

procedure TFrmPrincipal.edtTimeCacheKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9', #8]) then
  key := #0;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
 FRedis := NewRedisClient;
end;

procedure TFrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
 FRedis.EXPIRE(SQLKey, TimeCache);
 MemoDesc.Lines.Add('Tempo em cache atualizado para' + edtTimeCache.Text + ' seguntos');
end;

end.
