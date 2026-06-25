*** Settings ***
Resource  ../../resources/keywords/common_resources.robot
Resource  ../../resources/pages/home_pg.robot
Resource  ../../resources/pages/open_account.robot
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup  Setup E2E
Test Setup  open app
Test Teardown  Save Screenshot

*** Test Cases ***
TC_E2E_01 Create Checking Account and Verify via API
    [Documentation]  Create a checking account and verify the account details via API
    [Tags]  e2e
    login    ${USER_ID}    ${USER_PWD}
    ${n_ac}=  Create Account    CHECKING

    Page Should Contain    Congratulations, your account is now open.  2s

    ${response}=    Get Customer Accounts    ${CUSTOMER_ID}

    Should Be Equal As Integers    ${response.status_code}    200
    Should Contain    ${response.text}    ${n_ac}

    Log  Account Created and Verified!