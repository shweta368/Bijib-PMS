*** Settings ***
Resource    ../variables/Common.robot
Resource    ../resources/Common.robot
Resource    ../pages/login_page.robot
Resource    ../pages/loader_page.robot

Suite Setup    Open Browser and Goto Login
Suite Teardown   Close Browser Keyword

Documentation   This test suite validates the login functionality of the application by verifying error messages for invalid login scenarios and successful authentication using valid credentials.

*** Test Cases ***

Verify Error Message When Username And Password Are Empty
    [Documentation]    Verify that an appropriate error message is displayed when both username and password are left empty.
    [Tags]    Regression

    Login With Credentials    ${EMPTY}    ${EMPTY}
    Check Username Error Alert
    Wait Until Error Msg Disappear


Verify Error Message When Username Is Invalid And Password Is Empty
    [Documentation]    Verify that an appropriate error message is displayed when an invalid username is entered and the password field is empty.
    [Tags]    Regression

    Login With Credentials    ${invalidUserName}    ${EMPTY}
    Check Password Error Alert
    Wait Until Error Msg Disappear


Verify Error Message When Password Is Invalid
    [Documentation]    Verify that an appropriate error message is displayed when both username and password are invalid.
    [Tags]    Regression

    Login With Credentials    ${invalidUserName}    ${invalidPassword}
    ${status}=    Get Loader Status
    Run Keyword If    ${status}    Wait Until Loader Disappear
    Check Invalid Credentials Alert
    Wait Until Error Msg Disappear


Verify Error Message When Password Is Incorrect
    [Documentation]    Verify that an appropriate error message is displayed when a valid username is entered with an incorrect password.
    [Tags]    Regression

    Login With Credentials    ${validUserName}    ${invalidPassword}
    ${status}=    Get Loader Status
    Run Keyword If    ${status}    Wait Until Loader Disappear
    Check Invalid Credentials Alert
    Wait Until Error Msg Disappear


Verify Successful Login With Valid Credentials
    [Documentation]    Verify that a registered user can successfully log in using a valid username and password.
    [Tags]    Smoke

    Login With Credentials    ${validUserName}    ${validPassword}
    ${status}=    Get Loader Status
    Run Keyword If    ${status}    Wait Until Loader Disappear
    Verify Is Successfull Login