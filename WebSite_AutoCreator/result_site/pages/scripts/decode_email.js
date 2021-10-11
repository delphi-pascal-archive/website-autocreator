function decodeEmail()
{
 var del = "@bercut";
 var p = this.href.indexOf(del);
 if (p < 0) return;
 this.href = this.href.substr(0, p)+'@'+this.href.substr(p+del.length);
}
for (var i=0; i<document.links.length; i++)
{
 document.links[i].onmouseover = decodeEmail;
}
