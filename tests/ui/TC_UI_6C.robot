*** Settings ***
Resource  ../../resources/keywords/common_resources.robot
Resource  ../../resources/pages/transfer_funds.robot
Resource  ../../resources/pages/open_account.robot

Suite Setup  Load Environment
Test Setup  open app
Test Teardown  Save Screenshot

*** Test Cases ***
TC_UI_6C Validate Transfer Funds with Insufficient Balance
    [Documentation]  Validate transfer funds with insufficient balance(FAIL)
    [Tags]  ui negative

    login  ${USER_ID}  ${USER_PWD}
    Log  Logged in successfully
    ${new_account}=    Create Account    SAVINGS
    Transfer Funds A  ${ACCOUNT_ID}  ${new_account}  50000000919
    Wait Until Element Is Visible    ${Amount_result}
    Page Should Contain    Transfer Incomplete!