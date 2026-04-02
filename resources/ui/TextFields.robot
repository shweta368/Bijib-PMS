*** Settings ***
Library    SeleniumLibrary
Resource    ../../variables/Common.robot

*** Keywords ***
Textfield With Label
    [Arguments]    ${LABEL}    ${VALUE}    ${INDEX}=1
    ${BASE_PATH}=    Set Variable    //div[label[normalize-space(text())="${LABEL}"]]/following-sibling::

    ${INPUT_PATH}=    Set Variable    xpath=(${BASE_PATH}div/div/input)[${INDEX}]
    Wait Until Element Is Visible    ${INPUT_PATH}    ${TIMEOUT}
    Clear Element Text    ${INPUT_PATH}
    Input Text    ${INPUT_PATH}    ${VALUE}

Textfield With Dropdown
    [Arguments]    ${LABEL}    ${VALUE}    ${INDEX}=1
    ${BASE_PATH}=    Set Variable    //div[label[normalize-space(text())="${LABEL}"]]/following-sibling::

    ${DROPDOWN_PATH}=    Set Variable    xpath=(${BASE_PATH}div/div/select)[${INDEX}]
    Wait Until Element Is Visible    ${DROPDOWN_PATH}    ${TIMEOUT}
    Select From List By Label    ${DROPDOWN_PATH}    ${VALUE}

Textfield With Placeholder
    [Arguments]    ${PLACEHOLDER}    ${VALUE}    ${INDEX}=1

    ${INPUT_PATH}=    Set Variable    xpath=(//input[@placeholder="${PLACEHOLDER}"])[${INDEX}]
    Wait Until Element Is Visible    ${INPUT_PATH}    ${TIMEOUT}
    Clear Element Text    ${INPUT_PATH}
    Input Text    ${INPUT_PATH}    ${VALUE}

Textfield With Path
    [Arguments]    ${PATH}    ${VALUE}    ${INDEX}=1

    ${INPUT_PATH}=    Set Variable    xpath=(${PATH})[${INDEX}]
    Wait Until Element Is Visible    ${INPUT_PATH}    ${TIMEOUT}
    Clear Element Text    ${INPUT_PATH}
    Input Text    ${INPUT_PATH}    ${VALUE}
