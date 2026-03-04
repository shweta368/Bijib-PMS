*** Settings ***
Library    SeleniumLibrary
Resource    UIComponents.robot
Resource    ../variables/Common.robot

*** Keywords ***
Goto Service
    [Arguments]    ${SERVICE_NAME}    ${HOSPITAL_NAME}=""    ${SERVICE_URL}=""

    Location Should Be    ${DASHBOARD_URL}
    Log to Console    Navigated to Dashboard
    
    Click Element With Path    //li[@title="${SERVICE_NAME}"]/div[normalize-space()="${SERVICE_NAME}"]
       
    # ${exists}=    Check Element Exists    //div[contains(@class,"submenu dsktp-vw-dsply")]/span[normalize-space()="${SERVICE_NAME}"]
    # Run Keyword If    ${exists}    Click Element With Path    //div[contains(@class,"submenu dsktp-vw-dsply")]/span[normalize-space()="${SERVICE_NAME}"]/following-sibling::ul//li[normalize-space()="${HOSPITAL_NAME}"]
    Click Element With Path    //div[contains(@class,"submenu dsktp-vw-dsply")]/span[normalize-space()="${SERVICE_NAME}"]/following-sibling::ul//li[normalize-space()="${HOSPITAL_NAME}"]
    
    Wait Until Location Is    ${SERVICE_URL}    ${TIMEOUT_LONG}