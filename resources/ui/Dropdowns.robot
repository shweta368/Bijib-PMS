*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Dropdown With Label
    [Arguments]    ${LABEL}    ${VALUE}    ${INDEX}=1
    ${BASE_PATH}=    Set Variable    //div[label[text()="${LABEL}"]]/following-sibling::

    ${DROPDOWN_PATH}=    Set Variable    xpath=(${BASE_PATH}div/div/select)[${INDEX}]
    Wait Until Element Is Visible    ${DROPDOWN_PATH}    ${TIMEOUT}
    Select From List By Label    ${DROPDOWN_PATH}    ${VALUE}
    Log To Console    Dropdown with label ${LABEL} selected value ${VALUE}