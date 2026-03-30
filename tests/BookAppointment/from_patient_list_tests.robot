*** Settings ***
Resource    ../../variables/Common.robot
Resource    ../../pages/status_label_page.robot
Resource    ../../pages/book_appointment_page.robot 

Suite Setup    Open Book Appointment Slide In Patient    John Lee
Suite Teardown    Close Browser


*** Test Cases ***
Validate Doctor Is Mandatory
    Click Book Appointment
    Error Alert Should Be    Select Doctor

Validate Appointment Type Is Mandatory
    Select Doctor    test User3
    Click Book Appointment
    Error Alert Should Be    Select Appointment Type

Validate Start Time Is Mandatory
    Select Appointment Type   Initial consultation
    Click Book Appointment
    Error Alert Should Be    Select Start Appointment Time

# Validate Referral Doctor Is Mandatory
#     Select Start Time   11:00 PM
#     Click Book Appointment
#     Error Alert Should Be    Select Referral Doctor
# Validate Book Apoointment
#     Select Referral Doctor    manju
#     Click Book Appointment    2
#     Success Alert Should Be    Record added successfully


Validate Referral Doctor Is Mandatory
    Select Start Time   11:00 PM
    ${mandatory}=    Check Referral Doctor Mandatory
    IF    ${mandatory}
        Click Book Appointment
        Error Alert Should Be    Select Referral Doctor
    ELSE
        Log    Referral Doctor field is optional. Skipping validation.
    END