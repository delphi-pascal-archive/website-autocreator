unit preview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, SHDocVw, MSHTML, ExtCtrls, ShellApi,
  ActiveX, ComCtrls;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    WebBrowser1: TWebBrowser;
    RichEdit1: TRichEdit;
    Panel2: TPanel;
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses St_ac;

{$R *.dfm}

// Вставка текста (программно сгенерированной HTML-страницы)
// в TWebBrowser не из файла, а из текстовой переменной
procedure TextToWebBrowser(Text: string; var WB: TWebBrowser);
var
 Document: IHTMLDocument2;
 V: OleVariant;
begin
 // Документ необходимо создать только один раз за текущую
 // сессию работы
 if WB.Document=nil
 then WB.Navigate('about:blank');
 // Ожидаем создания документа и позволяем обрабатывать все
 // сообщения
 while WB.Document=nil do
  Application.ProcessMessages;
 Document:=WB.Document as IHtmlDocument2;
 // Вставляем текст (до 2Гб)
 // следующие строчки внесены недавно - старый вариант
 // ункции не работал под XP
 V:=VarArrayCreate([0,0], varVariant);
 V[0]:=Text;
 Document.Write(PSafeArray(TVarData(v).VArray));
 Document.Close;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
 WebBrowser1.Visible:=false;
 Button1.Click;
end;

procedure TForm2.Button1Click(Sender: TObject);
var
 i,j: integer;
 simb: string;
begin
 RichEdit1.Clear;
 RichEdit1.Lines.Add('<html>');
 RichEdit1.Lines.Add('<head>');
 RichEdit1.Lines.Add('<title>Test page</title>');
 RichEdit1.Lines.Add('<meta name="keywords" content="test">');
 RichEdit1.Lines.Add('<meta name="description" content="WebSite AutoCreator - Test">');
 RichEdit1.Lines.Add('<meta http-equiv="Content-Language" content="ru">');
 RichEdit1.Lines.Add('<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">');
 RichEdit1.Lines.Add('<style type="text/css">');
 RichEdit1.Lines.Add('<!--');
 RichEdit1.Lines.Add('body, p, td, br, table {font-family: Arial; font-size: 8pt}');
 RichEdit1.Lines.Add('h1 {font-family: Arial; font-weight: normal; font-size: 12pt}');
 RichEdit1.Lines.Add('h2 {font-family: Arial; font-weight: normal; font-size: 10pt}');
 RichEdit1.Lines.Add('a:link{text-decoration: none; color: #F7F7F7}');
 RichEdit1.Lines.Add('a:active{text-decoration: none}');
 RichEdit1.Lines.Add('a:visited{text-decoration: none; color: #F7F7F7}');
 RichEdit1.Lines.Add('a:hover{text-decoration: underline; color: #F7F7F7}');
 RichEdit1.Lines.Add('-->');
 RichEdit1.Lines.Add('</style>');
 RichEdit1.Lines.Add('</head>');
 RichEdit1.Lines.Add('<body marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" link=#000000 vlink=#000000 alink=#F0000F bgcolor="#'+IntToHex(GetRValue(Form1.Panel1.Color),2)+IntToHex(GetGValue(Form1.Panel1.Color),2)+IntToHex(GetBValue(Form1.Panel1.Color),2)+'">');
 RichEdit1.Lines.Add('<font size="2">&nbsp; </font></p>');
 //
 // общая таблица с фоном (верх)
 RichEdit1.Lines.Add('<div align="center">');
 RichEdit1.Lines.Add('<table border="0" width="700" cellspacing="0" cellpadding="0" bgcolor="#'+IntToHex(GetRValue(Form1.Panel5.Color),2)+IntToHex(GetGValue(Form1.Panel5.Color),2)+IntToHex(GetBValue(Form1.Panel5.Color),2)+'">');
 RichEdit1.Lines.Add('<tr>');
 RichEdit1.Lines.Add('<td>');
 RichEdit1.Lines.Add('<p style="margin-top: 0; margin-bottom: 0"><font size="2">&nbsp;');
 RichEdit1.Lines.Add('</font></p>');
 //
 // статичная таблица
 RichEdit1.Lines.Add('<div align="center">');
 RichEdit1.Lines.Add('<table border="1" width="'+Edit3.Text+'" cellspacing="0" cellpadding="0">');
 RichEdit1.Lines.Add('<tr>');
 Edit5.Text:='';
 simb:='1234567890АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюяABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.,';
 for i:=1 to 400 do // генерация случайных символов текста
  if i<(i+3-Random(20))
  then Edit5.Text:=Edit5.Text+simb[Random(Length(simb))]+' '
  else Edit5.Text:=Edit5.Text+simb[Random(Length(simb))];
 RichEdit1.Lines.Add('<td><font size="2" color="#'+IntToHex(GetRValue(Form1.Panel2.Color),2)+IntToHex(GetGValue(Form1.Panel2.Color),2)+IntToHex(GetBValue(Form1.Panel2.Color),2)+'">'+Edit5.Text+'</font></td>');
 RichEdit1.Lines.Add('</tr>');
 RichEdit1.Lines.Add('</table>');
 RichEdit1.Lines.Add('</div><br><br>');
 // генерируемая таблица
 // начало таблицы
 RichEdit1.Lines.Add('<div align="center">');
 RichEdit1.Lines.Add('<table border="1" width="'+Edit3.Text+'" cellspacing="0" cellpadding="0">');
 //
 for i:=1 to StrToInt(Edit1.Text) do // количество строк
  begin
   RichEdit1.Lines.Add('<tr>');
   for j:=1 to StrToInt(Edit2.Text) do // количество столбцов
    begin
     RichEdit1.Lines.Add('<td width="'+Edit4.Text+'"><font size="2" color="#'+IntToHex(GetRValue(Form1.Panel2.Color),2)+IntToHex(GetGValue(Form1.Panel2.Color),2)+IntToHex(GetBValue(Form1.Panel2.Color),2)+'">'+IntToStr(Random(99)+1)+'</font></td>');
     Application.ProcessMessages;
    end;
   Application.ProcessMessages;
   RichEdit1.Lines.Add('</tr>');
  end;
 // конец таблицы
 RichEdit1.Lines.Add('</table>');
 RichEdit1.Lines.Add('</div>');
 //
 RichEdit1.Lines.Add('<h1 align="center"><a href="http://www.delphisources.ru"><font color="#'+IntToHex(GetRValue(Form1.Panel4.Color),2)+IntToHex(GetGValue(Form1.Panel4.Color),2)+IntToHex(GetBValue(Form1.Panel4.Color),2)+'">Пример ссылки на страницу</font></a></h1>');
 //
 // общая таблица с фоном (низ)
 RichEdit1.Lines.Add('<p style="margin-top: 0"><font size="2">&nbsp; </font></td>');
 RichEdit1.Lines.Add('</tr>');
 RichEdit1.Lines.Add('</table>');
 RichEdit1.Lines.Add('</div>');
 // конец документа
 RichEdit1.Lines.Add('</body>');
 RichEdit1.Lines.Add('</html>');
 //
 TextToWebBrowser(RichEdit1.Text, WebBrowser1);
 WebBrowser1.Visible:=true;
end;

end.
