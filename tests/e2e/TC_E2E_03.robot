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
    login  ${USER_ID}  ${USER_PWD}
    Sleep    1
    Clear Database
    Create Account    CHECKING
    ${ac1}=  Set Variable  ${NEW_ACCOUNT_ID}
    Log  Source Account: ${ac1}

    Create Account    SAVINGS
    ${ac2}=  Set Variable  ${NEW_ACCOUNT_ID}
    Log  Source Account: ${ac2}
    Sleep    1

    ${source}=  Get Account Details  ${ac1}
    ${destination}=  Get Account Details  ${ac2}
    ${src_bal}=  Set Variable  ${source.json()['balance']}
    ${dst_bal}=   Set Variable  ${destination.json()['balance']}
    Log  Source balance before: ${src_bal}
    Log   Dest balance before: ${dst_bal}

    Transfer Funds A  ${ac1}  ${ac2}  15
    Sleep    3

    ${source}=  Get Account Details  ${ac1}
    ${destination}=  Get Account Details  ${ac2}
    ${source_new}=  Set Variable  ${source.json()['balance']}
    ${destination_new}=  Set Variable  ${destination.json()['balance']}

    Log  Source balance after: ${source_new}
    Log  Dest balance after: ${destination_new}
    Should Be Equal As Numbers  ${source_new}  ${src_bal - 15}
    Should Be Equal As Numbers  ${destination_new}  ${dst_bal + 15}
