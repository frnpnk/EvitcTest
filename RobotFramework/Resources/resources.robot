*** Settings ***
Documentation       Tests to Evitec

Library             SeleniumLibrary


*** Variables ***

${LOGIN URL}        https://www.saucedemo.com/
${BROWSER}          Chrome
${username}         standard_user
${password}         secret_sauce
${inputUser}        xpath://*[@id="user-name"]
${inputPass}        xpath://*[@id="password"]
${firstProduct}     xpath://*[@id="inventory_container"]/div/div[1]
${loginButton}      xpath://*[@id="login-button"]


*** Keywords ***
the user open the Web browser
    Open Browser    ${LOGIN URL}    ${BROWSER}

the user sees the user and password fields are clear
    Wait Until Element Does Not Contain    ${inputUser}    ''
    Wait Until Element Does Not Contain    ${inputPass}    ''

the user enter user and password
    Input Text    ${inputUser}    ${username}
    Input Text    ${inputPass}    ${password}

the user clicks on login button
    Click Button  ${loginButton}
    Sleep    2seconds 

the user should be see products
    Wait Until Element Is Visible    ${firstproduct}    15
    Sleep    2seconds
    Close Browser