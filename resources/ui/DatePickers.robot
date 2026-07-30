# *** Settings ***
# Library    SeleniumLibrary
# Resource    ../../variables/Common.robot

# *** Keywords ***
# Select Date With Label
#     [Arguments]    ${LABEL}    ${YEAR}    ${MONTH}    ${DAY}

#     # Base paths
#     ${BASE_PATH}=    Set Variable    //lib-datepicker//label[normalize-space(text())='${LABEL}']/following::
#     ${DP_POPUP_PATH}=    Set Variable    (${BASE_PATH}div/div)[2]

#     # Scroll date picker into view
#     Scroll Element Into View    xpath=${BASE_PATH}div/input

#     # Open date picker
#     Wait Until Element Is Visible    xpath=${BASE_PATH}div/input    ${TIMEOUT}
#     Click Element    xpath=${BASE_PATH}div/input

#     # Open year selection
#     Wait Until Element Is Visible    xpath=(${DP_POPUP_PATH}/div/div/div/span)[2]   ${TIMEOUT}
#     Click Element    xpath=(${DP_POPUP_PATH}/div/div/div/span)[2]

#     # Navigate to correct year range dynamically
#     # FOR    ${INDEX}    IN RANGE    50
#     #     ${CURRENT_YEARS_TEXT}=    Get Text    xpath=(${DP_POPUP_PATH}/div)[1]/div
#     #     ${START_YEAR}=    Evaluate    int("${CURRENT_YEARS_TEXT}".split("-")[0].strip())
#     #     ${END_YEAR}=      Evaluate    int("${CURRENT_YEARS_TEXT}".split("-")[1].strip())
    
#     #     Run Keyword If    ${YEAR} >= ${START_YEAR} and ${YEAR} <= ${END_YEAR}    Exit For Loop
#     #     Run Keyword If    ${YEAR} < ${START_YEAR}    Click Back Year    ${DP_POPUP_PATH}
#     #     Run Keyword If    ${YEAR} > ${END_YEAR}    Click Forward Year    ${DP_POPUP_PATH}
    
#     #     Sleep    0.5s
#     # END

#     FOR    ${INDEX}    IN RANGE    50

#     Wait Until Keyword Succeeds
#     ...    5s
#     ...    200ms
#     ...    Element Should Be Visible
#     ...    xpath=(${DP_POPUP_PATH}/div)[1]/div

#     ${CURRENT_YEARS_TEXT}=    Get Text
#     ...    xpath=(${DP_POPUP_PATH}/div)[1]/div

#     ${START_YEAR}=    Evaluate    int("${CURRENT_YEARS_TEXT}".split("-")[0].strip())
#     ${END_YEAR}=      Evaluate    int("${CURRENT_YEARS_TEXT}".split("-")[1].strip())

#     Exit For Loop If
#     ...    ${YEAR} >= ${START_YEAR} and ${YEAR} <= ${END_YEAR}

#     IF    ${YEAR} < ${START_YEAR}
#         Click Back Year    ${DP_POPUP_PATH}
#     ELSE
#         Click Forward Year    ${DP_POPUP_PATH}
#     END

#     Wait Until Keyword Succeeds
#     ...    5s
#     ...    200ms
#     ...    Element Should Be Visible
#     ...    xpath=(${DP_POPUP_PATH}/div)[1]/div

# END


#     # Click the year
#     Wait Until Element Is Visible    xpath=(${DP_POPUP_PATH}/div)[2]/div[normalize-space(.)="${YEAR}"]   ${TIMEOUT}
#     # Click Element    xpath=(${DP_POPUP_PATH}/div)[2]/div[normalize-space(.)="${YEAR}"]
#     Wait Until Keyword Succeeds
# ...    5s
# ...    200ms
# ...    Click Element
# ...    xpath=(${DP_POPUP_PATH}/div)[2]/div[normalize-space(.)="${YEAR}"]
    
#     # Open month selection
#     Wait Until Element Is Visible    xpath=(${DP_POPUP_PATH}/div/div/div/span)[1]   ${TIMEOUT}
#     Click Element    xpath=(${DP_POPUP_PATH}/div/div/div/span)[1]

#     # Click the month
#     Wait Until Element Is Visible    xpath=(${DP_POPUP_PATH}/div)/div[normalize-space(.)="${MONTH}"]   ${TIMEOUT}
#     Click Element    xpath=(${DP_POPUP_PATH}/div)/div[normalize-space(.)="${MONTH}"]
    
#     # Click the day
#     Wait Until Element Is Visible    xpath=(${DP_POPUP_PATH}/div)[3]/button/time[normalize-space(.)="${DAY}"]   ${TIMEOUT}
#     Click Element    xpath=(${DP_POPUP_PATH}/div)[3]/button/time[normalize-space(.)="${DAY}"]


# #---------------- Helper Keywords ----------------#

# # Click Back Year
# #     [Arguments]    ${DP_POPUP_PATH}
# #     Wait Until Element Is Visible    xpath=${DP_POPUP_PATH}/div/button/i[contains(@class,"fa-angle-left")]   ${TIMEOUT}
# #     Click Element    xpath=${DP_POPUP_PATH}/div/button/i[contains(@class,"fa-angle-left")]

