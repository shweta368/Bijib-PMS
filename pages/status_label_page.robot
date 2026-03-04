*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../variables/Common.robot

*** Variables ***
${ERROR_ALERT}    (//lib-status-label/div[contains(@class,"bg-red-50")])[1]
${SUCCESS_ALERT}    (//lib-status-label/div[contains(@class,"bg-green-50")])[1]

*** Keywords ***
Get Error Alert Message
    Wait Until Element Is Visible    ${ERROR_ALERT}    ${TIMEOUT}
    ${msg}=    Get Text    ${ERROR_ALERT}
    ${msg}=    Strip String    ${msg}
    RETURN    ${msg}

Get Success Alert Message
    Wait Until Element Is Visible    ${SUCCESS_ALERT}    10s
    ${msg}=    Get Text    ${SUCCESS_ALERT}
    ${msg}=    Strip String    ${msg}
    RETURN    ${msg}

Error Alert Should Be
    [Arguments]    ${expected}
    ${actual}=    Get Error Alert Message
    Should Be Equal    ${actual}    ${expected}
    # Wait Until Error Alert Disappear

Success Alert Should Be
    [Arguments]    ${expected}
    ${actual}=    Get Success Alert Message
    Should Be Equal    ${actual}    ${expected}
    Wait Until Success Alert Disappear

Wait Until Error Alert Disappear
    Wait Until Page Does Not Contain Element    ${ERROR_ALERT}    ${TIMEOUT}
    Log To Console    ✅ Error Alert Disappear

Wait Until Success Alert Disappear
    Wait Until Page Does Not Contain Element    ${SUCCESS_ALERT}    ${TIMEOUT}
    Log To Console    ✅ Success Alert Disappear