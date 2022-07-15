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