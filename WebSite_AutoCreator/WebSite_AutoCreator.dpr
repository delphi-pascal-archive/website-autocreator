program WebSite_AutoCreator;

uses
  Forms,
  St_ac in 'St_ac.pas' {Form1},
  preview in 'preview.pas' {Form2},
  stile_css in 'stile_css.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
