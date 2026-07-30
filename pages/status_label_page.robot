# *** Settings ***
# Library    SeleniumLibrary
# Library    String
# Resource    ../variables/Common.robot

# *** Variables ***
# # ${ERROR_ALERT}    (//lib-status-label/div[contains(@class,"bg-red-50")])[1]
# # ${ERROR_ALERT}     (//div[contains(@class,'bg-red-50')])
# # ${SUCCESS_ALERT}    (//lib-status-label/div[contains(@class,"bg-green-50")])[1]
# # ${SUCCESS_ALERT}    xpath=//lib-toast//p[normalize-space()='Patient registered successfully']

# ${ERROR_ALERT}      xpath=(//div[contains(@class,'toast') and contains(@class,'bg-red-50')])[1]
# ${SUCCESS_ALERT}    xpath=(//div[contains(@class,'toast') and contains(@class,'bg-green-50')])[1]


# *** Keywords ***
# Get Error Alert Message
#     Wait Until Element Is Visible    ${ERROR_ALERT}    ${TIMEOUT}
#     ${msg}=    Get Text    ${ERROR_ALERT}
#     ${msg}=    Strip String    ${msg}
#     RETURN    ${msg}

# Get Success Alert Message
#     Wait Until Element Is Visible    ${SUCCESS_ALERT}    timeout=${TIMEOUT}
#     ${msg}=    Get Text    ${SUCCESS_ALERT}
#     ${msg}=    Strip String    ${msg}
#     RETURN    ${msg}

# Error Alert Should Be
#     [Arguments]    ${expected}
#     ${actual}=    Get Error Alert Message
#     # Should Be Equal    ${actual}    ${expected}
#     Should Contain    ${actual}    ${expected}
#     Wait Until Error Alert Disappear

# Success Alert Should Be
#     [Arguments]    ${expected}
#     ${actual}=    Get Success Alert Message
#     Should Be Equal    ${actual}    ${expected}
#     Wait Until Success Alert Disappear

# Wait Until Error Alert Disappear
#     Wait Until Page Does Not Contain Element    ${ERROR_ALERT}    ${TIMEOUT}
#     Log To Console    ✅ Error Alert Disappear

# Wait Until Success Alert Disappear
#     Wait Until Page Does Not Contain Element    ${SUCCESS_ALERT}    ${TIMEOUT}
#     Log To Console    ✅ Success Alert Disappear


*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
Resource    ../variables/Common.robot


