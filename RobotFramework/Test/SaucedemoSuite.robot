*** Settings ***
Resource            ../Resources/resources.robot

*** Test Cases ***
Wrong pass test
    Given the user open the Web browser
    Then the user sees the user and password fields are clear
    When the user enter user and wrong password
    When the user clicks on login button
    Then the user should be see wrong password alert

login to saucedemo
    
    Given the user open the Web browser
    Then the user sees the user and password fields are clear
    When the user enter user and password
    When the user clicks on login button
    Then the user should be see products

looking detailed item description

    When the user click on first product title
    Then the user shuld be see Add to cart button on detailed page

Add an item to basket in detailed view

    When the user clicks on Add to cart button on detailed page
    then the user should be see the shopingcart badge


Check the basket items
    When the user clicks on Shoping cart button on detailed page
    Then the user should view one item in the cart

Checkout the basket
    When the user clicks checkout button
    Then the user should see the buyers form clear
    Then the user must fill the form
    When the user clicks continue checkout button
    Then the user should check the final price
    When the user clicks finish
    Then the user should see completed checkout page



Logout saucedemo
    When the user clicks on burger menu
    Then the user clicks on logout Button
    Then the user sees the user and password fields are clear
    Then the user close the web browser



