*** Settings ***
Resource  ../../resources/keywords/common_resources.robot
Resource  ../../resources/pages/transfer_funds.robot

Suite Setup  Load Environment
Test Setup  open app
Test Teardown  Save Screenshot

*** Test Cases ***
TC_UI_07 Validate Transfer To Same Account
    [Documentation]  Validate transfer to same account(FAIL)
    [Tags]  ui negative

    login    ${USER_ID}  ${USER_PWD}
    Log  Logged in successfully

    Transfer Funds Same Account    100
    Wait Until Element Is Visible    ${Amount_result}
    Page Should Contain    Transfer Incomplete!

