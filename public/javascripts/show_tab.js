/* Got this script from  http://url3.tk/tab/ .
   And made some monkey-patching.
*/
function show_tab(tab_id, preview_id)
{
    var tx=document.getElementById(tab_id);    
    var s=tx.value.replace(/[\n\r]/g,"\n");
    s=s.split("\n");
    var i=0;
    var c="";
    var tabline=0;
    //var lines=(document.getElementById("bass").checked==true)?4:6;
    var lines = 6;
    var y=20;
    var x=8;
    document.getElementById(preview_id).innerHTML="";
    var currentriff=[];
    var out=document.createElement("div");
    var p={
	bg: document.createElement("div"),line: document.createElement("div"),bar: document.createElement("div"),note:document.createElement("span")};
    p.line.setAttribute("class","line");
    p.bar.setAttribute("class","bar");
    p.note.setAttribute("class","note");
    p.bg.setAttribute("class","bg");
    p.bg.style.height=((lines-1)*9)+"px";
    
    var center=document.createElement("div");
    center.style.textAlign="center";
    if (document.getElementById("tab_title"))
	{
	    var titletxt=document.getElementById("tab_title").value;
	    var stitletxt="Tabbed by " + document.getElementById("current_user").innerHTML;
	    var author=document.getElementById("tab_artist").value;
	    var title=document.createElement("h1");
	    
	    var stitle=document.createElement("h3");
	    title.appendChild(document.createTextNode(titletxt));
	    title.style.fontFamily="serif";
	    title.style.marginBottom="3pt";
	    title.style.marginTop="3pt";
	    stitle.appendChild(document.createTextNode(stitletxt));
	    stitle.style.fontFamily="serif";
	    stitle.style.marginTop="3pt";
	    
	    center.appendChild(title);
	    center.appendChild(stitle);
	}
    var right=document.createElement("div");
    right.style.textAlign="right";
    
    out.appendChild(center);
    
    out.appendChild(right);
    for(i=0;i<s.length;i++)
    {
	c=s[i];
	var currentline=[];
	c=c.replace(/(^ +| +$)/g,"");
	if(c!="")
	{
	    if(/(\||)([EADGBEeadgbe ]|)--+(\||)/.test(c))
	    {
		tabline++;
		if(/^\|/.test(c))
		{
		    c=c.substring(1);
		}
		if(/^[EADGBEeadgbe]/.test(c))
		{
		    c=c.substring(1);
		}
		c=c.replace(/(^\||\|$)/g,"");
		c=c.toLowerCase();
		c=c.replace(/x/g,"X");
		var b;
		for(b=0;b<c.length;b++)
		{
		    currentline.push(c.charAt(b));
		}
		currentriff.push(currentline);
		if(tabline==lines)
		{
		    var lin;
		    var bar=p.bar.cloneNode(true);
		    for(lin=0;lin<currentriff.length;lin++)
		    {
			bar.appendChild(p.line.cloneNode(true));
			var len=currentriff[lin].length;
			var xi;
			for(xi=0;xi<len;xi++)
			{
			    if(currentriff[lin][xi]=="|")
			    {
				var barline=p.bg.cloneNode(true);
				barline.style.left=xi*8+"px";
				bar.appendChild(barline);
				
			    }
			    else if(currentriff[lin][xi]!="-")
			    {
				var note=p.note.cloneNode(true);
				note.appendChild(document.createTextNode(currentriff[lin][xi]));
				note.style.left=(xi*8)+"px";
				note.style.top=lin*9.3-6+"px";
				bar.appendChild(note);
			    }
			}
		    }
		    var fbarline=p.bg.cloneNode(true);
		    fbarline.style.left=0;
		    bar.appendChild(fbarline);
		    var frbarline=p.bg.cloneNode(true);
		    frbarline.style.right=0;
		    bar.appendChild(frbarline);
		    out.appendChild(bar);
		    out.appendChild(document.createElement("br"));
		    
		    currentriff=[];
		    y+=tabline*10+30;
		    tabline=0;
		}
	    }
	    else
	    {
		out.appendChild(document.createTextNode(c));
		out.appendChild(document.createElement("br"));
	    }
	}
	else
	{
	    out.appendChild(document.createElement("br"));
	}
    }
    document.getElementById(preview_id).appendChild(out);   
}