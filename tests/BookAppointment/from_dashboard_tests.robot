*** Settings ***
Resource    ../../variables/Common.robot
Resource    ../../pages/status_label_page.robot
Resource    ../../pages/book_appointment_page.robot 
Library    DataDriver    file=../../data/dashboard_bookappointment_data.csv    dialect=excel    encoding=UTF-8

Suite Setup    Open Book Appointment On Dashboard   Aiko
Suite Teardown    Close Browser
Test Template    Fill Book Appointment Form From Dashboard

*** Variables ***

*** Test Cases ***
Validate Book Appointment Flow with Valid Data CSV


*** Keywords ***
Fill Book Appointment Form From Dashboard
    [Arguments]    
    ...    ${Doctor}=${EMPTY}    
    ...    ${AppointmentType}=${EMPTY}    
    ...    ${StartTime}=${EMPTY}    
    ...    ${ReferralDoctor}=${EMPTY}
    ...    ${ExpectedResult}=${EMPTY}
    ...    ${ExpectedAlert}=${EMPTY} 

    Set Selenium Speed    0.3s

    Select Doctor              ${Doctor}
    Select Appointment Type    ${AppointmentType}
    Select Start Time          ${StartTime}
    Select Referral Doctor     ${ReferralDoctor}
    Click Book Appointment
    Run Keyword If    '${ExpectedResult}'=='Success'
    ...    Success Alert Should Be    ${ExpectedAlert}
    ...    ELSE
    ...    Error Alert Should Be      ${ExpectedAlert}

