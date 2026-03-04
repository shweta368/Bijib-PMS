*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/Common.robot
Resource   ../resources/Login.robot
Resource   ../resources/Service.robot

*** Keywords ***
Open Browser and Goto Login
    Open Browser Keyword

Open Browser Login And Goto Dashboard
    Open Browser Keyword
    Login and Goto Dashboard
    Goto Service    Bijib PMS    TEST HOSPITAL    ${PMS_DASHBOARD_URL}
    Log To Console    Logged in and navigated to dashboard

Open Browser Keyword
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${SELENIUM_SPEED}
    Title Should Be    ${WEB_TITLE}
Close Browser Keyword
    Close Browser