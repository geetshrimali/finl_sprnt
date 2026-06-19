*** Settings ***
Resource  ../../resources/keywords/common_resources.robot
Resource  ../../resources/pages/transfer_funds.robot
Resource  ../../resources/pages/open_account.robot

Suite Setup  Load Environment
Test Setup  open app
Test Teardown  close app

*** Test Cases ***
TC_UI_05 Validate Transfer Funds
    [Documentation]  Validate transfer details
    [Tags]  ui

    login  ${USER_ID}  ${USER_PWD}
    Log  Logged in successfully
    Create Account    SAVINGS
    Sleep    1
    Transfer Funds A  ${ACCOUNT_ID}  ${NEW_ACCOUNT_ID}  500
    Log  Transfer funds completed successfully

    Sleep    1
    Clear Database
    Validate Transfer
    Log  Transfer validated
