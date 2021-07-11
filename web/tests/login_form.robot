*** Settings ***
Resource        base.robot

Test Setup     Nova sessão 
Test Teardown  Encerra sessão

*** Test Cases ***
Login com sucesso
    Go To                         ${url}/login
    Login With                    stark   jarvis!
    Sleep                         1

    Should See Logged username    Tony Stark

Senha Inválida
    [tags]                        login_error
    Go To                         ${url}/login
    Login With                    stark   abc123
    Sleep                         1

    Should Contain Login Alert    Senha é invalida!

Usuário não existe
    [tags]                        login_user404
    Go To                         ${url}/login
    Login With                    papito   123456
    Sleep                         1

    Should Contain Login Alert    O usuário informado não está cadastrado!


*** Keywords ***
Login With
    [Arguments]                   ${uname}    ${pass}

    Input Text                    css:input[name=username]        ${uname}
    Input Text                    css:input[name=password]        ${pass}
    Click Element                 class:btn-login

Should Contain Login Alert 
    [Arguments]                   ${expect_message}

    ${message}=                   Get WebElement          id:flash
    Should Contain                ${message.text}         ${expect_message}

Should See Logged username
    [Arguments]                   ${full_name}

    Page Should Contain           Olá, ${full_name}. Você acessou a área logada!