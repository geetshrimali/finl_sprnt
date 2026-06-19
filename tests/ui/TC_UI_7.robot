*** Settings ***
Resource  ../../resources/keywords/common_resources.robot
Resource  ../../resources/pages/transfer_funds.robot

Suite Setup  Load Environment
Test Setup  open app
Test Teardown  close app

*** Test Cases ***
TC_UI_07 Validate Transfer To Same Account
    [Documentation]  Validate transfer to same account
    [Tags]  ui negative

    login    ${USER_ID}  ${USER_PWD}
    Log  Logged in successfully
    Clear Database
    Transfer Funds Same Account    100
    Log  Transfer funds to same account completed successfully

    Page Should Contain    Transfer Incomplete!

