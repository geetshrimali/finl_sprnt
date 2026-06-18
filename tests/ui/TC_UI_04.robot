*** Settings ***
Resource  ../../resources/keywords/common_resources.robot
Resource  ../../resources/pages/transfer_funds.robot

Suite Setup  Load Environment
Test Setup  open app
Test Teardown  close app

*** Test Cases ***
TC_UI_04 Verify Transfer Funds
    [Documentation]  Verify transfer funds functionality
    [Tags]  ui

    login    ${USER_ID}  ${USER_PWD}
    Log    logged in successfully

    Transfer Funds  500
    Log    transfer funds successful
