*** Settings ***
Resource  ../../resources/keywords/common_resources.robot
Resource  ../../resources/pages/home_pg.robot
Resource  ../../resources/pages/open_account.robot
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup  Setup E2E
Test Setup  open app
Test Teardown  close app

*** Test Cases ***
TC_E2E_02 Validate account type
    [Documentation]  Validate account type and details
    [Tags]  e2e
    login    ${USER_ID}    ${USER_PWD}
    Clear Database
    Create Account    CHECKING
    Sleep    4
    ${response}=    Get Account Details    ${NEW_ACCOUNT_ID}
    Log To Console    NEW_ACCOUNT_ID=${NEW_ACCOUNT_ID}
    Should Be Equal As Integers  ${response.status_code}  200

    ${body}=    Set Variable    ${response.json()}

    Should Be Equal As Integers    ${response.status_code}    200
    Should Be Equal    ${body['type']}    CHECKING
    Log To Console    BALANCE=${body['balance']}
    Should Be True    ${body['balance']} >= 0
