*** Settings ***
Resource  ../../resources/keywords/common_resources.robot
Resource  ../../resources/pages/transfer_funds.robot
Resource  ../../resources/pages/open_account.robot

Suite Setup  Load Environment
Test Setup  open app
Test Teardown  close app

*** Test Cases ***
TC_UI_06B Validate Negative Amount Transfer
    [Documentation]  Validate transfer funds with negative amount
    [Tags]  ui negative

    login  ${USER_ID}  ${USER_PWD}
    Log  Logged in successfully
    Clear Database
    Create Account    SAVINGS
    Sleep    1
    Transfer Funds A  {${ACCOUNT_ID}  {${NEW_ACCOUNT_ID}  -500
    Log  Transfer funds completed successfully

    Page Should Contain    Transfer Incomplete!