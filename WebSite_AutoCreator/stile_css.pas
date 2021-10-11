unit stile_css;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons;

type
  TForm4 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    RichEdit1: TRichEdit;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.FormCreate(Sender: TObject);
begin
 SpeedButton1.Height:=Panel2.Height-2;
 SpeedButton1.Width:=Panel2.Width-2;
end;

procedure TForm4.SpeedButton1Click(Sender: TObject);
begin
 if Form4.Caption='Просмотр/редактирование CSS стилей страниц'
 then RichEdit1.Lines.SaveToFile(ExtractFilePath(Application.ExeName)+'\data\style\pages_style.txt')
 else
  if Form4.Caption='Просмотр/редактирование cписка ссылок на сайты'
  then RichEdit1.Lines.SaveToFile(ExtractFilePath(Application.ExeName)+'\data\banners\links.txt')
  else
   if Form4.Caption='Просмотр/редактирование cписка банеров с описанием и ссылками'
   then RichEdit1.Lines.SaveToFile(ExtractFilePath(Application.ExeName)+'\data\banners\banners.txt')
   else
    if Form4.Caption='Скрипт генерации баннеров (баннер меняется случайным образом)'
    then RichEdit1.Lines.SaveToFile(ExtractFilePath(Application.ExeName)+'\data\banners\refresh_ban.txt');
end;

end.
