*** Settings ***
Resource        base.robot

Test Setup     Nova sessão 
Test Teardown  Encerra sessão

*** Test Cases ***
Selecionar por texto e validar pelo valor
    Go To                           ${url}/dropdown
    Select From List By Label       class:avenger-list              Scott Lang
    ${selected}=                    Get Selected List Value         class:avenger-list
    Should be Equal                 ${selected}                     7
    Sleep                           1

Selecionar pelo valor e validar pelo texto
    Go To                           ${url}/dropdown
    Select From List By Value       id:dropdown                     6
    ${selected}=                    Get Selected List Label         id:dropdown     
    Should be Equal                 ${selected}                     Loki
    Sleep                           1