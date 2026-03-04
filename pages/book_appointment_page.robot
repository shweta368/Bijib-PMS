*** Settings ***
Library    SeleniumLibrary
Library    String
Library    DateTime

Resource    ../resources/Common.robot
Resource    ../resources/PageSelect.robot

*** Variables ***
${BOOK_APPOINTMENT_BTN}    Book Appointment

*** Keywords ***   

Open Book Appointment Slide In Patient
    [Arguments]    ${PatientName}
    Open Browser Login And Goto Dashboard
    Page Selection    fa-grid-2 fa-light    Register Patient
    Textfield With Placeholder    Name    ${PatientName}
    Button Click    Search
    Wait Until Page Contains Element    xpath=//td[normalize-space()='${PatientName}']    10s
    Click Element    xpath=//td[normalize-space()='${PatientName}']/following-sibling::td//span[@title='Book Appointment']
    
Open Book Appointment On Dashboard
    [Arguments]    ${PatientName}
    Open Browser Login And Goto Dashboard
    Textfield With Placeholder    Search by Name, Email, Mobile, or MRN    ${PatientName}
    Click Element With Path    //lib-autocomplete/div/div/div/div/div/div[contains(text(),"${PatientName}")]
    Click Element With Path    //div[@title="Book Appointment"]

Open Book Appointment In Calendar
    [Arguments]    ${PatientName}
    Wait Until Page Contains Element    Click Element    xpath=//lib-button[normalize-space(@label)="Calendar"]//button  10s
    Click Element    xpath=Click Element    xpath=//lib-button[normalize-space(@label)="Calendar"]
    Click Element   (//button[normalize-space()='Book Appointment'])[1]
    Button Click    ${BOOK_APPOINTMENT_BTN}

Click Book Appointment
    Button Click    ${BOOK_APPOINTMENT_BTN}

    # --- Patient Details ---
Select Doctor
    [Arguments]    ${Doctor}
    Dropdown With Label    Doctor    ${Doctor}

Select Appointment Type
    [Arguments]    ${Appointment Type}
    Dropdown With Label    Appointment Type    ${Appointment Type}

Select Start Time
   [Arguments]    ${Start Time}
    Dropdown With Label    Start Time    ${Start Time}

Select Referral Doctor
   [Arguments]    ${Referral Doctor}
    Dropdown With Label   Referral Doctor    ${Referral Doctor}





