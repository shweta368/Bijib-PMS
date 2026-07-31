# *** Settings ***
# Library    DataDriver    file=../data/add_patient_data.csv    dialect=excel
# Resource    ../variables/Common.robot
# Resource    ../pages/add_patient_page.robot
# Resource    ../pages/status_label_page.robot

# Suite Setup    Open Add Patient Slide
# Suite Teardown    Close Browser Keyword
# Test Template    Validate Add Patient Flow

# *** Test Cases ***
# Add Patient Validation

# *** Keywords ***
# # Validate Add Patient Flow
#     [Arguments]       
#     ...    ${title}    ${first_name}    ${last_name}    ${gender}
#     ...    ${year}    ${month}    ${day}
#     ...    ${mobile_code}    ${mobile}    ${email}
#     ...    ${address}    ${suburb}    ${state}    ${postal}
#     ...    ${ec_name}    ${ec_gender}    ${ec_mobile_code}    ${ec_mobile}
#     ...    ${expected_message}




    # Run Keyword If    '${title}' != ''    Select Title    ${title}
    # Run Keyword If    '${first_name}' != ''    Enter First Name    ${first_name}
    # Run Keyword If    '${last_name}' != ''    Enter Last Name    ${last_name}
    # Run Keyword If    '${gender}' != ''    Select Gender    ${gender}
    # Run Keyword If    '${year}' != ''    Select Date Of Birth    ${year}    ${month}    ${day}
        

    # # Select Date Of Birth
    # # [Arguments]    ${year}    ${month}    ${day}



    # Log To Console    ✅ DOB Selected Successfully
    # Run Keyword If    '${mobile_code}' != ''    Select Mobile Code    ${mobile_code}
    # Run Keyword If    '${mobile}' != ''    Enter Mobile    ${mobile}
    # Run Keyword If    '${email}' != ''    Enter Email    ${email}
    # Run Keyword If    '${address}' != ''    Enter Address    ${address}
    # Run Keyword If    '${suburb}' != ''    Enter Suburb    ${suburb}
    # Run Keyword If    '${state}' != ''    Enter State    ${state}
    # Run Keyword If    '${postal}' != ''    Enter Postal Code    ${postal}

    # Run Keyword If    '${ec_name}' != ''    Enter Emergency Contact Name    ${ec_name}
    # Run Keyword If    '${ec_gender}' != ''    Select Emergency Contact Gender    ${ec_gender}
    # Run Keyword If    '${ec_mobile_code}' != ''    Select Mobile Code    ${ec_mobile_code}    2
    # Run Keyword If    '${ec_mobile}' != ''    Enter Emergency Contact Mobile    ${ec_mobile}

    # # Run Keyword If    '${ihi1}' != ''    Enter Full IHI Number    ${ihi1}    ${ihi2}    ${ihi3}
    # # Set Selenium Speed    0.3s

    # Click Save

    # IF    '${expected_message}' == 'Record added successfully'
    #     Success Alert Should Be    ${expected_message}
    # ELSE
    #     Error Alert Should Be    ${expected_message}
    # END
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
    ...    ${address}    ${suburb}    ${state}    ${postal}
    ...    ${ec_name}    ${ec_gender}    ${ec_mobile_code}    ${ec_mobile}
    ...    ${expected_message}


    IF    '${title}' != ''
        Select Title    ${title}
    END

    IF    '${first_name}' != ''
        Enter First Name    ${first_name}
    END

    IF    '${last_name}' != ''
        Enter Last Name    ${last_name}
    END

    IF    '${gender}' != ''
        Select Gender    ${gender}
    END

   IF    '${year}' != '' and '${month}' != '' and '${day}' != ''
  Select Date Of Birth    ${year}    ${month}    ${day}
   END

    IF    '${mobile_code}' != ''
        Select Mobile Code    ${mobile_code}
    END

    IF    '${mobile}' != ''
        Enter Mobile    ${mobile}
    END
    sleep    5s

    IF    '${email}' != ''
        Enter Email    ${email}
   END

   IF    '${address}' != ''
        Enter Address    ${address}
   END

   IF    '${suburb}' != ''
        Enter Suburb    ${suburb}
   END

   IF    '${state}' != ''
        Enter State    ${state}
   END

   IF    '${postal}' != ''
        Enter Postal Code    ${postal}
   END

   IF    '${ec_name}' != ''
        Enter Emergency Contact Name    ${ec_name}
   END

   IF    '${ec_gender}' != ''
        Select Emergency Contact Gender    ${ec_gender}
   END

   IF    '${ec_mobile_code}' != ''
        Select Mobile Code    ${ec_mobile_code}    2
   END

    IF    '${ec_mobile}' != ''
        Enter Emergency Contact Mobile    ${ec_mobile}
    END

${minor}=    Is Patient Minor

IF    ${minor}
    ${claimant_visible}=    Check Is Claimant Details Is Exists

    IF    ${claimant_visible}

        IF    '${claimant_family_name}' != ''
            Enter Family Name    ${claimant_family_name}
        END

        IF    '${claimant_given_name}' != ''
            Enter Given Name    ${claimant_given_name}
        END

        IF    '${claimant_gender}' != ''
            Select Claimant Gender    ${claimant_gender}
        END

        IF    '${claimant_medicare}' != ''
            Enter Medicare Number    ${claimant_medicare}
        END

        IF    '${claimant_irn}' != ''
            Enter Medicare IRN Number    ${claimant_irn}
        END

    END
END

    Click Save

    IF    '${expected_message}' == 'Patient registered successfully'
    Success Alert Should Be    ${expected_message}
   ELSE
    Error Alert Should Be    ${expected_message}
   END