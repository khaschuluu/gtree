var str6 = str5 = str4 = str3 = str2 = str1 = "";
var ddd  = "-";
var dddd  = "--";
function write_tab(s, f)
{
	if (f>9) 
	{
		if(dddd=="--"){dddd="---"};
	}
	else
	{
		if(dddd=="---"){dddd="--"};
	}
	if(s==6){str6 += f + ddd;} else {str6 += dddd;}
	if(s==5){str5 += f + ddd;} else {str5 += dddd;}
	if(s==4){str4 += f + ddd;} else {str4 += dddd;}
	if(s==3){str3 += f + ddd;} else {str3 += dddd;}
	if(s==2){str2 += f + ddd;} else {str2 += dddd;}
	if(s==1){str1 += f + ddd;} else {str1 += dddd;}
	display();
	
}
function display()
{
	document.getElementById('tab_tab').value = (str1 + "\n" + str2 + "\n" + str3 + "\n" + str4 + "\n" + str5 + "\n" + str6 + "\n");
}
function clear_all()
{
    str6 = "";
    str5 = "";
    str4 = "";
    str3 = "";
    str2 = "";
    str1 = "";
    display();
}
function back_clear()
{
    str6 = str6.slice(0,-1);
    str5 = str5.slice(0,-1);
    str4 = str4.slice(0,-1);
    str3 = str3.slice(0,-1);
    str2 = str2.slice(0,-1);
    str1 = str1.slice(0,-1);
    display();
}
