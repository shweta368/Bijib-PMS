*** Settings ***
Library    SeleniumLibrary
Library    String
Resource   ../resources/UIComponents.robot
Resource   ../resources/PageSelect.robot

*** Variables ***
${LOGIN_PAGE_TITLE}    Enter Login Credentials
${ERROR_MSG_PATH}    //p[contains(@class,"cg-red")]
${USERNAME_ERROR_MSG}    Please Enter User Name/Mobile/Email
${PASSWORD_ERROR_MSG}    Please Enter Password
${INVALID_USERNAME_MSG}    Invalid Username
${INVALID_PASSWORD_MSG}    Enter Valid Credentials.
${INVALID_CREDENTIALS_MSG}    Enter Valid Credentials.

*** Keywords ***
Check Is Login Page
    Wait Until Page Contains    ${LOGIN_PAGE_TITLE}     ${TIMEOUT}

Enter Username
    [Arguments]    ${username}
    Textfield With Placeholder    Enter Username    ${username}

Enter Password
    [Arguments]    ${password}
    Textfield With Placeholder    Enter Password    ${password}

Click Login
    Button Click    Login

Click Login With OTP
    Button Click    Login With OTP

Click Forgot Password
    Click Element With Path    //a[normalize-space()="Forgot Password?"]

Get Error Msg
    Wait Until Element Is Visible    ${ERROR_MSG_PATH}    ${TIMEOUT}
    ${msg}=    Get Text    ${ERROR_MSG_PATH}
    ${msg}=    Strip String    ${msg}
    RETURN    ${msg}

Wait Until Error Msg Disappear
    Wait Until Page Does Not Contain Element    ${ERROR_MSG_PATH}    ${TIMEOUT}
    Log To Console    ✅ Error Msg Disappear

Login With Credentials
    [Arguments]    ${username}    ${password}
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login

Check Username Error Alert
    ${actual}=    Get Error Msg
    Should Be Equal    ${actual}    ${USERNAME_ERROR_MSG}

Check Password Error Alert
    ${actual}=    Get Error Msg
    Should Be Equal    ${actual}    ${PASSWORD_ERROR_MSG}

Check Invalid Username Alert
    ${actual}=    Get Error Msg
    Should Be Equal    ${actual}    ${INVALID_USERNAME_MSG}

Check Invalid Password Alert
    ${actual}=    Get Error Msg
    Should Be Equal    ${actual}    ${INVALID_PASSWORD_MSG}

Check Invalid Credentials Alert
    ${actual}=    Get Error Msg
    Should Be Equal    ${actual}    ${INVALID_CREDENTIALS_MSG}

Verify Is Successfull Login
    Wait Until Location Is    ${DASHBOARD_URL}    ${TIMEOUT_LONG}
    Log to Console    Login Successfully
    