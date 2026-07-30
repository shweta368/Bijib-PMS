# 

*** Settings ***
Library    SeleniumLibrary
Library    String
Library    DateTime

Resource    ../resources/Common.robot
Resource    ../resources/PageSelect.robot

*** Variables ***
${BOOK_APPOINTMENT_BTN}    Book Appointment

*** Keywords ***

# Open Book Appointment Slide In Patient
#     [Arguments]    ${PatientName}
#     Open Browser Login And Goto Dashboard
#     Page Selection    fa-grid-2 fa-light    Register Patient
#     Textfield With Placeholder    Name    ${PatientName}
#     Button Click    Search
#     Wait Until Page Contains Element    xpath=//td[normalize-space()='${PatientName}']    10s
#     Click Element    xpath=//tr[td//span[normalize-space()='${PatientName}']]//i[contains(@class,'fa-calendar-check')]

Open Book Appointment Slide In Patient
    [Arguments]    ${PatientName}

    Open Browser Login And Goto Dashboard

    Page Selection    fa-grid-2 fa-light    Register Patient

    Wait Until Element Is Visible
    ...    xpath=//button[.//span[normalize-space()='Filters']]
    ...    20s

    Click Element
    ...    xpath=//button[.//span[normalize-space()='Filters']]

    Wait Until Element Is Visible
    ...    xpath=//input[@placeholder='Search by Name, Email, Mobile, or MRN']
    ...    20s

    Click Element
    ...    xpath=//input[@placeholder='Search by Name, Email, Mobile, or MRN']

    Press Keys
    ...    xpath=//input[@placeholder='Search by Name, Email, Mobile, or MRN']
    ...    CTRL+a+BACKSPACE

    Input Text
    ...    xpath=//input[@placeholder='Search by Name, Email, Mobile, or MRN']
    ...    ${PatientName}

    Wait Until Element Is Visible
    ...    xpath=//div[contains(@class,'cursor-pointer') and normalize-space()='${PatientName}']
    ...    20s

    Click Element
    ...    xpath=//div[contains(@class,'cursor-pointer') and normalize-space()='${PatientName}']

    Wait Until Element Is Visible
    ...    xpath=//button[.//span[contains(normalize-space(),'Apply')]]
    ...    20s

    Click Element
    ...    xpath=//button[.//span[contains(normalize-space(),'Apply')]]

    Wait Until Page Contains Element
    ...    xpath=//td[normalize-space()='${PatientName}']
    ...    20s

    Wait Until Element Is Visible
    ...    xpath=//tr[td[normalize-space()='${PatientName}']]//i[contains(@class,'fa-calendar-check')]
    ...    20s

    Scroll Element Into View
    ...    xpath=//tr[td[normalize-space()='${PatientName}']]//i[contains(@class,'fa-calendar-check')]

    Click Element
    ...    xpath=//tr[td[normalize-space()='${PatientName}']]//i[contains(@class,'fa-calendar-check')]

    Wait Until Element Is Visible
    ...    xpath=//button[.//span[contains(normalize-space(),'Book Appointment')]]
    ...    20s


Open Book Appointment On Dashboard
    [Arguments]    ${PatientName}
    Open Browser Login And Goto Dashboard

    Textfield With Placeholder    Search by Name, Email, Mobile, or MRN    ${PatientName}

    Wait Until Element Is Visible
    ...    xpath=//lib-autocomplete/div/div/div/div/div/div[contains(text(),"${PatientName}")]
    ...    10s

    Click Element With Path
    ...    //lib-autocomplete/div/div/div/div/div/div[contains(text(),"${PatientName}")]

    Wait Until Element Is Visible
    ...    xpath=//div[@title="Book Appointment"]
    ...    10s

    Click Element With Path
    ...    //div[@title="Book Appointment"]

    Wait Until Element Is Visible
    ...    xpath=//button[normalize-space()='Book Appointment']
    ...    10s

Open Book Appointment In Calendar
    Open Browser Login And Goto Dashboard
    Button Click    Calendar
    Button Click    Book Appointment

Click Book Appointment
    [Arguments]    ${INDEX}=1

    Wait Until Keyword Succeeds
    ...    10s
    ...    500ms
    ...    Button Click
    ...    ${BOOK_APPOINTMENT_BTN}
    ...    ${INDEX}

# -------------------- Patient Details --------------------

Select Appointment Date
    [Arguments]    ${year}    ${month}    ${day}
    Select Date With Label    Appointment Date    ${year}    ${month}    ${day}
    Log To Console    Selected Date: ${year}-${month}-${day}

Select Doctor
    [Arguments]    ${Doctor}
    Dropdown With Label    Doctor    ${Doctor}
    Log To Console    Selected Doctor: ${Doctor}

Select Appointment Type
    [Arguments]    ${AppointmentType}
    Dropdown With Label    Appointment Type    ${AppointmentType}
    Log To Console    Selected Appointment Type: ${AppointmentType}

# Select Start Time
#     [Arguments]    ${StartTime}
#     Dropdown With Label    Start Time    ${StartTime}
#     Log To Console    Selected Start Time: ${StartTime}

Select Start Time
    [Arguments]    ${StartTime}

    Wait Until Element Is Visible
    ...    xpath=//label[normalize-space()='Start Time']/following::select[1]
    ...    10s

    Wait Until Keyword Succeeds
    ...    10s
    ...    500ms
    ...    Dropdown With Label
    ...    Start Time
    ...    ${StartTime}

    Log To Console
    ...    Selected Start Time: ${StartTime}

Select Patient
    [Arguments]    ${Patient}
    Textfield With Placeholder    Search Patient    ${Patient}

    Wait Until Element Is Visible
    ...    xpath=//lib-autocomplete/div/div/div/div/div/div[contains(text(),"${Patient}")]
    ...    10s

    Click Element With Path
    ...    //lib-autocomplete/div/div/div/div/div/div[contains(text(),"${Patient}")]

    Log To Console    Selected Patient: ${Patient}

# Select Referral Doctor
#     [Arguments]    ${ReferralDoctor}
#     Dropdown With Label    Referral Doctor    ${ReferralDoctor}
#     Log To Console    Selected Referral Doctor: ${ReferralDoctor}

Select Referral Doctor
    [Arguments]    ${ReferralDoctor}

    Wait Until Element Is Visible
    ...    xpath=//label[normalize-space()='Referral Doctor']/following::select[1]
    ...    10s

    Wait Until Keyword Succeeds
    ...    10s
    ...    500ms
    ...    Dropdown With Label
    ...    Referral Doctor
    ...    ${ReferralDoctor}

    Log To Console
    ...    Selected Referral Doctor: ${ReferralDoctor}

Check Referral Doctor Mandatory
    ${status}=    Run Keyword And Return Status
    ...    Element Should Be Visible
    ...    xpath=//label[contains(normalize-space(),'Referral Doctor')]
    RETURN    ${status}