*** Settings ***
Resource  ../../resources/keywords/common_resources.robot
Resource  ../../resources/pages/open_account.robot

Suite Setup  Load Environment
Test Setup  open app
Test Teardown  Save Screenshot

*** Test Cases ***
TC_UI_02 Create Checking Account
    [Documentation]  Create checking account
    [Tags]  ui

    login    ${USER_ID}    ${USER_PWD}
    Clear Database
    Create Account  CHECKING
    Page Should Contain    Congratulations, your account is now open.