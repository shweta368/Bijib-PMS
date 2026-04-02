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
    [Arguments]    ${year}    ${month}    ${day}    ${Doctor}    ${AppointmentType}    ${StartTime}    ${Patient}    ${ReferralDoctor}    ${ExpectedResult}    ${ExpectedAlert} 

    Sleep    3s

    Run Keyword If    '${year}' != '' and '${month}' != '' and '${day}' != ''    Select Appointment Date    ${year}    ${month}    ${day}
    Run Keyword If    '${Doctor}' != ''    Select Doctor              ${Doctor}
    Run Keyword If    '${AppointmentType}' != ''    Select Appointment Type    ${AppointmentType}
    Run Keyword If    '${StartTime}' != ''    Select Start Time          ${StartTime}
    Run Keyword If    '${Patient}' != ''    Select Patient              ${Patient}


    ${status}=    Check Referral Doctor Mandatory
    Run Keyword If    ${status} and '${ReferralDoctor}' != ''    Select Referral Doctor    ${ReferralDoctor}
    Click Book Appointment    2

    IF    '${ExpectedResult}' == 'Success'
        Success Alert Should Be    ${ExpectedAlert}
    ELSE
        Error Alert Should Be      ${ExpectedAlert}
    END
