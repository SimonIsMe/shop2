
$ ->
  imie = ''
  while (imie == '')
    imie = prompt('Jak masz na imię?')
  $('#firstname').text(imie)
  $('#hello').show()
