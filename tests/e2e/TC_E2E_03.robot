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
    [Documentation]  Transfer funds and verify the transaction details via API
    [Tags]  e2e
    login    ${USER_ID}    ${USER_PWD}
    Sleep    1

    ${response}=    Get Customer Accounts    ${CUSTOMER_ID}
    ${accounts}=    Set Variable    ${response.json()}

    ${source_before}=    Set Variable    ${accounts[0]['balance']}
    ${dest_before}=      Set Variable    ${accounts[1]['balance']}

    Transfer Funds    15

    ${response}=    Get Customer Accounts    ${CUSTOMER_ID}
    ${accounts}=    Set Variable    ${response.json()}

    ${source_after}=    Set Variable    ${accounts[0]['balance']}
    ${dest_after}=      Set Variable    ${accounts[1]['balance']}

    ${source_expected}=    Evaluate    ${source_before} - 15
    ${dest_expected}=      Evaluate    ${dest_before} + 15

    Should Be Equal As Numbers    ${source_after}    ${source_expected}
    Should Be Equal As Numbers    ${dest_after}      ${dest_expected}