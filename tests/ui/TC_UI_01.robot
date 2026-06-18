*** Settings ***
Resource  ../../resources/keywords/common_resources.robot
Resource  ../../resources/pages/open_account.robot

Suite Setup  Load Environment
Test Setup  open app
Test Teardown  close app

*** Test Cases ***
TC-UI-01 Create Savings Account
    [Documentation]  Create Savings Account
    [Tags]  ui

    login    ${USER_ID}    ${USER_PWD}
    Create Account  SAVINGS
