*** Settings ***
Resource            ../Resources/resources.robot

*** Test Cases ***
login to saucedemo
    
    When the user open the Web browser
    Then the user sees the user and password fields are clear
    When the user enter user and password
    When the user clicks on login button
    Then the user should be see products



looking detailed item description
    Given    user logged
    Then     




Add an item to basket in home page


Add an item to basket in detailed view


Check the basket items

Checkout the basket


Logout saucedemo


