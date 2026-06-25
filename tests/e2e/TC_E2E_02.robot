*** Settings ***
Resource  ../../resources/keywords/common_resources.robot
Resource  ../../resources/pages/home_pg.robot
Resource  ../../resources/pages/open_account.robot
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup  Setup E2E
Test Setup  open app
Test Teardown  Save Screenshot

*** Test Cases ***
TC_E2E_02 Validate account type
    [Documentation]  Validate account type and details
    [Tags]  e2e
    login    ${USER_ID}    ${USER_PWD}
    ${new_check}=  Create Account    CHECKING
    Page Should Contain    Congratulations, your account is now open.
    Wait Until Keyword Succeeds   10s  2s   Account Should Exist In API  ${new_check}
    ${response}=    Get Account Details    ${new_check}
    Log To Console   NEW_ACCOUNT_ID=${new_check}
    Should Be Equal As Integers  ${response.status_code}  200

    ${body}=   Set Variable  ${response.json()}

    Should Be Equal As Integers    ${response.status_code}    200
    Should Be Equal    ${body['type']}    CHECKING
    Log To Console    BAL=${body['balance']}
    Should Be True    ${body['balance']} >= 0

    Log  Account Validated!