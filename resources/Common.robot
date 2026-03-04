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
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Create WebDriver    Chrome    options=${chrome_options}
    Go To    ${BASE_URL}


    # Open Browser    ${BASE_URL}    ${BROWSER}
    # Maximize Browser Window
    Set Selenium Speed    ${SELENIUM_SPEED}
    Title Should Be    ${WEB_TITLE}
Close Browser Keyword
    Close Browser