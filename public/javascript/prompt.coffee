
$ ->
    imie = ''
    while (imie == '')
        imie = prompt('Jak masz na imię?')
    source   = $("#hello-tpl").html();
    template = Handlebars.compile(source);
    html = template({ firstname: imie});
    $('#hello').html(html)
