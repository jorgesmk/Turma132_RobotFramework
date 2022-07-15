*** Settings ***
Documentation    mapeamento das acoes da pagina de confirmacao

*** Keywords ***
validar a mensagem de agradecimento "${mensagem}"
    element should contain  xpath = /h1    ${mensagem}

validar o id da passagem "${id}"
    element should contain  css = tr:nth-child(1) > td:nth-child(2)    ${id}

validar o status da passagem "${status}"
    element should contain  css = tr:nth-child(2) > td:nth-child(2)    ${status}

validar o preco da passagem "${preco}"
    element should contain  css = tr:nth-child(3) > td:nth-child(2)    ${preco}

validar os ultiomos 4 digitos do cartao "${final_cartao}"
    element should contain  css = tr:nth-child(4) > td:nth-child(2)    ${final_cartao}

validar a data de expiracao do cartao "${Expiration}"
    element should contain  css = tr:nth-child(5) > td:nth-child(2)    ${Expiration}

validar o codigo de seguranca do cartao "${cvv}"
    element should contain  css = tr:nth-child(6) > td:nth-child(2)    ${cvv}

validar a data da transacao "${data}"
    element should contain  css = tr:nth-child(7) > td:nth-child(2)    ${data}

validar o jason da transacao "${jason_esperado}"
    element text should be tag = pre    ${jason_esperado}