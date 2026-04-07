*** Settings ***
Library    SeleniumLibrary
Resource    ../../variables/Common.robot

*** Keywords ***
Select Value From Autocomplete By Label
    [Arguments]    ${label}    ${value}    ${label_index}=1

    # Locate the specific autocomplete component by label + index
    ${component_xpath}=    Set Variable    (//lib-autocomplete[.//label[normalize-space()='${label}']])[${label_index}]

    ${input_xpath}=    Set Variable    ${component_xpath}//input

    ${options_xpath}=    Set Variable    ${component_xpath}//div[contains(@class,'row-layout-ac-data')]//div[contains(@class,'cursor-pointer')]

    Wait Until Element Is Visible    ${input_xpath}    10s
    Click Element                   ${input_xpath}
    Clear Element Text              ${input_xpath}
    Input Text                      ${input_xpath}    ${value}

    # Wait for dropdown inside same component
    Wait Until Element Is Visible    ${options_xpath}    10s

    # Select first option (or customize if needed)
    Click Element    (${options_xpath})[1]