*** Settings ***
Library    SeleniumLibrary
Library    String
Library    DateTime

Resource    ../resources/Common.robot
Resource    ../resources/PageSelect.robot

*** Variables ***
${ADD_PATIENT_BTN}    Add Patient
${SAVE_BTN}    Save

*** Keywords ***
Open Add Patient Slide
    Open Browser Login And Goto Dashboard
    Page Selection    fa-grid-2 fa-light    Register Patient
    Log to Console    Navigated to Patient Creation Page
    
    Button Click    ${ADD_PATIENT_BTN}

Click Save
    Button Click    ${SAVE_BTN}

# --- Patient Details ---
Select Title
    [Arguments]    ${title}
    Dropdown With Label    Title    ${title}

Enter First Name
    [Arguments]    ${first_name}
    Textfield With Label    First Name    ${first_name}

Enter Last Name
    [Arguments]    ${last_name}
    Textfield With Label    Last Name    ${last_name}

Select Gender
    [Arguments]    ${gender}    ${index}=1
    Dropdown With Label    Gender    ${gender}    ${index}

Select Date Of Birth
    [Arguments]    ${year}    ${month}    ${day}
    Select Date With Label    Date of Birth    ${year}    ${month}    ${day}

Enter Mobile
    [Arguments]    ${mobile}    ${index}=1
    Textfield With Label    Mobile    ${mobile}    ${index}

Enter Email
    [Arguments]    ${email}    ${index}=1
    Textfield With Label    Email    ${email}    ${index}

Enter Entitlement Number
    [Arguments]    ${entitlement}
    Textfield With Label    Entitlement Number    ${entitlement}

Enter Racf Id
    [Arguments]    ${racf}
    Textfield With Label    Racf Id    ${racf}

Enter Address
    [Arguments]    ${address}
    Textfield With Label    Address    ${address}

Enter City
    [Arguments]    ${city}
    Textfield With Label    City    ${city}

Enter Suburb
    [Arguments]    ${suburb}
    Textfield With Label    Suburb    ${suburb}

Enter State
    [Arguments]    ${state}
    Textfield With Label    State    ${state}

Enter Country
    [Arguments]    ${country}
    Textfield With Label    Country    ${country}

Enter Postal Code
    [Arguments]    ${postal_code}
    Textfield With Label    Postal Code    ${postal_code}

# --- Emergency Contact Details ---
Enter Emergency Contact Name
    [Arguments]    ${name}
    Textfield With Label    Name    ${name}

Select Emergency Contact Gender
    [Arguments]    ${gender}    ${index}=2
    Dropdown With Label    Gender    ${gender}    ${index}

Enter Emergency Contact Mobile
    [Arguments]    ${mobile}    ${index}=2
    Textfield With Label    Mobile    ${mobile}    ${index}

Enter Emergency Contact Email
    [Arguments]    ${email}    ${index}=2
    Textfield With Label    Email    ${email}    ${index}

# --- IHI Register Number ---
Enter Full IHI Number
    [Arguments]    ${part1}    ${part2}    ${part3}
    Enter IHI Number Part    ${part1}    1
    Enter IHI Number Part    ${part2}    2
    Enter IHI Number Part    ${part3}    3

Enter IHI Number Part
    [Arguments]    ${part}    ${index}
    ${IHI_INPUT}=    Set Variable    //p[text()[contains(., "Patient IHI Number")]]/following-sibling::div//input
    Textfield With Path    ${IHI_INPUT}    ${part}    ${index}

# Check Mandatory
Is IHI Number Mandatory
    ${IHI_LABEL_PATH}=    Set Variable    //lib-ihi-number/div/p[normalize-space(text())="Patient IHI Number"]
    ${mandatory}=    Is Field Mandatory With Path    ${IHI_LABEL_PATH}
    RETURN    ${mandatory}

# Claimantdetails
Is Patient Minor
    ${dob}=    Get Value From Datepicker With Label    Date of Birth
    ${parts}=    Split String    ${dob}    /
    ${day}=      Convert To Integer    ${parts}[0]
    ${month}=    Convert To Integer    ${parts}[1]
    ${year}=     Convert To Integer    ${parts}[2]

    ${today}=    Get Current Date    result_format=%Y-%m-%d
    ${tparts}=   Split String    ${today}    -
    ${c_year}=   Convert To Integer    ${tparts}[0]
    ${c_month}=  Convert To Integer    ${tparts}[1]
    ${c_day}=    Convert To Integer    ${tparts}[2]

    ${age}=    Evaluate    ${c_year} - ${year}

    IF    ${c_month} < ${month} or (${c_month} == ${month} and ${c_day} < ${day})
        ${age}=    Evaluate    ${age} - 1
    END

    ${is_minor}=    Evaluate    ${age} < 18
    RETURN    ${is_minor}

Check Is Claimant Details Is Exists
    ${exists}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible
    ...    //h2[contains(@class,"card-title-text")][normalize-space(.)="Claimant Details"]
    ...    5s

Enter Family Name
    [Arguments]    ${family_name}
    Textfield With Label    Family Name    ${family_name}

Enter Given Name
    [Arguments]    ${given_name}
    Textfield With Label    Given Name    ${given_name}

Select Claimant Gender
    [Arguments]    ${gender}    ${index}=2
    Dropdown With Label    Gender    ${gender}    ${index}

Enter Medicare Number
    [Arguments]    ${medicare_name}
    Textfield With Label    Medicare Number    ${medicare_name}

Enter Medicare IRN Number
    [Arguments]    ${medicare_irn_name}
    Textfield With Label    Medicare IRN Number    ${medicare_irn_name}
