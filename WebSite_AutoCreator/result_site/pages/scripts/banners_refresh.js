var k;
imgprint=1; // ���������� �������� �� ��������
imgall=3; // ����� ���������� �������
var ran=new Array(imgprint-1);
function random_number()
{
 return Math.round(Math.random() * imgall);
}
function check(num)
{
 while(k!=num)
 {
  ran[num]=random_number();
  k=0;
  for(a=0;a<num;a++)
  {
   if(ran[a]!=ran[num])
   {
    k++
   }
  }
 }
}
ran[0]=random_number();
for(a=1;a<imgprint;a++)
{
 check(a);
}
img=new Array(imgall);
link=new Array(imgall);
alt=new Array(imgall);
img[0]="../images/baners/banner_ds.gif"; link[0]="http://www.delphisources.ru"; alt[0]="���������������� �� Delphi, �������� ���������� ������ � ���������� ���������� �� Delphi, ���������, ������, ����� � ������ ������";
img[1]="../images/baners/ru_links.gif";  link[1]="http://www.delphisources.ru"; alt[1]="Ru Links - ����� ������� �������� ��������, ������ �� �����, �������� ��������, ���������� ������ � �������";
img[2]="../images/baners/more.jpg";      link[2]="http://www.hiddenadm.nm.ru";  alt[2]="����� �� ���� - ������� � ������������ ���������� ������� � ������, ��������, ������, ����, ������������ ���������, ����������";
img[3]="../images/baners/web_host.gif";  link[3]="http://www.hiddenadm.nm.ru";  alt[3]="WEB-HOSTING - ��� �������� + ���������� ����� ����� �� $49! �� ������, ������� � ������!";
for(i=0;i<imgprint;i++)
{
 document.write('<a href="'+link[ran[i]]+'" target="_blank">');
 document.write('<img border=0 src="'+img[ran[i]]+'"'); document.write('alt="'+alt[ran[i]]+'"></a>');
}
document.write('</center>');