*** Settings ***
Documentation       Tests to Evitec

Library             SeleniumLibrary
Variables            ./locators.py

*** Variables ***

${LOGIN URL}        https://www.saucedemo.com/
${BROWSER}          Chrome
${username}         standard_user
${password}         secret_sauce
${wrongUserOrPass}    Epic sadface: Username and password do not match any user in this service


*** Keywords ***
the user open the Web browser
    Open Browser    ${LOGIN URL}    ${BROWSER}

the user sees the user and password fields are clear
    Wait Until Element Does Not Contain    ${inputUser}    ''
    Wait Until Element Does Not Contain    ${inputPass}    ''

the user enter user and wrong password
    Input Text    ${inputUser}    ${username}
    Input Text    ${inputPass}    'badPassword'

the user enter user and password
    Input Text    ${inputUser}    ${username}
    Input Text    ${inputPass}    ${password}

the user clicks on login button
    Click Button  ${loginButton}
    Sleep    2seconds 

the user should be see wrong password alert
    Wait Until Page Contains    ${wrongUserOrPass}

the user should be see products
    Wait Until Element Is Visible    ${firstProduct}    5
    Sleep    2seconds

the user click on first product title
    Wait Until Element Is Visible    ${firstProductTitle}    5
    Click Element                    ${firstProductTitle}

the user shuld be see Add to cart button on detailed page
    Wait Until Element Is Visible    ${addtoCartButton}      5
    Sleep    2seconds

the user clicks on Add to cart button on detailed page
    Wait Until Element Is Visible    ${addtoCartButton}      5
    Click Element    ${addToCartButton}
    Sleep    2seconds
    
the user clicks on Shoping cart button on detailed page
    Click Element    ${cartButton}
    

the user should be see the shopingcart badge
    Wait Until Element Is Visible     ${shopingCartBadge}

the user should view one item in the cart
    Wait Until Element Is Visible    ${ItemInCart}

the user clicks checkout button
    Wait Until Element Is Visible    ${checkoutButton}
    Click Element    ${checkoutButton}

the user should see the buyers form clear
    Wait Until Element Does Not Contain    ${firstname}    ''
    Wait Until Element Does Not Contain    ${lastname}    ''
    Wait Until Element Does Not Contain    ${postalCode}    ''


the user must fill the form
    Input Text    ${lastname}    'Jhon'
    Input Text    ${firstname}    'Dhoe'
    Input Text    ${postalCode}    '11442'
    


the user clicks continue checkout button
    Wait Until Element Is Visible    ${continueBtn}
    Click Button    ${continueBtn}
    

the user should check the final price
    Wait Until Element Is Visible    ${totalPrice}    

the user clicks finish
    Wait Until Element Is Visible        ${finishButton}
    Click Button    ${finishButton}
    Sleep     2

the user should see completed checkout page
    Wait Until Element Is Visible        ${CompleteCheckout}


the user clicks on burger menu
    Wait Until Element Is Visible    ${burgerButton}
    Click Button                     ${burgerButton}
    Sleep     2

the user clicks on logout Button
    Wait Until Element Is Visible    ${logoutButton}    10
    Sleep     2
    Click Element                     ${logoutButton}

the user close the web browser
    Close Browser