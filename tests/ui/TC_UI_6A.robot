*** Settings ***
Resource  ../../resources/keywords/common_resources.robot
Resource  ../../resources/pages/transfer_funds.robot
Resource  ../../resources/pages/open_account.robot

Suite Setup  Load Environment
Test Setup  open app
Test Teardown  Save Screenshot

*** Test Cases ***
TC_UI_06A Validate Zero Amount Transfer
    [Documentation]  Validate transfer funds with zero amount(FAIL)
    [Tags]  ui negative
    login    ${USER_ID}    ${USER_PWD}

    ${new_account}=    Create Account    SAVINGS
    Transfer Funds A  ${ACCOUNT_ID}  ${new_account}  0
    Wait Until Element Is Visible    ${Amount_result}
    Page Should Contain    Transfer Incomplete!