# Uso do REDIS com FireBirde e Delphi
 Uso do Redis com conexão com banco de dados .fdb

## ⚡️ Preparação do ambiente de desenvolvimento
1.	O Redis foi feito para ser usado no Linux, mas há uma versão para Windos na internet.
* Community: https://github.com/dmajkic/redis
* Microsoft:  https://github.com/microsoftarchive/redis

3.	Após extrair o Redis em sua máquina execute o redis-server.exe

<img align="center" alt="redis-server" height="250" width="500" src="https://github.com/amancio10/Redis-Delphi-FDB/assets/48102777/de2143a0-5904-410b-8776-ffcd6e4cad9c">

3. Agora baixe os fontes do Redis Client no seguinte repositório:
* https://github.com/danieleteti/delphiredisclient/tree/DELPHI_REDIS_CLIENT_VERSION_1
4. Após baixar informe o caminho no Libary path do Delphi:
<img align="center" alt="Libary path" height="250" width="400" src="https://github.com/amancio10/Redis-Delphi-FDB/assets/48102777/70ef1411-7065-48df-87b2-61c14f267111">
 
## ⚡️ Comandos necessários
```delphi
uses
  Redis.Client,
  Redis.NetLib.INDY,
  Redis.Commons;
```
```delphi
private
 { Private declarations }
   FRedis : iRedisClient;
```
```delphi
procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
 FRedis := NewRedisClient;
end;
```
## ⚡️ Uso em servidor
1. Na pasta do Redis para Windows encontre o arquivo redis.windows.conf e altere a opção bind para 0.0.0.0
<img align="center" alt="redis.windows.conf" height="250" width="400" src="https://github.com/amancio10/Redis-Delphi-FDB/assets/48102777/0fbe1a95-2d56-484d-abc7-bed46510ef93">

2. Abra o CMD e execulte o Redis por ele, passanto Caminho + redis-server.exe redis.windows.conf
<img align="center" alt="CMD" height="250" width="400" src="https://github.com/amancio10/Redis-Delphi-FDB/assets/48102777/e634266b-0c68-45cd-8355-ec3b34a02941">

3. Informe o caminho do servidor:
```delphi
procedure TFrmPrincipal.FormCreate(Sender: TObject);
var
IP    : string;
Porta : Integer
begin
IP    := '192.168.1.1'
Porta := 3345;
//
FRedis := NewRedisClient(IP, Porta);
end;
``` 
## ⚡️ Em execução
<img align="center" alt="Em execução" height="250" width="400" src="https://github.com/amancio10/Redis-Delphi-FDB/assets/48102777/14c2b697-d1c8-40fb-8e9a-fab3e80b0e4f">
