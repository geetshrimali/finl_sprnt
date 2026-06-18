*** Settings ***
Resource  ../../resources/keywords/common_resources.robot
Resource  ../../resources/pages/transfer_funds.robot

Suite Setup  Load Environment
Test Setup  open app
Test Teardown  close app

*** Test Cases ***
TC_UI_06A Validate Zero Amount Transfer
    [Documentation]  Validate transfer funds with zero amount
    [Tags]  ui negative
    login    ${USER_ID}    ${USER_PWD}

    Transfer Funds    0

    Page Should Contain    Transfer Complete!