*** Settings ***
Resource  ../../resources/keywords/common_resources.robot
Resource  ../../resources/pages/home_pg.robot
Resource  ../../resources/pages/open_account.robot
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/pages/transfer_funds.robot

Suite Setup  Setup E2E
Test Setup  open app
Test Teardown  Save Screenshot

*** Test Cases ***
TC_E2E_03 Transfer Funds And Validate Via API
    login    ${USER_ID}  ${USER_PWD}

    ${dest_account}=  Create Account  SAVINGS
    Page Should Contain    Congratulations, your account is now open.
    ${from_before}=  Get Account Details  ${ACCOUNT_ID}
    ${to_before}=   Get Account Details  ${dest_account}

    ${balance_before_from}=  Set Variable   ${from_before.json()['balance']}
    ${balance_before_to}=    Set Variable  ${to_before.json()['balance']}

    Transfer Funds A  ${ACCOUNT_ID}  ${dest_account}    100

    Wait Until Keyword Succeeds  10s  1s  Validate Transfer Via API  ${ACCOUNT_ID}  ${dest_account}  ${balance_before_from}  ${balance_before_to}

    Log  Funds Transferred and Validated