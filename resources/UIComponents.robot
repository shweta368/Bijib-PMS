*** Settings ***
Resource    ui/Buttons.robot
Resource    ui/Dropdowns.robot
Resource    ui/DatePickers.robot
Resource    ui/TextFields.robot
# Resource    ui/Checkboxes.robot
# Resource    ui/Radios.robot

*** Keywords ***
Is Field Mandatory
    [Arguments]    ${field_label_text}
    ${xpath}=    Set Variable    //p[normalize-space()='${field_label_text}']/span[contains(text()='*')]
    ${is_present}=    Run Keyword And Return Status    Page Should Contain Element    xpath=${xpath}
    RETURN    ${is_present}

Is Field Mandatory With Path
    [Arguments]    ${FIELD_PATH}
    ${xpath}=    Set Variable    ${FIELD_PATH}/span[normalize-space()='*']
    ${is_present}=    Run Keyword And Return Status    Page Should Contain Element    xpath=${xpath}    
    RETURN    ${is_present}

Check Element Exists
    [Arguments]    ${ELEMENT_PATH}
    ${exists}=    Run Keyword And Return Status    Page Should Contain Element    ${ELEMENT_PATH}  
    RETURN    ${exists}