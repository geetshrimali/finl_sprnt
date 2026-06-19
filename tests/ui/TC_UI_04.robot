*** Settings ***
Resource  ../../resources/keywords/common_resources.robot
Resource  ../../resources/pages/transfer_funds.robot
Resource  ../../variables/ui_variables.robot
Resource    ../../resources/pages/open_account.robot

Suite Setup  Load Environment
Test Setup  open app
Test Teardown  close app

*** Test Cases ***
TC_UI_04 Transfer Funds
    [Documentation]  Verify transfer funds functionality
    [Tags]  ui

    login    ${USER_ID}  ${USER_PWD}
    Log    logged in successfully
    Create Account    SAVINGS
    Sleep    1
    Transfer Funds A  ${ACCOUNT_ID}  ${NEW_ACCOUNT_ID}  500
    Log    transfer funds successful
