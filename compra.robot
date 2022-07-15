*** Settings ***
Documentation    Fluxo de compra no site Blazedemo

Library          SeleniumLibrary

#Test Setup      iniciar     ${url}  ${brouser}
Test Teardown    Encerrar

*** Variables ***
${url}      https://www.blazedemo.com
${browser}  Chrome
]
*** Test Cases ***
Compra de Passagem
    [Tags]    SMOKE
    Dado que acesso o site Blazedemo
    Quando seleciono a origem como "São Paolo" e destino como "New York"
    E clico no botao Find Flights
    Entao exibe o titulo informando a origem e o destino
    Quando seleciono o primeiro voo
    E preencho o nome "Juca"
    E seleciono a bandeira "American Express"
    E marco a opcao Remember Me
    E clico no botao Purchase Flight
    Entao exibe a mensagem "Thank you for your purchase today!"
    E exibe o preco da passagem como "555 USD"
    #Encerrar

*** Keywords ***
Dado que acesso o site Blazedemo
    open browser    ${url}  ${browser}
    wait until element is visible       xpath = //h1                                              #10000ms
    wait until element contains         xpath = //h1  Welcome to the Simple Travel Agency!        #10000ms
    wait for condition                  return document.title == "BlazeDemo"                      #10000ms

Quando seleciono a origem como "${origem}" e destino como "${destino}"
    set test variable   ${origem}
    set test variable   ${destino}
    select from list by label   name = fromPort       ${origem}
    select from list by label   name = toPort         ${destino}

E clico no botao Find Flights
    click button    class = btn.btn-primary

Entao exibe o titulo informando a origem e o destino
    element should contain  xpath = //h3    Flights from ${origem} to ${destino}

Quando seleciono o primeiro voo
   click button    class = btn.btn-small

E preencho o nome "JUCA"
    input text  inputName   Juca

E seleciono a bandeira "American Express"
    select from list by label    name = cardType     American Express

E marco a opcao Remember Me
    select checkbox     name = rememberMe
    #sleep   4000ms
E clico no botao Purchase Flight
    click button    class = btn.btn-primary

Entao exibe a mensagem "Thank you for your purchase today!"
    element should contain         xpath = //h1  Thank you for your purchase today!

E exibe o preco da passagem como "555 USD"
    #xpath: encontrar linha que contenha o texto Amount e pegar o valor da segunda celula
    element should contain   xpath=//table[@class="table"]//tr[td[.="Amount"]]//td[2]    555 USD

Encerrar
    close browser