unit exemple_api_json;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uLkJSON, IdHTTP;

type
  TForm1 = class(TForm)
    Button1: TButton;
    memoJson: TMemo;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  json:TlkJSONobject;
  jslist:TlkJSONlist;
  jstemp: TlkJSONobject;

  jslist2:TlkJSONlist;
  jstemp2: TlkJSONobject;

  vAtributoSimples: TlkJSONstring;
  vAtributoLista: TlkJSONlist;

  s: String;
  filhoTexto : WideString;

  URL, Retorno: String;
  idhttp : TIdHTTP;

  JsonStreamRetorno, JsonStreamEnvio: TStringStream;
begin
  memoJson.Clear;
  json := TlkJSONobject.Create;

  jstemp := TlkJSONobject.Create();
  jstemp.Add('nomeRua','Rua teste do teste');
  jstemp.Add('numero',333);
  jslist := TlkJSONlist.Create;
  jslist.Add(jstemp);

  jstemp2 := TlkJSONobject.Create();
  jstemp2.Add('t1','v1');
  jstemp2.Add('t2','v2');
  jslist2 := TlkJSONlist.Create;
  jslist2.Add(jstemp2)  ;


  json.Add('name','Ingrid Alves');
  json.Add('telefone','55 (11) 99999-9999');
  json.Add('idade','25');
  json.Add('altura','1.70');
  json.Add('endereco',jslist);
  json.Add('endereco',jslist2);

  s := TlkJSON.GenerateText(json);
  JsonStreamEnvio := TStringStream.Create(s);
  memoJson.Lines.Add(s);
  memoJson.Lines.Add('');
  memoJson.Lines.Add('');

  vAtributoSimples := json.Field['altura'] as TlkJSONstring;
  s := vAtributoSimples.Value;
  memoJson.Lines.Add('Capturando valor atributo simples - Altura: ' + s);

  vAtributoLista := json.Field['endereco'] as TlkJSONlist;
  s := VarToStr(vAtributoLista.Child[0].Field['numero'].Value);
  memoJson.Lines.Add('Capturando valor atributo da lista - Numero: ' + s);
  memoJson.Lines.Add('');
  memoJson.Lines.Add('');


  // REST API
  URL := 'Endereco da API';
  idhttp := TIdHTTP.Create(nil);
  try
    idhttp.Request.ContentType := 'application/json';
    idHttp.Request.Clear;

    idHttp.Response.ContentType := 'application/json';

    idHttp.Post(URL, JsonStreamEnvio, JsonStreamRetorno);
  finally
    memoJson.Lines.LoadFromStream(JsonStreamRetorno);
    memoJson.Lines.add('1=' + JsonStreamRetorno.DataString);
    memoJson.Lines.add('3=' + Retorno);
  end;

  json.Free;
end;

procedure TForm1.Button2Click(Sender: TObject);
var json, URL, Retorno : string;
    JsonStreamRetorno, JsonStreamEnvio: TStringStream;
    idhttp : TIdHTTP;
begin
  memoJson.Clear;
  json := '[{"atributo_1":"valor_1","atributo_2":"valor_2"},{"atributo_3":"valor_3","atributo_4":"valor_4"},{"atributo_5":"valor_5","atributo_6":"valor_6"},{"atributo_7":"valor_7","atributo_8":"valor_8"}]';
  memoJson.Lines.Add(json);
  JsonStreamEnvio := TStringStream.Create(json);

  URL := 'URL API AQUI';
  idhttp := TIdHTTP.Create(nil);
  try
    idhttp.Request.ContentType := 'application/json';
    idHttp.Request.BasicAuthentication := False;

    Retorno := idHttp.Post(URL, JsonStreamEnvio);
  finally
    memoJson.Lines.add('');
    memoJson.Lines.add(Retorno);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var stringJson, URL, Retorno : string;
    JsonStreamRetorno, JsonStreamEnvio: TStringStream;
    idhttp : TIdHTTP;

    jslist:TlkJSONlist;
    jstemp: TlkJSONobject;
begin
  memoJson.Clear;

  // Montar Json
  jstemp := TlkJSONobject.Create();
  jstemp.Add('atributo_1','valor_1');
  jstemp.Add('atributo_2','valor_2');
  jslist := TlkJSONlist.Create;
  jslist.Add(jstemp);

  jstemp := nil;
  jstemp := TlkJSONobject.Create();
  jstemp.Add('atributo_3','valor_3');
  jstemp.Add('atributo_4','valor_4');
  jslist.Add(jstemp);

  jstemp := nil;
  jstemp := TlkJSONobject.Create();
  jstemp.Add('atributo_5','valor_5');
  jstemp.Add('atributo_6','valor_6');
  jslist.Add(jstemp);

  jstemp := nil;
  jstemp := TlkJSONobject.Create();
  jstemp.Add('atributo_7','valor_7');
  jstemp.Add('atributo_8','valor_8');
  jslist.Add(jstemp);


  stringJson := TlkJSON.GenerateText(jslist);
  memoJson.Lines.Add(stringJson);
  JsonStreamEnvio := TStringStream.Create(stringJson);

  URL := 'URL API AQUI';
  idhttp := TIdHTTP.Create(nil);
  try
    idHttp.Request.BasicAuthentication := False;
    idHttp.Response.ContentType := 'application/json';

    Retorno := idHttp.Post(URL, JsonStreamEnvio);
  finally
    memoJson.Lines.add('');
    memoJson.Lines.add(Retorno);
  end;
end;

end.
