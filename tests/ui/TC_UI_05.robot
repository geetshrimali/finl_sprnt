*** Settings ***
Resource  ../../resources/keywords/common_resources.robot
Resource  ../../resources/pages/transfer_funds.robot

Suite Setup  Load Environment
Test Setup  open app
Test Teardown  close app

*** Test Cases ***
TC_UI_05 Validate Transfer Funds
    [Documentation]  Validate transfer details
    [Tags]  ui

    login  ${USER_ID}  ${USER_PWD}
    Log  Logged in successfully

    Transfer Funds  500
    Log  Transfer funds completed successfully

    Sleep    1

    Validate Transfer
    Log  Transfer validated
