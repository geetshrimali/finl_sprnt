*** Settings ***
Resource  ../../resources/keywords/common_resources.robot
Resource  ../../resources/pages/transfer_funds.robot

Suite Setup  Load Environment
Test Setup  open app
Test Teardown  close app

*** Test Cases ***
TC-UI-6A Validate Transfer Funds with Insufficient Balance
    [Documentation]  Validate transfer funds with insufficient balance
    [Tags]  ui negative

    login  ${USER_ID}  ${USER_PWD}
    Log  Logged in successfully

    Transfer Funds  50000000001
    Log  Transfer funds attempted with insufficient balance

    Page Should Contain    Transfer Complete!