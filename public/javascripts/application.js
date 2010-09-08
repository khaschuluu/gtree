// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function toggle_visibility(id) {
    var e = document.getElementById(id);
    if(e.style.display == 'block')
        e.style.display = 'none';
    else
        e.style.display = 'block';
}

$(function () {
	var $alert = $('#alert');
	if($alert.length)
	{
		var alerttimer = window.setTimeout(function () {
			$alert.trigger('click');
		}, 3000);
		$alert.animate({height: $alert.css('line-height') || '50px'}, 200)
		.click(function () {
			window.clearTimeout(alerttimer);
			$alert.animate({height: '0'}, 200);
		});
	}
});
