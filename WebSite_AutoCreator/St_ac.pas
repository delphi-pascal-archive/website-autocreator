unit St_ac;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SHDocVw, ExtCtrls, StdCtrls, ComCtrls, OleCtrls, JPEG,
  Buttons, ActiveX, MSHTML, ShellApi, Spin, DateUtils, IniFiles, Menus;

type
  TForm1 = class(TForm)
    ProgressBar1: TProgressBar;
    Label11: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label7: TLabel;
    Label1: TLabel;
    Label15: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label17: TLabel;
    Edit2: TEdit;
    Label26: TLabel;
    SpinEdit4: TSpinEdit;
    Button2: TButton;
    Button1: TButton;
    Button5: TButton;
    Button4: TButton;
    Label2: TLabel;
    RichEdit1: TRichEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    SpinEdit1: TSpinEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label22: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    ColorDialog1: TColorDialog;
    Bevel1: TBevel;
    Label21: TLabel;
    SpinEdit6: TSpinEdit;
    Label3: TLabel;
    Label12: TLabel;
    Label25: TLabel;
    Bevel2: TBevel;
    GroupBox1: TGroupBox;
    Button3: TButton;
    Label16: TLabel;
    Label19: TLabel;
    Panel3: TPanel;
    SpinEdit3: TSpinEdit;
    Label18: TLabel;
    SpinEdit2: TSpinEdit;
    Image1: TImage;
    CheckBox1: TCheckBox;
    Label23: TLabel;
    Panel5: TPanel;
    Bevel3: TBevel;
    CheckBox2: TCheckBox;
    GroupBox2: TGroupBox;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    ComboBox9: TComboBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Label24: TLabel;
    SpinEdit5: TSpinEdit;
    Label28: TLabel;
    Panel6: TPanel;
    Label29: TLabel;
    Edit1: TEdit;
    TabSheet4: TTabSheet;
    Label20: TLabel;
    Label27: TLabel;
    Bevel4: TBevel;
    Edit11: TEdit;
    ComboBox10: TComboBox;
    GroupBox3: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    CheckBox3: TCheckBox;
    Button9: TButton;
    Label31: TLabel;
    Bevel5: TBevel;
    Label32: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Button10: TButton;
    Button11: TButton;
    OpenDialog1: TOpenDialog;
    Button12: TButton;
    ComboBox11: TComboBox;
    Label30: TLabel;
    Label33: TLabel;
    ComboBox12: TComboBox;
    Button13: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Panel3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Panel4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel1Click(Sender: TObject);
    procedure Panel5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel6Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure ComboBox12Change(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    (*       Для INI
    procedure ComboBox1Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    *)
  private
    { Private declarations }
  public
    // procedure ComponentChange; Для INI
    procedure Time_generation(ms: real); // время генерации страниц
    procedure Index_page;   // генерация главной страницы
    procedure Zagolov_page; // генерация заголовков страниц
    procedure Text_on_page; // генерация текста на страницах
    procedure Ssilki_niz;   // ссылки на 5 страц слева и справа
    { Public declarations }
  end;

var
  Form1: TForm1;
  temp: TComponent;
  IniFile: TIniFile;
  i,comp_ind: integer;
  stop: boolean=false;
  site_ver,date_now,rand, gen_time: string;
  Str,Keyw_str,Buffer_Str,Str_ZagPage,Str_GenText: TStringList;

implementation

uses preview, stile_css;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
 i,j: integer;
 s,tmes,name,pref: string;
 Keys: TStringList;
begin
 Keys:=TStringList.Create;
 Str:=TStringList.Create;
 //
 // загрузка путей к файлам с текстом
 Str.LoadFromFile(ExtractFilePath(Application.ExeName)+'path.prg');
 Edit3.Text:=Str.Strings[0];
 Edit4.Text:=Str.Strings[1];
 //
 Keyw_str:=TStringList.Create;
 //
(*
 ////////////////////////////////////////      INI ФАЙЛЫ
 //
 IniFile:=TIniFile.Create(ExtractFilePath(Application.Exename)+'prog.ini');
 // Заполнение списков из INI
 //
 for i:=1 to 4 do
  begin
   temp:=FindComponent('ComboBox'+IntToStr(i));
   //
   if i=1
   then
    begin
     name:='title';
     pref:='t';
    end
   else if i=2 then
    begin
     name:='description';
     pref:='d';
    end
   else if i=3 then
    begin
     name:='author';
     pref:='a';
    end
   else if i=4 then
    begin
     name:='copyright';
     pref:='c';
    end;
   //
   s:=IniFile.ReadString(name,pref+'_default','');
   if s=''
   then
    begin
     IniFile.WriteString(name,pref+'_default','1');
     IniFile.WriteString(name,pref+'_1',IntToStr(i));
    end
   else
    begin
     (temp as TComboBox).Text:=IniFile.ReadString(name,pref+'_'+s,'');
     Keys.Clear;
     IniFile.ReadSection(name,Keys);
     // значения ключей
     for j:=1 to Keys.Count-1 do
      begin
       s:=IniFile.ReadString(name,Keys.Strings[j],'');
       (temp as TComboBox).Items.Add(s);
      end;
    end;
  end;
 //                    КОНЕЦ INI
 ////////////////////////////////////////////////////////
*)
 Application.Title:=Form1.Caption;
 // папка '../result_site' (корень сайта)
 if not DirectoryExists(ExtractFilePath(Application.ExeName)+'\result_site\')
 then CreateDir(ExtractFilePath(Application.ExeName)+'\result_site\');
 // папка '../pages'
 if not DirectoryExists(ExtractFilePath(Application.ExeName)+'\result_site\pages')
 then CreateDir(ExtractFilePath(Application.ExeName)+'\result_site\pages');
 // папка '../pages/scripts'
 if not DirectoryExists(ExtractFilePath(Application.ExeName)+'\result_site\pages\scripts')
 then CreateDir(ExtractFilePath(Application.ExeName)+'\result_site\pages\scripts');
 // папка '../images'
 if not DirectoryExists(ExtractFilePath(Application.ExeName)+'\result_site\images')
 then CreateDir(ExtractFilePath(Application.ExeName)+'\result_site\images');
 // папка '../images/baners'
 if not DirectoryExists(ExtractFilePath(Application.ExeName)+'\result_site\images\baners')
 then CreateDir(ExtractFilePath(Application.ExeName)+'\result_site\images\baners');
 // папка '../images/fon'
 if not DirectoryExists(ExtractFilePath(Application.ExeName)+'\result_site\images\fon')
 then CreateDir(ExtractFilePath(Application.ExeName)+'\result_site\images\fon');
 Buffer_Str:=TStringList.Create; // стиль CSS
 Str_ZagPage:=TStringList.Create; // заголовки страниц
 Str_GenText:=TStringList.Create; // генерация страниц
 // Подпись вницу всех страниц
 // Edit11.Text:='Дата: '+FormatDateTime('HH:NN:SS',Now);
 // Edit11.Text:='Дата: '+FormatDateTime('dd:mm:yyyy',Now);
 tmes:=FormatDateTime('mm',Now);
 if tmes='01' then tmes:='january';
 if tmes='02' then tmes:='february';
 if tmes='03' then tmes:='march';
 if tmes='04' then tmes:='april';
 if tmes='05' then tmes:='may';
 if tmes='06' then tmes:='june';
 if tmes='07' then tmes:='july';
 if tmes='08' then tmes:='august';
 if tmes='09' then tmes:='september';
 if tmes='10' then tmes:='october';
 if tmes='11' then tmes:='november';
 if tmes='12' then tmes:='december';
 //
 s:=Form1.Caption;
 Delete(s,1,pos('r v',s)+2);
 site_ver:=s;
 date_now:=FormatDateTime('dd',Now)+' '+tmes+', '+FormatDateTime('yyyy',Now);
 Edit11.Text:='Site Version '+site_ver+', Powered by "'+Form1.Caption+'", '+date_now;
 //
 Keys.Free;
 //
 // загрузка списка сайтов
 ComboBox10.Items.LoadFromFile(ExtractFilePath(Application.ExeName)+'\data\banners\all_sites.txt');
 ComboBox11.Items.Assign(ComboBox10.Items);
 ComboBox10.Text:=ComboBox10.Items.Strings[0];
 ComboBox11.Text:=ComboBox10.Text;
 // загрузка имен сайтов
 ComboBox12.Items.LoadFromFile(ExtractFilePath(Application.ExeName)+'\data\text_to_page\zagolov_name_sites.txt');
 ComboBox12.Text:=ComboBox12.Items.Strings[0];
 // заполнения полей
 // заголовок главной страницы
 ComboBox5.Text:=ComboBox12.Text+' - Сайт содержит ...';
 //
 ComboBox1.Text:=ComboBox12.Text+' - Сайт про ...';
 // описание страниц
 ComboBox2.Text:=ComboBox12.Text+' - Пример автоматического создания Интернет-сайта';
end;

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

////////////////// ссылки на 5 страц слева и справа
procedure TForm1.Ssilki_niz;
var
 z,k,p,x,j: integer;
begin
 if i=1 // страница после index.html
 then
  begin
   Str.Add('<br>< ... <b><a href="../index.html">Главная</a><font color="#F7F7F7"></b>, ');
   Str.Add('<b>[ <a href="'+Edit2.Text+Format('_%0.6d', [i])+'.html">'+Format('_%0.6d', [i])+'</a> ]</b>, ');
   Str.Add('<b><a href="'+Edit2.Text+Format('_%0.6d', [i+1])+'.html">'+Format('_%0.6d', [i+1])+'</a><font color="#F7F7F7"></b> ... ></font><br>');
  end
 else
  if i=SpinEdit1.Value-1 // последняя страница
  then
   begin
    Str.Add('<br>< ... <b><a href="'+Edit2.Text+Format('_%0.6d', [i-1])+'.html">'+Format('_%0.6d', [i-1])+'</a><font color="#F7F7F7"></b>, ');
    Str.Add('<b>[ <a href="'+Edit2.Text+'_'+Format('_%0.6d', [i])+'.html">'+Format('_%0.6d', [i])+'</a> ]</b>, ');
    Str.Add('<b><a href="../index.html">Главная</a><font color="#F7F7F7"></b> ... ></font><br>');
   end
  else
   begin
    z:=0;
    k:=1;
    p:=4;
    if (i>1) and (i<6) // остальные страницы
    then
     begin
      x:=1;
      z:=i-k;
      for j:=1 to 11 do
       begin
        //
        // 1
        if j=1
        then
         if (j-p)=0
         then Str.Add('<br>< ... <b><a href="index.html">index.html</a><font color="#F7F7F7"></b>, </font>')
         else Str.Add('<br>< ... <b><a href="'+Edit2.Text+Format('_%0.6d', [SpinEdit1.Value-z-1])+'.html">'+Format('_%0.6d', [SpinEdit1.Value-z-1])+'</a><font color="#F7F7F7"></b>, </font>');
        //
        //
        if (j>1) and (j<6)
        then
         begin
          if (j-p)=i
          then Str.Add('<b><a href="index.html">index.html</a><font color="#F7F7F7"></b>, </font>')
          else
           begin
            if (j-p)<0
            then Str.Add('<b><a href="'+Edit2.Text+Format('_%0.6d', [SpinEdit1.Value-z])+'.html">'+Format('_%0.6d', [SpinEdit1.Value-z])+'</a><font color="#F7F7F7"></b>, </font>');
            if (j-p)=0
            then Str.Add('<b><a href="index.html">index.html</a><font color="#F7F7F7"></b>, </font>');
            if (j-p)>=1
            then Str.Add('<b><a href="'+Edit2.Text+Format('_%0.6d', [j-p])+'.html">'+Format('_%0.6d', [j-p])+'</a><font color="#F7F7F7"></b>, </font>');
            dec(z);
           end;
         end;
        //
        // эта страница
        if j=6
        then Str.Add('<b>[ <a href="'+Edit2.Text+Format('_%0.6d', [i])+'.html">'+Format('_%0.6d', [i])+'</a> ]</b>, </font>');
        //
        // 6-10
        if (j>6) and (j<11)
        then
         begin
          Str.Add('<b><a href="'+Edit2.Text+Format('_%0.6d', [i+x])+'.html">'+Format('_%0.6d', [i+x])+'</a><font color="#F7F7F7"></b>, </font>');
          inc(x);
         end;
        //
        // 11
        if j=11
        then Str.Add('<b><a href="'+Edit2.Text+Format('_%0.6d', [i+x])+'.html">'+Format('_%0.6d', [i+x])+'</a><font color="#F7F7F7"></b> ... ></font><br>');
       end;
      k:=k+2;
      p:=p-1;
     end;
   end;
end;

////////////////// время генерации страниц
procedure TForm1.Time_generation(ms: real);
var
 ndays: double;
begin
 if ms<1000 // миллисекунды
 then
  begin
   Label21.Caption:='Время генерации сайта: '+FloatTostr(ms)+' миллисекунд.';
   gen_time:=FloatTostr(ms)+' миллисекунд';
  end
 else
   if (ms>=1000) and (ms<60000) // секунды
   then
    begin
     ms:=ms/1000;
     Label21.Caption:='Время генерации сайта: '+Format('%0.2f',[ms])+' секунд.';
     gen_time:=Format('%0.2f',[ms])+' секунд';
    end
   else
    begin
     if (ms>=60000) and (ms<3600000)
     then
      begin // минуты
       // Чтобы получить дни, необходимо разделить на количество
       // миллисекунд в дне, 24*60*60*1000=86400000
       ndays:=ms/86400000;
       Label21.Caption:='Время генерации сайта: '+FormatDateTime(' n "минут," s "секунд"',ndays);
       gen_time:=FormatDateTime(' n "минут," s "секунд."',ndays);
      end
     else // часы
      begin
       ndays:=ms/86400000;
       Label21.Caption:='Время генерации сайта: '+FormatDateTime(' h "часов," n "минут," s "секунд."',ndays);
       gen_time:=FormatDateTime(' h "часов," n "минут," s "секунд"',ndays);
      end
    end;
end;

////////////////// генерация главной страницы
procedure TForm1.Index_page;
begin
 // Str.Add('Этот сайт полностью сгенерирован программой <b>"'+Form1.Caption+'</b>".');
 // Str.Add('<br>');
 // Str.Add('<br>');
 Str.Add('<b>Статистика сайта:</b><br><br>');
 Str.Add('- количество страниц сайта: '+IntToStr(SpinEdit1.Value)+';<br>');
 // Str.Add('- время генерации сайта: 45,11 секунд;<br>');
 Str.Add('- время генерации сайта: '+gen_time+';<br>');
 Str.Add('- количество слов в тексте на страницах, не менее: '+IntTostr(SpinEdit4.Value)+';<br>');
 Keyw_str.LoadFromFile(ExtractFilePath(Application.ExeName)+'\data\text_to_page\'+Edit3.Text);
 Str.Add('- слов и фраз для генерации заголовков страниц: '+IntToStr(Keyw_str.Count)+';<br>');
 Keyw_str.LoadFromFile(ExtractFilePath(Application.ExeName)+'\data\text_to_page\'+Edit4.Text);
 Str.Add('- слов и фраз в базе для генерации текста страниц: '+IntToStr(Keyw_str.Count)+'.<br>');
 Str.Add('<br>');
 Str.Add('<b>Цена программы:</b> Unassigned...</font></td></tr></table></div>');
end;

////////////////// генерация заголовков страниц
procedure TForm1.Zagolov_page;
begin
 if i=SpinEdit1.Value
 then
  begin
   Str.Add('<font color="#F7F7F7"><b>'+ComboBox5.Text+'</b></h1>');
   Str.Add('<p style="margin-top: 0; margin-bottom: 0" align="center">');
   Str.Add('<br><br><br><b><font size="2">Описание сайта:</b><br><br>&nbsp </p>');
  end
 else
  begin // остальные страницы
   Str.Add('<font color="#F7F7F7"><b>'+rand+'</b></h1>');
  end;
end;

////////////////// генерация текста на страницах
procedure TForm1.Text_on_page;
var
 j,k,z: integer;
 s,ss: string;
begin
 Keyw_str.BeginUpdate;
 Keyw_str.Clear;
 //
 k:=SpinEdit4.Value+Random(30);
 Buffer_Str.Clear;
 for j:=1 to k do
  begin
   s:=Str_GenText.Strings[Random(Str_GenText.Count)];
   Keyw_str.Add(s);
   ss:=s;
   if j=1 // заглавная буква первого слова начала всего текста
   then
    begin
     ss:=AnsiUpperCase(s[1]);
     Delete(s,1,1);                          // красная строка
     Buffer_Str.Add('&nbsp;&nbsp;&nbsp;&nbsp;'+ss+s+' ');
    end
   else // весь текст
    begin
     if j=k // если конец всего текста, то ставим '.'
     then Buffer_Str.Add(s+'.')
     else
      begin // генерация абзацев текста
       z:=Random(j);
       // проверка на вхождение в дипазон значений:
       // (z>=j-2) and (z<=j) - если z попадает в этот
       // диапазон, то конец абзаца
       // (z>10+Random(9) - разрешаем ставить конец абзаца
       // после первых 10+Random(9) слов всего текста
       //          or
       if (z>=j-2) and (z<=j) and (z>10+Random(9))
       then
        begin
         Buffer_Str.Add(s+'.<br>');
         // разбивка текста пустыми строками
         // чем больше число Random(3) тем реже разбивается текст
         if Random(3)=1
         then Buffer_Str.Add('<br>');
         //
         s:=Str_GenText.Strings[Random(Str_GenText.Count)];
         ss:=s;
         ss:=AnsiUpperCase(s[1]);
         Delete(s,1,1);
         Buffer_Str.Add('&nbsp;&nbsp;&nbsp;&nbsp;'+ss+s+' ');
        end
       else
        begin
         if (j>Random(4)+1) // после 4-го слова
          and (j<k-Random(k-4)) // перед послед. 4-мя словами
          and (Random(k)<=j)
          and (Random(k)>j-10)
         then Buffer_Str.Add(s+', ')
         else Buffer_Str.Add(s+' '); // просто добавляем слово
        end;
      end;
    end;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
 t1,t2: TDateTime;
 j,k,z,n,p,t,h: integer;
 s,ss,s1,s2,email: string;
begin
 t1:=now;
 // кнопка остановки генерирования страниц
 stop:=false;
 rand:='';
 Button5.Enabled:=true;
 //
 with ProgressBar1 do
  begin
   Max:=SpinEdit1.Value;
   Refresh;
   Show;
  end;
 //
 // стиль CSS
 Buffer_Str.LoadFromFile(ExtractFilePath(Application.ExeName)+'\data\style\pages_style.txt');
 // заголовки страниц
 Str_ZagPage.BeginUpdate;
 Str_ZagPage.LoadFromFile(ExtractFilePath(Application.ExeName)+'\data\text_to_page\'+Edit3.Text);
 Str_ZagPage.EndUpdate;
 // генерация страниц
 Str_GenText.BeginUpdate;
 Str_GenText.LoadFromFile(ExtractFilePath(Application.ExeName)+'\data\text_to_page\'+Edit4.Text);
 Str_GenText.EndUpdate;
 //
 // шифрование E-mail
 email:=Copy(ComboBox6.Text,1,pos('@',ComboBox6.Text));
 s:=Copy(ComboBox6.Text,pos('@',ComboBox6.Text)+1,50);
 email:=email+'bercut'+s;
 // Сохранение скрипта CSS
 Buffer_Str.SaveToFile(ExtractFilePath(Application.ExeName)+'/result_site/pages/scripts/mystyle.css');
 ///////////////////////////////////////////////////////////////
 //                     Генерация сайта                       //
 ///////////////////////////////////////////////////////////////
 for i:=1 to SpinEdit1.Value do
  begin
   Str.BeginUpdate;
   Str.Clear;
   //
   //
   Text_on_page; // Генерация текста (Random)
                              /////////////////////////////////
   ////////////////////////////            Title
                             //////////////////////////////////
   rand:=Str_ZagPage.Strings[Random(Str_ZagPage.Count)];
   if i=SpinEdit1.Value
   then Str.Add('<title>'+ComboBox1.Text+'</title>')
   else Str.Add('<title>'+rand+' - '+ComboBox12.Text+'</title>');
   //
   // Генерация ключевых слов
   k:=SpinEdit5.Value+Random(5);
   s:='';
   for j:=1 to k do
    begin
     s:=s+AnsiLowerCase(Keyw_str.Strings[Random(Keyw_str.Count)])+', ';
    end;
   Delete(s,Length(s)-1,10); // удаление последней ', '
   Str.Add('<meta name="keywords" content="'+Edit1.Text+', '+s+'">');
   //
   Str.Add('<meta name="description" content="'+ComboBox2.Text+'">');
   Str.Add('<meta http-equiv="Content-Language" content="ru">');
   Str.Add('<meta name="author" content="'+ComboBox3.Text+'">');
   Str.Add('<meta name="copyright" content="'+ComboBox4.Text+'">');
   Str.Add('<meta name="generator" content="'+Form1.Caption+'">'); // информация, какой программой сгенерирована страница
   Str.Add('<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">');
   // Путь к CSS
   if i=SpinEdit1.Value
   then Str.Add('<link href="pages/scripts/mystyle.css" type=text/css rel=stylesheet>')
   else Str.Add('<link href="scripts/mystyle.css" type=text/css rel=stylesheet>');
   Str.Add('</head>');
                               /////////////////////////////////
   //////////////////////////////             Body
                               /////////////////////////////////
   Str.Add('<body marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" link=#000000 vlink=#000000 alink=#F0000F bgcolor="#'+IntToHex(GetRValue(Panel1.Color),2)+IntToHex(GetGValue(Panel1.Color),2)+IntToHex(GetBValue(Panel1.Color),2)+'">');
   // Верх
   // Начало таблицы обрамляющей содержание сайта
   Str.Add('<p align="center" style="margin-top: 0; margin-bottom: 0"><span lang="en-us">');
   Str.Add('&nbsp; </p>');
   Str.Add('<div align="center">');
   Str.Add('<table border="0" width="700" cellspacing="0" cellpadding="0" bgcolor="#'+IntToHex(GetRValue(Panel5.Color),2)+IntToHex(GetGValue(Panel5.Color),2)+IntToHex(GetBValue(Panel5.Color),2)+'">');
   Str.Add('<tr><td>');
   //
   // Верхние углы таблицы
   if i=SpinEdit1.Value
   then Str.Add('<img border="0" src="images/fon/ugol_vl.gif" width="27" height="27"></td>')
   else Str.Add('<img border="0" src="../images/fon/ugol_vl.gif" width="27" height="27"></td>');
   Str.Add('<td>');
   if i=SpinEdit1.Value
   then Str.Add('<p align="right"><img border="0" src="images/fon/ugol_vr.gif" width="27" height="27"></td>')
   else Str.Add('<p align="right"><img border="0" src="../images/fon/ugol_vr.gif" width="27" height="27"></td>');
   Str.Add('</tr>');
   Str.Add('<tr><td colspan="2">');
   Str.Add('<h1 align="center" style="margin-top: 0; margin-bottom: 0">');
   //
   //
   Zagolov_page; // Заголовки страниц
   //
   // Начальная страница (скриншот программы (пустое место))
   if i=SpinEdit1.Value
   then
    begin
     //
     Str.Add('<div align="center">');
     Str.Add('<table border="0" width="650" cellspacing="0" cellpadding="0">');
     Str.Add('<tr>');
     Str.Add('<td><b>Данный сайт на 98% сгенерирован программой "'+Form1.Caption+'".</b><br>');
     Str.Add('<br>');
     Str.Add('&nbsp  Сайт содержит большое количество полезной и бесполезной (на 99%) информации, а также ссылки на различные сайты. Конечно пока программа не может полноценно заменить человека и составлять более-менее осмысленные предложения и тесты,');
     Str.Add(' но в будущих версиях программы надеюсь будет что-либо подобное, а также, что неизбежно, появится более привлекательный и гибкий дизайн с использованием всех передовых технологий создания Web-сайтов.<br>');
     Str.Add('<br>');
     Str.Add('&nbsp  Приношу свои извинения, если Вы зря потратили свое время на просмотр этого, без сомнения, <b>бесполезного</b> сайта.</td>');
     Str.Add('</tr>');
     Str.Add('</table>');
     Str.Add('</div>');
     //
     // Str.Add('<p align="center" style="margin-top: 0"><a target="_blank" href="http://www.delphisources.ru">');
     // Str.Add('<img border="0" src="images/fon/prog_screen.jpg" width="'+IntToStr(320)+'" height="'+IntToStr(200)+'" alt="Скриншот программы '+Form1.Caption+'"></a>');
    end;
   //
   Str.Add('<p align="center" style="margin-top: 0; margin-bottom: 0"><br>');
   Str.Add('<span lang="en-us">&nbsp; </span></p><div align="center">');
                                  //////////////////////////////
   /////////////////////////////////      Таблица c текстом
                                  //////////////////////////////
   Str.Add('<table border="0" width="650" cellspacing="0" cellpadding="0">');
   Str.Add('<tr>');
   Str.Add('<td>');
   Str.Add('<font color="#'+IntToHex(GetRValue(Panel2.Color),2)+IntToHex(GetGValue(Panel2.Color),2)+IntToHex(GetBValue(Panel2.Color),2)+'">');
   Str.Add('<p align="left" style="margin-top: 0; margin-bottom: 0">');
   //
   // Текст в таблицах
   if i=SpinEdit1.Value // текст для главной страницы
   then
    begin
     t2:=now;
     Time_generation(MilliSecondsBetween(t1, t2)+30);    
     Index_page;
    end
   else // Random текст + ссылки на сайты
    begin
     Keyw_str.LoadFromFile(ExtractFilePath(Application.ExeName)+'\data\banners\all_sites.txt');
     n:=SpinEdit6.Value+Random(3);
     for j:=1 to n do
      begin
       k:=Random(Buffer_Str.Count); // ссылки на сайты
       z:=Random(SpinEdit1.Value)+1; // ссылки на свой сайт
       s:=Trim(Buffer_Str.Strings[k]);
       if CheckBox2.Checked=false
       then
        begin // ссылки на свой сайт и ссылки на другие сайты
         if j>Random(n-1)+1
         then Buffer_Str.Strings[k]:='<a href="'+Edit2.Text+Format('_%0.6d', [z])+'.html"><b><font color="#'+IntToHex(GetRValue(Panel4.Color),2)+IntToHex(GetGValue(Panel4.Color),2)+IntToHex(GetBValue(Panel4.Color),2)+'">'+s+'</font></b></a> ' // ссылки на свой сайт
         else // ссылки на сайты в Internet
          begin
           p:=Random(Keyw_str.Count);
           for h:=0 to Keyw_str.Count-1 do
            begin
             if Combobox11.Text=Keyw_str.Strings[h]
             then Break;
            end;
           if (p<>h) and (p<>h-1) and (p<>h+1)
           then Buffer_Str.Strings[k]:='<a target="_blank" href="http://www.'+Keyw_str.Strings[p]+'"><b><font color="#'+IntToHex(GetRValue(Panel4.Color),2)+IntToHex(GetGValue(Panel4.Color),2)+IntToHex(GetBValue(Panel4.Color),2)+'">'+s+'</font></b></a> ';
          end;
        end // ссылки на свой сайт
       else Buffer_Str.Strings[k]:='<a href="'+Edit2.Text+Format('_%0.6d', [z])+'.html"><b><font color="#'+IntToHex(GetRValue(Panel4.Color),2)+IntToHex(GetGValue(Panel4.Color),2)+IntToHex(GetBValue(Panel4.Color),2)+'">'+s+'</font></b></a> ';
      end;
     Str.Add(Buffer_Str.Text+'</font></td></tr></table></div>');
    end;
   // Конец таблицы
   Str.Add('<p align="center" style="margin-top: 0">');
   Str.Add('<br><br>');
   //
   // Низ
   // Ссылки: Вперед, Главная, Назад
   if i=SpinEdit1.Value // если это index.html
   then Str.Add('<b><a href="pages/'+Edit2.Text+Format('_%0.6d', [SpinEdit1.Value-1])+'.html">'+ComboBox9.Text+'</a><font color="#F7F7F7"> <span lang="en-us"> | </span> </font><a href="pages/'+Edit2.Text+Format('_%0.6d', [1])+'.html">'+ComboBox8.Text+'</a><br></b>')
   else
    if i=1 // страница после index.html
    then Str.Add('<b><a href="../index.html">'+ComboBox9.Text+'</a><font color="#F7F7F7"> <span lang="en-us"> | </span> <a href="../index.html">'+ComboBox7.Text+'</a><span lang="en-us"> | </span> </font><a href="'+Edit2.Text+Format('_%0.6d', [i+1])+'.html">'+ComboBox8.Text+'</a><br></b>')
    else
     if i=SpinEdit1.Value-1 // последняя страница
     then Str.Add('<b><a href="'+Edit2.Text+Format('_%0.6d', [i-1])+'.html">'+ComboBox9.Text+'</a><font color="#F7F7F7"> <span lang="en-us"> | </span> <a href="../index.html">'+ComboBox7.Text+'</a><span lang="en-us"> | </span> </font><a href="../index.html">'+ComboBox8.Text+'</a><br></b>')
     else Str.Add('<b><a href="'+Edit2.Text+Format('_%0.6d', [i-1])+'.html">'+ComboBox9.Text+'</a><font color="#F7F7F7"> <span lang="en-us"> | </span> <a href="../index.html">'+ComboBox7.Text+'</a><span lang="en-us"> | </span> </font><a href="'+Edit2.Text+Format('_%0.6d', [i+1])+'.html">'+ComboBox8.Text+'</a><br></b>');
   //
   // ссылки на предыдущие и следующие 5 страниц
   // ... 1, 2, 3, 4 [ 5 ] 6, 7, 8, 9 ...
   if CheckBox3.Checked=true
   then Ssilki_niz;
   //
   Str.Add('<span lang="en-us">&nbsp; </span>');
   // Разделительная линия с E-mail
   Str.Add('<div align="center">');
   Str.Add('<table border="0" width="650" cellspacing="0" cellpadding="0">');
   Str.Add('<tr><td><p align="center">');
   // верхняя разделительная линия
   if i=SpinEdit1.Value
   then Str.Add('<img border="0" src="images/fon/goriz_line.jpg" width="'+IntToStr(SpinEdit3.Value)+'" height="'+IntToStr(SpinEdit2.Value)+'"></td>')
   else Str.Add('<img border="0" src="../images/fon/goriz_line.jpg" width="'+IntToStr(SpinEdit3.Value)+'" height="'+IntToStr(SpinEdit2.Value)+'"></td>');
   Str.Add('</tr><tr><td height="28"><p align="center">');
   Str.Add('<font color="#F7F7F7">');
   // разшифрование E-mail
   Buffer_Str.LoadFromFile(ExtractFilePath(Application.ExeName)+'\data\e_mail\decode_email.txt');
   Buffer_Str.SaveToFile(ExtractFilePath(Application.ExeName)+'/result_site/pages/scripts/decode_email.js');
   Str.Add('E-mail: <a href="mailto:'+email+'">'+ComboBox6.Text+'</td></tr><tr><td><p align="center">');
   if i=SpinEdit1.Value
   then Str.Add('<script language="JavaScript" type="text/JavaScript" src="pages/scripts/decode_email.js"></script>')
   else Str.Add('<script language="JavaScript" type="text/JavaScript" src="scripts/decode_email.js"></script>');
   // нижняя разделительная линия
   if i=SpinEdit1.Value
   then Str.Add('<img border="0" src="images/fon/goriz_line.jpg" width="'+IntToStr(SpinEdit3.Value)+'" height="'+IntToStr(SpinEdit2.Value)+'"></td>')
   else Str.Add('<img border="0" src="../images/fon/goriz_line.jpg" width="'+IntToStr(SpinEdit3.Value)+'" height="'+IntToStr(SpinEdit2.Value)+'"></td>');
   Str.Add('</tr></table></div><p align="center" style="margin-top: 0">');
   //
   // Версия сайта и ссылка на Delphi sources
   Str.Add('<span lang="en-us">&nbsp; </span><div align="center"><table border="0" width="650" cellspacing="0" cellpadding="0">');
   Str.Add('<tr><td><p align="right" style="margin-top: 0"><font color="#F7F7F7" style="font-size: 7pt">');
   // Str.Add('<a target="_blank" href="http://www.'+ComboBox10.Text+'">'+Edit11.Text+'</a></font></td>');
   Str.Add('Site Version '+site_ver+', Powered by <b>"<a target="_blank" href="http://www.'+ComboBox10.Text+'">'+Form1.Caption+'</a>"</b>, '+date_now+'</font></td>');
   Str.Add('</tr></table></div><p align="center" style="margin-top: 0; margin-bottom: 0"><br>');
                                  //////////////////////////////
   /////////////////////////////////           Баннеры
                                  //////////////////////////////
   if i<>SpinEdit1.Value
   then
    begin
     if RadioButton1.Checked=true // нет баннеров
     then ; // ничего не ставим
     if RadioButton2.Checked=true // прямые ссылки
     then
      begin
       Buffer_Str.LoadFromFile(ExtractFilePath(Application.ExeName)+'\data\banners\banners.txt');
       s:=Buffer_Str.Strings[Random(Buffer_Str.Count)];
       ss:=s;
       s:=Copy(ss,pos(('|'),s)+2,900);
       // имя файла
       Delete(ss,pos(('|'),ss)-1,900);
       s2:='<img border="0" src="../images/baners/'+ss+'" width="468" height="60" alt="';
       ss:=s;
       // ссылка на сайт
       Delete(ss,pos(('|'),ss)-1,900);
       s1:='" href="'+ss+'">';
       ss:=Copy(s,pos(('|'),s)+2,900);
       s:=ss;
       // описание ссылки
       Delete(ss,pos(('|'),ss)-1,900);
       s2:=s2+ss+'"></a>';
       s:=Copy(s,pos(('|'),s)+2,900);
       // открыть ссылку в новом окне или на той же странице
       s1:='<a target="'+s+s1;
       // в html
       Str.Add(s1);
       Str.Add(s2);
       Str.Add('<br><br>');
      end;
     if RadioButton3.Checked=true // с помощью JavaScript
     then
      begin
       Buffer_Str.LoadFromFile(ExtractFilePath(Application.ExeName)+'\data\banners\banners_refresh.txt');
       Buffer_Str.SaveToFile(ExtractFilePath(Application.ExeName)+'/result_site/pages/scripts/banners_refresh.js');
       Str.Add('<script language="JavaScript" type="text/JavaScript" src="scripts/banners_refresh.js"></script>');
       Str.Add('<p align="center" style="margin-top: 0; margin-bottom:0">&nbsp; ');
       Str.Add('<p align="center" style="margin-top: 0">');
      end;
    end;
   ///////////////////////////////// Счетчики
   if i=SpinEdit1.Value
   then
    begin
     // SpyLog (для главной страницы)
     Buffer_Str.LoadFromFile(ExtractFilePath(Application.ExeName)+'\data\counters\spylog_index.txt');
     for j:=0 to Buffer_Str.Count-1 do
      Str.Add(Buffer_Str.Strings[j]);
     // Яндекс цитирования
     Str.Add('&nbsp;&nbsp;&nbsp');
     Str.Add('<a href="http://www.yandex.ru/cy?base=0&host=http://www.'+ComboBox11.Text+'">');
     Str.Add('<img src="http://www.yandex.ru/cycounter?http://www.'+ComboBox11.Text+'" width=88 height=31 alt="Яндекс цитирования" border=0></a>');
     (*
     // Google PageRank
     Str.Add('&nbsp;&nbsp;&nbsp');
     Str.Add('<a href=http://www.getrank.net/ target=_blank><img src=http://www.getrank.net/pr2.php alt=PageRank border=0></a></td>');
     *)
    end
   else // SpyLog (для остальных страниц)
    begin
     Buffer_Str.LoadFromFile(ExtractFilePath(Application.ExeName)+'\data\counters\spylog_pages.txt');
     for j:=0 to Buffer_Str.Count-1 do
      Str.Add(Buffer_Str.Strings[j]);
    end;
   //
   // Конец таблицы обрамляющей содержание сайта
   // Нижние углы таблицы
   Str.Add('</tr>');
   Str.Add('<tr><td>');
   if i=SpinEdit1.Value
   then Str.Add('<img border="0" src="images/fon/ugol_nl.gif" width="27" height="27"></td>')
   else Str.Add('<img border="0" src="../images/fon/ugol_nl.gif" width="27" height="27"></td>');
   Str.Add('<td>');
   if i=SpinEdit1.Value
   then Str.Add('<p align="right"><img border="0" src="images/fon/ugol_nr.gif" width="27" height="27"></td>')
   else Str.Add('<p align="right"><img border="0" src="../images/fon/ugol_nr.gif" width="27" height="27"></td>');
   //
   Str.Add('</tr></table></div></span>');
   Str.Add('<p align="center" style="margin-top: 0"><span lang="en-us">&nbsp; </span></p>');
                                /////////////////////////////////
   ///////////////////////////////      Конец html страницы
                                /////////////////////////////////
   Str.Add('</body>');
   Str.Add('</html>');
   //
   RichEdit1.Lines.Clear;
   RichEdit1.Lines.Assign(Str);
   ////////////////////////////
   if i=SpinEdit1.Value // index.html
   then Str.SaveToFile(ExtractFilePath(Application.ExeName)+'/result_site/index.html')
   else
    begin // остальные страницы
     Str.SaveToFile(ExtractFilePath(Application.ExeName)+'/result_site/pages/'+Edit2.Text+Format('_%0.6d', [i])+'.html');
     {
     if (1000<=i) and (i<10000)
     then Str.SaveToFile(ExtractFilePath(Application.ExeName)+'/result_site/pages/page_0'+IntToStr(i)+'.html');
     if (100<=i) and (i<1000)
     then Str.SaveToFile(ExtractFilePath(Application.ExeName)+'/result_site/pages/page_00'+IntToStr(i)+'.html');
     if (10<=i) and (i<100)
     then Str.SaveToFile(ExtractFilePath(Application.ExeName)+'/result_site/pages/page_000'+IntToStr(i)+'.html');
     if i<10
     then Str.SaveToFile(ExtractFilePath(Application.ExeName)+'/result_site/pages/page_0000'+IntToStr(i)+'.html');
     }
    end;
   Str.EndUpdate;
   Keyw_str.EndUpdate;
   Application.ProcessMessages;
   if stop=true then Break; // остановка генерирования страниц
   if i<>0
   then
    begin
     ProgressBar1.StepIt;
     Label11.Caption:='Прогресс генерации: сделано страниц - '+IntTostr(i);
    end;
   // Sleep(800);
  end;
 //////////////////////////////////////////////////////////////
 //                  Конец генерации сайта                   //
 //////////////////////////////////////////////////////////////
 t2:=now;
 Label11.Caption:='Прогресс генерации: сделано страниц - '+IntTostr(ProgressBar1.Position);
 //
 Sleep(250);
 ProgressBar1.Position:=0;
 // просмотр сайта в браузуре
 if CheckBox1.Checked=true
 then ShellExecute(0,'open',PChar(ExtractFilePath(Application.ExeName)+'\result_site\index.html'),'','',SW_SHOW);
 //
 Button5.Enabled:=false; // кнопка остановки генерирования страниц
 //
 // полное время генерации сайта
 Time_generation(MilliSecondsBetween(t1, t2));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 Form2.ShowModal;
end;

procedure TForm1.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 ColorDialog1.Color:=Panel1.Color;
 if ColorDialog1.Execute
 then Panel1.Color:=ColorDialog1.Color;
end;

procedure TForm1.Panel2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 ColorDialog1.Color:=Panel2.Color;
 if ColorDialog1.Execute
 then Panel2.Color:=ColorDialog1.Color;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 IniFile.Free;
 Buffer_Str.Free;
 Str.Free;
 Str_ZagPage.Free;
 Str_GenText.Free;
 Keyw_str.Free;
 Action:=caFree;
end;

procedure TForm1.Panel3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 ColorDialog1.Color:=Panel3.Color;
 if ColorDialog1.Execute
 then Panel3.Color:=ColorDialog1.Color;
end;

// Для создания разделительных линий
function GetColor(Color: integer): integer; register;
asm
  cmp eax, 0
  jge @@10
  and eax, 000000FFH
  push eax
  call GetSysColor
 @@10:
end;

procedure HDrawGradientRect(Canvas: TCanvas; Left, Top, Width, Height: Integer;
  NonGradientArea: Integer; FrameColor, Color1, Color2: TColor);
var
 Color: TColor;
 C1: array[0..3] of byte absolute Color1;
 C2: array[0..3] of byte absolute Color2;
 C: array[0..3] of byte absolute Color;
 Mid, i, j, X1, Y1, X2, Y2, X0, L, Y11, Y21: integer;
begin
 X1:=Left;
 Y1:=Top;
 X2:=Left+Width;
 Y2:=Top+Height;
 Color1:=GetColor(Color1);
 Color2:=GetColor(Color2);
 with Canvas do
  begin
   if NonGradientArea<0
   then
    begin
      Mid:=X2+NonGradientArea;
      X0:=X1+1;
      L:=Mid-X0;
      Y11:=Y1+1;
      Y21:=Y2-1;
      Pen.Style:=psSolid;
      for i:=X0 to Mid do
       begin
        for j:=0 to 3 do
         C[j]:=MulDiv(1, C2[j]*(Mid-i)+C1[j]*(i-X0), L);
        Pen.Color:=Color;
        MoveTo(i, Y11);
        LineTo(i, Y21);
       end;
      Pen.Style:=psClear;
      Brush.Color:=Canvas.Pen.Color;
      Rectangle(Mid, Y11, X2, Y2);
     end
    else
     begin
      Mid:=NonGradientArea;
      X0:=X2-2;
      L:=Mid-X0;
      Y11:=Y1+1;
      Y21:=Y2-1;
      Pen.Style:=psSolid;
      for i:=X0 downto Mid do
       begin
        for j:=0 to 3 do
         C[j]:=MulDiv(1, C2[j]*(Mid-i)+C1[j]*(i-X0), L);
        Pen.Color:=Color;
        MoveTo(i, Y11);
        LineTo(i, Y21);
       end;
      Pen.Style:=psClear;
      Brush.Color:=Canvas.Pen.Color;
      Rectangle(X1+1, Y1+1, Mid+1, Y2);
     end;
    Pen.Color:=FrameColor;
    Pen.Style:=psSolid;
    MoveTo(X1, Y1);
    LineTo(X2-1, Y1);
    LineTo(X2-1, Y2-1);
    LineTo(X1, Y2-1);
    LineTo(X1, Y1);
   end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
 i: integer;
 Bmp: TBitmap;
 jpg: TJpegImage;
begin
 // принудительно ставим размеры Image, иначе размер
 // как при разработке
 Image1.Width:=SpinEdit3.Value;
 Image1.Height:=SpinEdit2.Value+2; // на 1 пиксель > чем надо
 //
 Image1.Top:=Form1.Height div 2;
 Image1.Left:=10;
 //
 HDrawGradientRect(Image1.Canvas, 0, 0, Image1.Width div 2, Image1.Height, 0, Panel6.Color, Panel6.Color, Panel3.Color);
 HDrawGradientRect(Image1.Canvas, Image1.Width div 2 + 1, 0, Image1.Width div 2, Image1.Height, -1, Panel6.Color, Panel6.Color, Panel3.Color);
 // Закраска соединения линий
 Image1.Canvas.Pen.Color:=Panel3.Color;
 for i:=1 to Image1.Height-2 do
  begin
   Image1.Canvas.MoveTo(Image1.Width div 2 - 5, i);
   Image1.Canvas.LineTo(Image1.Width div 2 + 5, i);
  end;
 //
 Bmp:=TBitmap.Create;
 jpg:=TJpegImage.Create;
 Bmp.Width:=Image1.Width;
 Bmp.Height:=Image1.Height-2;
 BitBlt(Bmp.Canvas.Handle,0,-1,Image1.Width,Image1.Height,Image1.Canvas.Handle,0,0,SRCCOPY);
 //
 jpg.Assign(Bmp);
 jpg.CompressionQuality:=70;
 // "Оттенки серого" false
 jpg.Grayscale:=false;
 // упаковываем графику
 jpg.Compress;
 //
 jpg.SaveToFile(ExtractFilePath(Application.ExeName)+'\result_site\images\fon\goriz_line.jpg');
 //
 Bmp.FreeImage;
 FreeAndNil(Bmp);
 jpg.Free;
 //
 MessageDlg('Линия сгенерирована!',mtInformation,[mbOK],0);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 if FileExists(ExtractFilePath(Application.ExeName)+'\result_site\index.html')=true
 then ShellExecute(0,'open',PChar(ExtractFilePath(Application.ExeName)+'\result_site\index.html'),'','',SW_SHOW)
 else
  if MessageDlg('Сайт не сгенерирован!'+#10#13+
                 'Сгенерировать сайт?',mtInformation, [mbOK, mbNO], 0)=mrOK
  then Button1.Click; // сгенерировать сайт
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
 stop:=true;
end;

procedure TForm1.Panel4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 ColorDialog1.Color:=Panel4.Color;
 if ColorDialog1.Execute
 then Panel4.Color:=ColorDialog1.Color;
end;

procedure TForm1.Panel1Click(Sender: TObject);
begin
 // Panel1.Color:=RGB(209,219,196);
 // Panel1.Color:=$00C4DBD1;
end;

procedure TForm1.Panel5MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 ColorDialog1.Color:=Panel5.Color;
 if ColorDialog1.Execute
 then Panel5.Color:=ColorDialog1.Color;
end;

procedure TForm1.Panel5Click(Sender: TObject);
begin
 // Panel5.Color:=RGB(184,199,163);
 // Panel5.Color:=$00A3C7B8;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
 Form4.Caption:='Просмотр/редактирование CSS стилей страниц';
 Form4.RichEdit1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+'\data\style\pages_style.txt');
 Form4.ShowModal;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
 Form4.Caption:='Просмотр/редактирование cписка ссылок на сайты';
 Form4.RichEdit1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+'\data\banners\all_sites.txt');
 Form4.ShowModal;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
 Form4.Caption:='Просмотр/редактирование cписка банеров с описанием и ссылками';
 Form4.RichEdit1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+'\data\banners\banners.txt');
 Form4.ShowModal;
end;

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
 SC_DragMove=$F012;
begin
 //Перетаскивание формы за ее поле
 ReleaseCapture;
 Perform(WM_SysCommand, SC_DragMove, 0);
 //или SendMessage(Handle,WM_NCLBUTTONDOWN,HTCAPTION,0);
end;

(*
////////////////// INI - Работа с данными форм
// Для версий, когда программа будет известна, и будет
// размещаться в каталогах
procedure TForm1.ComponentChange;
var
 i: integer;
 name,pref: string;
 Keys: TStringList;
begin
 temp:=FindComponent('ComboBox'+IntToStr(comp_ind));
 if (temp as TComboBox).ItemIndex=-1
 then Exit;
 //
 Keys:=TStringList.Create;
 Keys.Clear;
 if comp_ind=1
 then
  begin
   name:='title';
   pref:='t';
  end
 else if comp_ind=2 then
  begin
   name:='description';
   pref:='d';
  end
 else if comp_ind=3 then
  begin
   name:='author';
   pref:='a';
  end
 else if comp_ind=4 then
  begin
   name:='copyright';
   pref:='c';
  end;
 //
 IniFile.ReadSection(name,Keys);
 IniFile.WriteString(name,pref+'_default',IntToStr((temp as TComboBox).ItemIndex+1));
 for i:=1 to Keys.Count-1 do
  IniFile.WriteString(name,Keys.Strings[i],(temp as TComboBox).Items.Strings[i-1]);
 //
 Keys.Free;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
 comp_ind:=1;
 ComponentChange;
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
 comp_ind:=2;
 ComponentChange;
end;

procedure TForm1.ComboBox3Change(Sender: TObject);
begin
 comp_ind:=3;
 ComponentChange;
end;

procedure TForm1.ComboBox4Change(Sender: TObject);
begin
 comp_ind:=4;
 ComponentChange;
end;

// Добаление данных
procedure TForm1.N1Click(Sender: TObject);
var
 s: string;
 Keys: TStringList;
begin
 s:=InputBox('Добаление данных','Введите данные:','');
 if s<>''
 then
  begin
   Keys:=TStringList.Create;
   Keys.Clear;
   IniFile.ReadSection('title',Keys);
   IniFile.WriteString('title','t_default',IntToStr(Keys.Count));
   IniFile.WriteString('title','t_'+IntToStr(Keys.Count),s);
   ComboBox1.Items.Add(s);
   ComboBox1.Text:=s;
   Keys.Free;
  end;
end;

// Удаление данных
procedure TForm1.N2Click(Sender: TObject);
var
 i: integer;
 s: string;
 Keys: TStringList;
begin
 Keys:=TStringList.Create;
 Keys.Clear;
 IniFile.ReadSection('title',Keys);
 //
 for i:=1 to Keys.Count-1 do
  begin
   s:=IniFile.ReadString('title',Keys.Strings[i],'');
   if s=ComboBox1.Text
   then
    begin
     IniFile.WriteString('title','t_default','1');
     IniFile.DeleteKey('title','t_'+IntToStr(i));
     ComboBox1.Items.Delete(i-1);
     ComboBox1.Text:=ComboBox1.Items.Strings[0];
     Break;
    end;
  end;
 Keys.Free;
end;

// Редактирование данных
procedure TForm1.N3Click(Sender: TObject);
var
 s,x: string;
 Keys: TStringList;
begin
 x:=InputBox('Редактирование данных','Данные:',ComboBox1.Text);
 if x<>''
 then
  begin
   Keys:=TStringList.Create;
   Keys.Clear;
   IniFile.ReadSection('title',Keys);
   s:=IniFile.ReadString('title','t_default','');
   IniFile.WriteString('title',Keys.Strings[StrToInt(s)],x);
   ComboBox1.Items.Strings[StrToInt(s)-1]:=x;
   ComboBox1.Text:=x;
   Keys.Free;
  end;
end;

//// END INI - Работа с данными форм
///////////////////////////////////////////////////////////////
*)

procedure TForm1.Panel6MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 ColorDialog1.Color:=Panel6.Color;
 if ColorDialog1.Execute
 then Panel6.Color:=ColorDialog1.Color;
end;

procedure TForm1.Panel6Click(Sender: TObject);
begin
 // Panel6.Color:=RGB(184,199,163);
 // Panel6.Color:=$00A3C7B8;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
 Form4.Caption:='Скрипт генерации баннеров (баннер меняется случайным образом)';
 Form4.RichEdit1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+'\data\banners\banners_refresh.txt');
 Form4.ShowModal;
end;

procedure TForm1.Button10Click(Sender: TObject);
var
 s,path: string;
 Strp: TStringList;
begin
 path:=ExtractFilePath(Application.ExeName)+'data\text_to_page\';
 Edit3.Text:=path;
 //
 if OpenDialog1.Execute
 then s:=OpenDialog1.FileName;
 //
 if pos(path,s)<>0
 then
  begin
   Delete(s,1,pos(path,s)+Length(path)-1);
   Edit3.Text:=s;
  end;
 //
 Strp:=TStringList.Create;
 Strp.LoadFromFile(ExtractFilePath(Application.ExeName)+'path.prg');
 Strp.Strings[0]:=s;
 Strp.SaveToFile(ExtractFilePath(Application.ExeName)+'path.prg');
 Strp.Free;
end;

procedure TForm1.Button11Click(Sender: TObject);
var
 s,path: string;
 Strp: TStringList;
begin
 path:=ExtractFilePath(Application.ExeName)+'data\text_to_page\';
 Edit4.Text:=path;
 //
 if OpenDialog1.Execute
 then s:=OpenDialog1.FileName;
 //
 if pos(path,s)<>0
 then
  begin
   Delete(s,1,pos(path,s)+Length(path)-1);
   Edit4.Text:=s;
  end;
 //
 Strp:=TStringList.Create;
 Strp.LoadFromFile(ExtractFilePath(Application.ExeName)+'path.prg');
 Strp.Strings[1]:=s;
 Strp.SaveToFile(ExtractFilePath(Application.ExeName)+'path.prg');
 Strp.Free;
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
 ShellExecute(0,'open',PChar('http://www.'+ComboBox10.Text),'','',SW_SHOW);
end;

procedure TForm1.ComboBox12Change(Sender: TObject);
begin
 ComboBox5.Text:=ComboBox12.Text+' - Сайт содержит ...';
 ComboBox1.Text:=ComboBox12.Text+' - Сайт про ...';
 ComboBox2.Text:=ComboBox12.Text+' - Пример автоматического создания Интернет-сайта';
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
 ShellExecute(0,'open',PChar('http://www.'+ComboBox11.Text),'','',SW_SHOW);
end;

initialization
 randomize;

end.
