program projeto_exemplo_api_json;

uses
  Forms,
  exemple_api_json in 'exemple_api_json.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
