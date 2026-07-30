*** Settings ***
Library    SeleniumLibrary
Resource    UIComponents.robot

*** Keywords ***
# Page Selection
#     [Arguments]    ${CATEGORY_ICON}    ${PAGE_NAME}

#     ${CATEGORY_PATH}=    Set Variable    //li[contains(@class,"nav-item")]//i[contains(@class,"${CATEGORY_ICON}")]
#     ${PAGE_PATH}=        Set Variable    //span[normalize-space()="${PAGE_NAME}"]

#     # Location Should Be    ${PMS_DASHBOARD_URL}
#     # Log to Console    Navigated to Bijib PMS Dashboard

#     # Click Element With Path    ${CATEGORY_PATH}
#     Wait Until Element Is Visible
# ...    xpath=${CATEGORY_PATH}
# ...    30s

#     Scroll Element Into View
# ...    xpath=${CATEGORY_PATH}

#     Click Element
# ...    xpath=${CATEGORY_PATH}
#     Click Element With Path    ${PAGE_PATH}
    
#     Log to Console    Navigated to ${PAGE_NAME} Page

Page Selection
    [Arguments]    ${CATEGORY_ICON}    ${PAGE_NAME}

    Wait For Loader To Disappear

    ${CATEGORY_PATH}=    Set Variable
    ...    //li[contains(@class,"nav-item")]//i[contains(@class,"${CATEGORY_ICON}")]

    ${PAGE_PATH}=    Set Variable
    ...    //span[normalize-space()="${PAGE_NAME}"]

    Click Element With Path    ${CATEGORY_PATH}

    Wait For Loader To Disappear

    Click Element With Path    ${PAGE_PATH}

    Wait For Loader To Disappear

    Log To Console    Navigated to ${PAGE_NAME} Page    