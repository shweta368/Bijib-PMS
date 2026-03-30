*** Settings ***
Library    SeleniumLibrary
Resource   ../pages/doctor_schedule_page.robot

*** Variables ***
${URL}    https://your-application-url

*** Test Cases ***
Validate Doctor Schedule Creation

    Open Browser    ${URL}    Chrome
    Maximize Browser Window

    Enable Monday Schedule
    Add Monday Consultation Time

    Enable Tuesday Schedule
    Add Tuesday Consultation Time

    Save Schedule

    Close Browser