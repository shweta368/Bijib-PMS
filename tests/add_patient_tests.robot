*** Settings ***
Library    DataDriver    file=../data/add_patient_data.csv    dialect=excel
Resource    ../variables/Common.robot
Resource    ../pages/add_patient_page.robot
Resource    ../pages/status_label_page.robot

Suite Setup    Open Add Patient Slide
Suite Teardown    Close Browser Keyword
Test Template    Validate Add Patient Flow

*** Test Cases ***
Add Patient Validation

*** Keywords ***
Validate Add Patient Flow
    [Arguments]    
    ...    ${title}    ${first_name}    ${last_name}    ${gender}
    ...    ${year}    ${month}    ${day}
    ...    ${mobile_code}    ${mobile}    ${email}
    ...    ${address}    ${suburb}    ${state}    ${country}    ${postal}
    ...    ${ec_name}    ${ec_gender}    ${ec_mobile}
    ...    ${ihi1}    ${ihi2}    ${ihi3}
    ...    ${expected_message}




    Run Keyword If    '${title}' != ''    Select Title    ${title}
    Run Keyword If    '${first_name}' != ''    Enter First Name    ${first_name}
    Run Keyword If    '${last_name}' != ''    Enter Last Name    ${last_name}
    Run Keyword If    '${gender}' != ''    Select Gender    ${gender}
    Run Keyword If    '${year}' != ''    Select Date Of Birth    ${year}    ${month}    ${day}
    Run Keyword If    '${mobile_code}' != ''    Select Mobile Code    ${mobile_code}
    Run Keyword If    '${mobile}' != ''    Enter Mobile    ${mobile}
    Run Keyword If    '${email}' != ''    Enter Email    ${email}
    Run Keyword If    '${address}' != ''    Enter Address    ${address}
    Run Keyword If    '${suburb}' != ''    Enter Suburb    ${suburb}
    Run Keyword If    '${state}' != ''    Enter State    ${state}
    Run Keyword If    '${country}' != ''    Enter Country    ${country}
    Run Keyword If    '${postal}' != ''    Enter Postal Code    ${postal}

    Run Keyword If    '${ec_name}' != ''    Enter Emergency Contact Name    ${ec_name}
    Run Keyword If    '${ec_gender}' != ''    Select Emergency Contact Gender    ${ec_gender}
    Run Keyword If    '${ec_mobile}' != ''    Enter Emergency Contact Mobile    ${ec_mobile}

    Run Keyword If    '${ihi1}' != ''    Enter Full IHI Number    ${ihi1}    ${ihi2}    ${ihi3}

    Click Save

    Run Keyword If    '${expected_message}' == 'Record added successfully'
...    Success Alert Should Be    ${expected_message}
...    ELSE
...    Error Alert Should Be    ${expected_message}