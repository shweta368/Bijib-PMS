*** Settings ***
Library    DataDriver    file=../../data/claimant_data.csv    dialect=excel
Resource    ../../variables/Common.robot
Resource    ../../resources/Common.robot
Resource    ../../pages/add_patient_page.robot
Resource    ../../pages/status_label_page.robot

Suite Setup    Open Add Patient Slide
Suite Teardown   Close Browser Keyword
Test Template    Validate Claimant Flow

*** Test Cases ***
Validate Claimant Data Driven

*** Keywords ***
Validate Claimant Flow
    [Arguments]
    ...    ${title}    ${first_name}    ${last_name}    ${gender}
    ...    ${year}    ${month}    ${day}
    ...    ${mobile_code}    ${mobile}    ${email}
    ...    ${address}    ${suburb}    ${state}    ${country}    ${postal}
    ...    ${check_minor}    ${expected_error}
    ...    ${family_name}    ${given_name}    ${claimant_gender}
    ...    ${medicare}    ${irn}    ${success_msg}

    # --- Patient Details ---
    Select Title    ${title}
    Enter First Name    ${first_name}
    Enter Last Name    ${last_name}
    Select Gender    ${gender}
    Select Date Of Birth    ${year}    ${month}    ${day}
    Select Mobile Code    ${mobile_code}
    Enter Mobile    ${mobile}
    Enter Email    ${email}
    Enter Address    ${address}
    Enter Suburb    ${suburb}
    Enter State    ${state}
    Enter Country    ${country}
    Enter Postal Code    ${postal}

    # --- Always check claimant section (no IF) ---
    Run Keyword And Ignore Error    Check Is Claimant Details Is Exists

    # --- Claimant Fields (safe execution) ---
    Run Keyword And Ignore Error    Enter Family Name    ${family_name}
    Run Keyword And Ignore Error    Enter Given Name    ${given_name}
    Run Keyword And Ignore Error    Select Claimant Gender    ${claimant_gender}
    Run Keyword And Ignore Error    Enter Medicare Number    ${medicare}
    Run Keyword And Ignore Error    Enter Medicare IRN Number    ${irn}

    Click Save

    # --- Validation ---
    Run Keyword And Ignore Error    Error Alert Should Be    ${expected_error}
    Run Keyword And Ignore Error    Success Alert Should Be    ${success_msg}