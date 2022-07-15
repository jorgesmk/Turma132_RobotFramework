*** Settings ***
Library     SeleniumLibrary
Library     Browser
Library     OperatingSystem

Resource    actions/confimation.robot
Resource    actions/header.robot
Resource    actions/index.robot
Resource    actions/purchase.robot
Resource    actions/reserve.robot

*** Variable ***
${timeout}  10
${url}      https://www.blazedemo.com
${browser}  Chrome

*** Keywords ***
Abrir Navegador
    open browser    ${url}  ${browser}

Fechar Navegador
    close browser

Ler Jason
    [arguments]     ${nome_arquivo}

    ${arquivo}      get file    ${EXECDIR}/resources/fixtures/${nome_arquivo}
    ${arquivo_json} evaluate    jason.loads(${arquivo})     json

    [retur]     ${arquivo_jason}
