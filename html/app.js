window.addEventListener('message', function(event) {
    var item = event.data;

    if (item.showUI) {
        $('body').fadeIn(200);
    } else {
        $('body').fadeOut(200);
    }
});

$(".close").click(function(e) {
    $.post('https://L4N_school/close', JSON.stringify({}));
});

$(".random").click(function(e) {
	$.post("https://L4N_school/L4N:RANDOMSCHOOL", JSON.stringify({}));
});


$(".SCHOOL1").click(function(e) {
	$.post("https://L4N_school/L4N:SCHOOL1", JSON.stringify({}));
});

$(".SCHOOL2").click(function(e) {
	$.post("https://L4N_school/L4N:SCHOOL2", JSON.stringify({}));
});

$(".SCHOOL3").click(function(e) {
	$.post("https://L4N_school/L4N:SCHOOL3", JSON.stringify({}));
});

$(".SCHOOL4").click(function(e) {
	$.post("https://L4N_school/L4N:SCHOOL4", JSON.stringify({}));
});