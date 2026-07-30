*** Settings ***
Library    SeleniumLibrary
Library    String
Library    DateTime

Resource    ../resources/Common.robot
Resource    ../resources/PageSelect.robot

*** Variables ***
${MONDAY_TOGGLE}        xpath=//div[contains(text(),'Monday')]/preceding::input[@type='checkbox'][1]
${MONDAY_ADD_TIME}      xpath=//div[contains(text(),'Monday')]/following::button[contains(text(),'Add Consultation Time')][1]

${TUESDAY_TOGGLE}       xpath=//div[contains(text(),'Tuesday')]/preceding::input[@type='checkbox'][1]
${TUESDAY_ADD_TIME}     xpath=//div[contains(text(),'Tuesday')]/following::button[contains(text(),'Add Consultation Time')][1]

# ${Save_BUTTON}          xpath=//button[normalize-space()='Save']
${SAVE_BTN}    xpath=//button[contains(@class,'btn-save')]

*** Keywords ***

Open Browser Login And Goto Dashboard
    Page Selection    fa-gear fa-light    Schedule
    Log to Console    Navigated to Practice Schedule Page

Enable Monday Schedule
    Wait Until Element Is Visible    ${MONDAY_TOGGLE}    10s
    Click Element    ${MONDAY_TOGGLE}

Add Monday Consultation Time
    Wait Until Element Is Visible    ${MONDAY_ADD_TIME}
    Click Element    ${MONDAY_ADD_TIME}

Enable Tuesday Schedule
    Click Element    ${TUESDAY_TOGGLE}

Add Tuesday Consultation Time
    Click Element    ${TUESDAY_ADD_TIME}

Save Schedule
    Click Element    ${Save_BUTTON}