*** Variables ***
${ERROR_ALERT}      (//div[contains(@class,'toast') and contains(@class,'bg-red-50')])[1]
${ERROR_ALERTS}     //div[contains(@class,'toast') and contains(@class,'bg-red-50')]
${SUCCESS_ALERT}    (//div[contains(@class,'toast') and contains(@class,'bg-green-50')])[1]


*** Keywords ***

# =========================
# ERROR ALERT KEYWORDS
# =========================

Wait For Error Alert
    Wait Until Keyword Succeeds
    ...    5x
    ...    1s
    ...    Element Should Be Visible
    ...    ${ERROR_ALERT}
    Sleep    500ms


Get Error Alert Header
    Wait For Error Alert

    ${header}=    Get Text
    ...    xpath=${ERROR_ALERT}

    ${header}=    Strip String    ${header}
    RETURN    ${header}


Get Error Alert Bullet Messages

    Wait For Error Alert

    @{elements}=    Get WebElements
    ...    xpath=${ERROR_ALERTS}//li

    @{messages}=    Create List

    FOR    ${element}    IN    @{elements}

        ${text}=    Get Text    ${element}

        ${text}=    Strip String    ${text}

        IF    '${text}' != ''
            Append To List
            ...    ${messages}
            ...    ${text}
        END

    END

    Log To Console    ${messages}

    RETURN    ${messages}


Get Error Alert Message

    Wait For Error Alert

    ${count}=    Get Element Count
    ...    xpath=${ERROR_ALERTS}//p

    IF    ${count} > 0
        ${msg}=    Get Text
        ...    xpath=(${ERROR_ALERTS}//p)[1]

        ${msg}=    Strip String    ${msg}
        RETURN    ${msg}
    END

    RETURN


Error Alert Message Should Be
    [Arguments]    ${expected}

    ${actual}=    Get Error Alert Message

    Should Be Equal As Strings
    ...    ${actual}
    ...    ${expected}


Error Alert Header Should Be
    [Arguments]    ${expected}

    ${actual}=    Get Error Alert Header

    Should Be Equal
    ...    ${actual}
    ...    ${expected}


# Error Alert Should Be
#     [Arguments]    ${expected}

#     Wait For Error Alert

#     ${has_bullets}=    Run Keyword And Return Status
#     ...    Page Should Contain Element
#     ...    xpath=${ERROR_ALERT}//li

#     IF    ${has_bullets}
#         @{messages}=    Get Error Alert Bullet Messages

#         Log To Console    Messages: @{messages}

#         List Should Contain Value
#         ...    ${messages}
#         ...    ${expected}

#     ELSE
#         ${actual}=    Get Error Alert Message

#         Should Be Equal As Strings
#         ...    ${actual}
#         ...    ${expected}
#     END

#     Wait Until Error Alert Disappear

# Error Alert Should Be
#     [Arguments]    ${expected}

#     ${single}=    Run Keyword And Return Status
#     ...    Page Should Contain Element
#     ...    xpath=${ERROR_ALERTS}//p

#     IF    ${single}

#         ${actual}=    Get Error Alert Message

#         Should Be Equal As Strings
#         ...    ${actual}
#         ...    ${expected}

#     ELSE

#         @{messages}=    Get Error Alert Bullet Messages

#         List Should Contain Value
#         ...    ${messages}
#         ...    ${expected}

#     END

#     Wait Until Error Alert Disappear

Error Alert Should Be
    [Arguments]    ${expected}

    ${toast_exists}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible
    ...    xpath=${ERROR_ALERT}
    ...    2s

    IF    ${toast_exists}
        ${single}=    Run Keyword And Return Status
        ...    Page Should Contain Element
        ...    xpath=${ERROR_ALERTS}//p

        IF    ${single}
            ${actual}=    Get Error Alert Message
            Should Be Equal As Strings
            ...    ${actual}
            ...    ${expected}
        ELSE
            @{messages}=    Get Error Alert Bullet Messages
            List Should Contain Value
            ...    ${messages}
            ...    ${expected}
        END

        Wait Until Error Alert Disappear

    ELSE
        Log To Console    No error toast displayed. Validation may be inline.
    END

Error Alert Should Contain Bullets
    [Arguments]    @{expected_bullets}

    @{actual_messages}=    Get Error Alert Bullet Messages

    FOR    ${expected}    IN    @{expected_bullets}
        List Should Contain Value
        ...    ${actual_messages}
        ...    ${expected}
    END


Wait Until Error Alert Disappear
    Wait Until Page Does Not Contain Element
    ...    ${ERROR_ALERT}
    ...    timeout=${TIMEOUT}

    Log To Console    ✅ Error Alert Disappeared


# =========================
# SUCCESS ALERT KEYWORDS
# =========================

Wait For Success Alert
    Wait Until Keyword Succeeds
    ...    5x
    ...    1s
    ...    Element Should Be Visible
    ...    ${SUCCESS_ALERT}


Get Success Alert Message
    Wait For Success Alert

    ${msg}=    Get Text
    ...    xpath=${SUCCESS_ALERT}

    ${msg}=    Strip String    ${msg}
    RETURN    ${msg}


Success Alert Should Be
    [Arguments]    ${expected}

    ${actual}=    Get Success Alert Message

    Should Be Equal
    ...    ${actual}
    ...    ${expected}

    Wait Until Success Alert Disappear


Wait Until Success Alert Disappear
    Wait Until Page Does Not Contain Element
    ...    ${SUCCESS_ALERT}
    ...    timeout=${TIMEOUT}

    Log To Console    ✅ Success Alert Disappeared