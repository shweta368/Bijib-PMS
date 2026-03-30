*** Settings ***

Resource    ../../variables/Common.robot
Resource    ../../resources/Common.robot
Resource    ../../pages/add_patient_page.robot
Resource    ../../pages/status_label_page.robot

Suite Setup    Open Add Patient Slide
Suite Teardown   Close Browser Keyword

*** Variables ***

*** Test Cases ***
Validate Claimant Details
    Select Title    Ms
    Enter First Name    shalini
    Enter Last Name    kaif
    Select Gender    Female
    Select Date Of Birth    2010    Jan    02
    Select Mobile Code    IN
    Enter Mobile    9698520188
    Enter Email    shalini@gmail.com
    Enter Address    punjagutta
    Enter Suburb    Hyderabad    
    Enter State    Telangana
    Enter Country    India
    Enter Postal Code    500036
    ${IsMinor}    Is Patient Minor
    ${IsClaimantDetailsExists}    Set Variable    ${False}

    IF    ${IsMinor}
        ${IsClaimantDetailsExists}    Run Keyword And Return Status
        ...    Check Is Claimant Details Is Exists
    END

    IF    ${IsMinor} and not ${IsClaimantDetailsExists}
        Fail    Claimant details are missing for a minor patient
    END


Validate Claimant Family Name Is Mandatory
    Click Save
    Error Alert Should Be    Please enter Claimant Family Name

Validate Claimant Given Name Is Mandatory
    Enter Family Name    meshram
    Click Save
    Error Alert Should Be      Please enter Claimant Given Name

Validate Claimant Gender Is Mandatory
    Enter Given Name    suresh    
    Click Save
    Error Alert Should Be      Please select Claimant Gender

Validate Claimant Medicare Number Is Mandatory
    Select Claimant Gender    Male   
    Click Save
    Error Alert Should Be      Please enter Claimant Medicare Number

Validate Claimant Medicare IRN Is Mandatory
    Enter Medicare Number    2950355733
    Click Save
    Error Alert Should Be    Invalid Claimant Medicare Number