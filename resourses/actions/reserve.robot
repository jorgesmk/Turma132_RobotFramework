*** Settings ***
Documentation    Suite description


*** Keywords ***
selecionar voo primeiro voo da lista
    click button    class = btn.btn-small

Selecionar o voo numero "${num}"
    click button    css = tr:nth-child(1) .btn
