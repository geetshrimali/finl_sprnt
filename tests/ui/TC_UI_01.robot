*** Settings ***
Resource  ../../resources/keywords/common_resources.robot
Resource  ../../resources/pages/open_account.robot
Resource  ../../resources/keywords/api_keywords.robot

Suite Setup  Load Environment
Test Setup  open app
Test Teardown  close app

*** Test Cases ***
TC_UI_01 Create Savings Account
    [Documentation]  Create Savings Account
    [Tags]  ui

    login    ${USER_ID}    ${USER_PWD}
    Create Account  SAVINGS
