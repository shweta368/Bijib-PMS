*** Settings ***
Resource    ../variables/Common.robot
Resource    ../pages/add_patient_page.robot
Resource    ../pages/status_label_page.robot

Suite Setup    Open Add Patient Slide
Suite Teardown    Close Browser Keyword

*** Variables ***
${is_ihi_mandatory}    False

*** Test Cases ***
Validate Title Is Mandatory
    Select Title    Select
    Click Save
    Error Alert Should Be    Please select Title

Validate First Name Is Mandatory
    Select Title    Ms
    Click Save
    Error Alert Should Be    Please enter First Name

Validate First Name Allows Only Alphabets
    Enter First Name   sharu123
    Click Save
    Error Alert Should Be    First Name allows alphabets only

Validate Last Name Is Mandatory
    Enter First Name    likitha
    Click Save
    Error Alert Should Be    Please enter Last Name

Validate Last Name Allows Only Alphabets
    Enter Last Name    margoni234
    Click Save
    Error Alert Should Be    Last Name allows alphabets only

Validate Gender Is Mandatory
    Enter Last Name    Margoni
    Click Save
    Error Alert Should Be    Please Select Gender

Validate Date of Birth Is Mandatory
    Select Gender    Female
    Click Save
    Error Alert Should Be    Please enter Date of Birth

Validate Mobile Number Is Mandatory
    Select Date Of Birth    1998    Feb    05
    Click Save
    Error Alert Should Be    Please enter Mobile Number

Validate Mobile Number Is Valid
    Enter Mobile    abc15
    Click Save
    Error Alert Should Be    Mobile Number Must be Number

Validate Mobile Number Is 10 Digits
    Enter Mobile    984960160258
    Click Save
    Error Alert Should Be    Mobile Number Must be 10 digits

Validate Email Is Mandatory
    Enter Mobile    9849601605
    Click Save
    Error Alert Should Be    Please enter Email

Validate Email Is Valid
    Enter Email    bijibtrack@bjbsoft
    Click Save
    Error Alert Should Be    Please enter valid Email

#Address Details
Validate Address Is Mandatory
    Enter Email    bijibsoft@bjbsoft.com
    Click Save
    Error Alert Should Be    Please enter address

Validate Suburb Is Mandatory
    Enter Address   jubilee hills
    Click Save
    Error Alert Should Be   Please enter suburb

Validate State Is Mandatory
    Enter Suburb    Hyderabad
    Click Save
    Error Alert Should Be   Please enter state

Validate Country Is Mandatory
    Enter State    Telangana
    Click Save
    Error Alert Should Be   Please enter country

Validate Postal Code Is Mandatory
    Enter Country    India
    Click Save
    Error Alert Should Be   Please enter postal code
    

# EmergencyContact
Validate Emergency Contact Name Is Mandatory
    Enter Postal Code    500032
    Click Save
    Error Alert Should Be    Please enter Emergency Contact Person Name

Validate Emergency Contact Gender Is Mandatory
    Enter Emergency Contact Name    EmergencyContact
    Click Save
    Error Alert Should Be    Please select Gender

Validate Emergency Contact Mobile Number Is Mandatory
    Select Emergency Contact Gender    Male
    Click Save
    Error Alert Should Be    Please enter Emergency Contact Mobile Number

Validate Emergency Contact Mobile Number Is Number
    Enter Emergency Contact Mobile    abcg
    Click Save
    Error Alert Should Be    Emergency Contact Mobile Number Must be Number

Validate Emergency Contact Mobile Number Must be 10 Digits
    Enter Emergency Contact Mobile    987654111
    Click Save
    Error Alert Should Be    Emergency Contact Mobile Number Must be 10 digits

Set IHI Mandatory Variable
    ${result}=    Is IHI Number Mandatory
    Set Global Variable    ${is_ihi_mandatory}    ${result}

Validate IHI Number
    Enter Emergency Contact Mobile    3698520145
    Log To Console    is_ihi_mandatory: ${is_ihi_mandatory}
    IF    ${is_ihi_mandatory}
        Enter Full IHI Number    12    1234    3333
        Click Save
        Error Alert Should Be    IHI Number Must be 16 digits
    END

Validate Add New Patient Successfully
    IF    ${is_ihi_mandatory}
        Enter Full IHI Number    12    1234    3333
    END
    Click Save
    Success Alert Should Be    Record added successfully