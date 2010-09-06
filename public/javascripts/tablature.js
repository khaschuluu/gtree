var str = new Array("", "", "", "", "", "");
var ddd  = "-";
var dddd  = "--";
var i=0;
function write_tab(s, f)
{
	if(f>9){if(dddd=="--"){dddd="---"};}
	else{if(dddd=="---"){dddd="--"};}
    for(i = 0; i < 6; i++){if(s==i+1){str[i] += f + ddd;} else {str[i] += dddd;}}
	display();
	
}
function display()
{
    document.getElementById('tab_tab').value = "";
    for(i=0; i<6; i++){document.getElementById('tab_tab').value += str[i] + "\n";}
}
function clear_all()
{
    for(i=0; i<6; i++){str[i] = "";}
    display();
}
function back_clear()
{
    var bool=0;
    for(i=0; i<6; i++) {str[i] = str[i].slice(0,-1);}
    while(bool==0)
    {
        bool=1;
        for(i=0; i<6; i++){if(str[i].charAt(str[i].length-1)!='-') {bool=0; break;}}
        if(bool==0){for(i=0; i<6; i++){str[i] = str[i].slice(0,-1);}}
    }
    display();
}