# Click Back Year
#     [Arguments]    ${DP_POPUP_PATH}

#     Wait Until Keyword Succeeds
#     ...    5s
#     ...    200ms
#     ...    Click Element
#     ...    xpath=${DP_POPUP_PATH}/div/button/i[contains(@class,"fa-angle-left")]

#     Sleep    300ms

# # Click Forward Year
# #     [Arguments]    ${DP_POPUP_PATH}
# #     Wait Until Element Is Visible    xpath=${DP_POPUP_PATH}/div/button/i[contains(@class,"fa-angle-right")]   ${TIMEOUT}
# #     Click Element    xpath=${DP_POPUP_PATH}/div/button/i[contains(@class,"fa-angle-right")]

# Click Forward Year
#     [Arguments]    ${DP_POPUP_PATH}

#     Wait Until Keyword Succeeds
#     ...    5s
#     ...    200ms
#     ...    Click Element
#     ...    xpath=${DP_POPUP_PATH}/div/button/i[contains(@class,"fa-angle-right")]

#     Sleep    300ms

# Get Value From Datepicker With Label
#     [Arguments]    ${Label}
#     ${value}=    Get Value    xpath=//lib-datepicker/div/div/div[label[text()="${LABEL}"]]/following-sibling::div/input
#     RETURN    ${value}

*** Settings ***
Library    SeleniumLibrary
Resource    ../../variables/Common.robot

*** Keywords ***
Select Date With Label
    [Arguments]    ${LABEL}    ${YEAR}    ${MONTH}    ${DAY}

    ${BASE_PATH}=    Set Variable
    ...    //lib-datepicker//label[normalize-space(.)='${LABEL}']/following::

    ${DP_POPUP_PATH}=    Set Variable
    ...    (${BASE_PATH}div/div)[2]

    Scroll Element Into View
    ...    xpath=${BASE_PATH}div/input

    Wait Until Element Is Visible
    ...    xpath=${BASE_PATH}div/input
    ...    ${TIMEOUT}

    Click Element
    ...    xpath=${BASE_PATH}div/input

    Wait Until Element Is Visible
    ...    xpath=(${DP_POPUP_PATH}/div/div/div/span)[2]
    ...    ${TIMEOUT}

    Wait Until Keyword Succeeds
    ...    5s
    ...    300ms
    ...    Click Element
    ...    xpath=(${DP_POPUP_PATH}/div/div/div/span)[2]

    FOR    ${INDEX}    IN RANGE    50

        Wait Until Keyword Succeeds
        ...    5s
        ...    300ms
        ...    Element Should Be Visible
        ...    xpath=(${DP_POPUP_PATH}/div)[1]/div

        ${CURRENT_YEARS_TEXT}=    Wait Until Keyword Succeeds
        ...    5s
        ...    300ms
        ...    Get Text
        ...    xpath=(${DP_POPUP_PATH}/div)[1]/div

        ${START_YEAR}=    Evaluate
        ...    int("${CURRENT_YEARS_TEXT}".split("-")[0].strip())

        ${END_YEAR}=    Evaluate
        ...    int("${CURRENT_YEARS_TEXT}".split("-")[1].strip())

        Exit For Loop If
        ...    ${YEAR} >= ${START_YEAR} and ${YEAR} <= ${END_YEAR}

        IF    ${YEAR} < ${START_YEAR}

            Wait Until Keyword Succeeds
            ...    5s
            ...    300ms
            ...    Click Element
            ...    xpath=${DP_POPUP_PATH}/div/button/i[contains(@class,'fa-angle-left')]

        ELSE

            Wait Until Keyword Succeeds
            ...    5s
            ...    300ms
            ...    Click Element
            ...    xpath=${DP_POPUP_PATH}/div/button/i[contains(@class,'fa-angle-right')]

        END

        Sleep    300ms

    END

    Wait Until Keyword Succeeds
    ...    5s
    ...    300ms
    ...    Click Element
    ...    xpath=(${DP_POPUP_PATH}/div)[2]/div[normalize-space(.)="${YEAR}"]

    Wait Until Element Is Visible
    ...    xpath=(${DP_POPUP_PATH}/div/div/div/span)[1]
    ...    ${TIMEOUT}

    Wait Until Keyword Succeeds
    ...    5s
    ...    300ms
    ...    Click Element
    ...    xpath=(${DP_POPUP_PATH}/div/div/div/span)[1]

    Wait Until Keyword Succeeds
    ...    5s
    ...    300ms
    ...    Click Element
    ...    xpath=(${DP_POPUP_PATH}/div)/div[normalize-space(.)="${MONTH}"]

    Wait Until Keyword Succeeds
    ...    5s
    ...    300ms
    ...    Click Element
    ...    xpath=(${DP_POPUP_PATH}/div)[3]/button/time[normalize-space(.)="${DAY}"]

Get Value From Datepicker With Label
    [Arguments]    ${LABEL}

    ${value}=    Get Value
    ...    xpath=//lib-datepicker/div/div/div[label[normalize-space(.)='${LABEL}']]/following-sibling::div/input

    RETURN    ${value}


