*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/Common.robot

*** Variables ***
${LOADER_PATH}    xpath=//lib-loader

*** Keywords ***
Get Loader Status
    [Documentation]    Returns True if loader appears, False if not
    ${status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${LOADER_PATH}    ${TIMEOUT}
    RETURN    ${status}


Check Loader Appear
    ${status}=    Get Loader Status
    Run Keyword If    ${status}    Log To Console    ✅ Loader Appears
    Run Keyword If    not ${status}    Log To Console    ❌ Loader Not Appear


Wait Until Loader Disappear
    Wait Until Page Does Not Contain Element    ${LOADER_PATH}    ${TIMEOUT}
    Log To Console    ✅ Loader Disappear