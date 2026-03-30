*** Settings ***
Resource    ../../variables/Common.robot
Resource    ../../pages/status_label_page.robot
Resource    ../../pages/book_appointment_page.robot 
Library    DataDriver    file=../../data/calendar_bookappointment_data.csv    dialect=excel    encoding=UTF-8

Suite Setup    Open Book Appointment In Calendar
Suite Teardown    Close Browser
Test Template    Fill Book Appointment Form From Calendar

*** Variables ***

*** Test Cases ***
Validate Book Appointment Flow with Valid Data CSV


*** Keywords ***
Fill Book Appointment Form From Calendar
    [Arguments]    
    ...    ${Doctor}=${EMPTY}    
    ...    ${AppointmentType}=${EMPTY}    
    ...    ${StartTime}=${EMPTY}    
    ...    ${Patient}=${EMPTY}    
    ...    ${ReferralDoctor}=${EMPTY}
    ...    ${ExpectedResult}=${EMPTY}
    ...    ${ExpectedAlert}=${EMPTY} 

    Select Doctor              ${Doctor}
    Select Appointment Type    ${AppointmentType}
    Select Start Time          ${StartTime}
    Select Patient             ${Patient}
    Select Referral Doctor     ${ReferralDoctor}
    Click Book Appointment    2
    Run Keyword If    '${ExpectedResult}'=='Success'
    ...    Success Alert Should Be    ${ExpectedAlert}
    ...    ELSE
    ...    Error Alert Should Be      ${ExpectedAlert}

