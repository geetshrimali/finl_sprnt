*** Settings ***
Resource  ../../resources/keywords/common_resources.robot
Resource  ../../resources/pages/home_pg.robot
Resource  ../../resources/pages/open_account.robot
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/pages/transfer_funds.robot

Suite Setup  Setup E2E
Test Setup  open app
Test Teardown  close app

*** Test Cases ***
TC_E2E_03 Transfer Funds And Validate Via API
    login    ${USER_ID}    ${USER_PWD}
    Clear Database
    ${dest_account}=    Create Account    SAVINGS
    ${from_before}=    Get Account Details    ${ACCOUNT_ID}
    ${to_before}=    Get Account Details    ${dest_account}
    ${balance_before_from}=    Set Variable    ${from_before.json()['balance']}
    ${balance_before_to}=    Set Variable    ${to_before.json()['balance']}

    Transfer Funds A    ${ACCOUNT_ID}    ${dest_account}    100

    Sleep    2
    ${from_after}=    Get Account Details    ${ACCOUNT_ID}
    ${to_after}=    Get Account Details    ${dest_account}
    ${balance_after_from}=    Set Variable    ${from_after.json()['balance']}
    ${balance_after_to}=    Set Variable    ${to_after.json()['balance']}

    Should Be Equal As Numbers    ${balance_after_from}    ${balance_before_from - 100}

    Should Be Equal As Numbers    ${balance_after_to}    ${balance_before_to + 100}
