*** Settings ***
Library    SeleniumLibrary
Resource    UIComponents.robot

*** Keywords ***
Page Selection
    [Arguments]    ${CATEGORY_ICON}    ${PAGE_NAME}

    ${CATEGORY_PATH}=    Set Variable    //li[contains(@class,"nav-item")]//i[contains(@class,"${CATEGORY_ICON}")]
    ${PAGE_PATH}=        Set Variable    //span[normalize-space()="${PAGE_NAME}"]

    # Location Should Be    ${PMS_DASHBOARD_URL}
    # Log to Console    Navigated to Bijib PMS Dashboard

    Click Element With Path    ${CATEGORY_PATH}
    Click Element With Path    ${PAGE_PATH}
    
    Log to Console    Navigated to ${PAGE_NAME} Page