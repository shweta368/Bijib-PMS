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
    Wait For Loader To Disappear
    Goto Service    Bijib PMS    TEST HOSPITAL    ${PMS_DASHBOARD_URL}

    Wait For Loader To Disappear

    Log To Console    Logged in and navigated to dashboard


Wait For Loader To Disappear

    Wait Until Keyword Succeeds
    ...    20s
    ...    500ms
    ...    Loader Should Be Gone

Loader Should Be Gone

    ${count}=    Get Element Count
    ...    xpath=//div[contains(@class,'animate-spin')]

    IF    ${count} > 0
        Element Should Not Be Visible
        ...    xpath=//div[contains(@class,'animate-spin')]
    END
    
Open Browser Keyword
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys

    Call Method    ${options}    add_argument    --headless\=new
    Call Method    ${options}    add_argument    --window-size\=1920,1080
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --no-sandbox

    Open Browser
    ...    ${BASE_URL}
    ...    Chrome
    ...    options=${options}

    Set Window Size    1920    1080

    Set Selenium Timeout    30s
    Set Selenium Implicit Wait    2s
    Set Selenium Speed    0s

    Wait Until Page Contains Element    xpath=//body

# Open Browser Keyword
#     Open Browser    ${BASE_URL}    ${BROWSER}
#     Maximize Browser Window
#     Set Selenium Speed    ${SELENIUM_SPEED}
#     Title Should Be    ${WEB_TITLE}
Close Browser Keyword
    Close Browser