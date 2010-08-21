var str6 = str5 = str4 = str3 = str2 = str1 = "";
var ddd  = "-";
var dddd  = "--";
function write_tab(s, f)
{
	
	FR = f; strng = s;

	if (FR>9) 
	{
		if(dddd=="--"){dddd="---"};
	}
	else
	{
		if(dddd=="---"){dddd="--"};
	}
	if(strng==6){str6 += FR + ddd;} else {str6 += dddd;}
	if(strng==5){str5 += FR + ddd;} else {str5 += dddd;}
	if(strng==4){str4 += FR + ddd;} else {str4 += dddd;}
	if(strng==3){str3 += FR + ddd;} else {str3 += dddd;}
	if(strng==2){str2 += FR + ddd;} else {str2 += dddd;}
	if(strng==1){str1 += FR + ddd;} else {str1 += dddd;}
	display();
	
}
function display()
{
	document.getElementById('tab_tab').value = (str6 + "\n" + str5 + "\n" + str4 + "\n" + str3 + "\n" + str2 + "\n" + str1 + "\n");
}
