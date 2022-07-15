*** Settings ***
Documentation    mapeamento das acoes da pagina index.htm

# DSL = Doain Specific Language
*** Keywords ***
selecionar origem e destino do voo
    [Arguments] ${origem}   ${destino}
    select from list by label       id = fromPort      ${origem}
    select from list by label       id = toPort        ${origem}
    click button                    class = btn.btnprimary

Clicar em Home
    click link                    link = home

Conferir o destino da semana
    click link                    link = destination of the week! The Beach!