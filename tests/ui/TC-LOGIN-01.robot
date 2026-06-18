*** Settings ***
Resource  ../../resources/keywords/common_resources.robot
Resource  ../../resources/pages/home_pg.robot

Suite Setup  Load Environment
Test Setup  open app
Test Teardown  close app

*** Test Cases ***
TC-LOGIN-01 Verify login functionality
    [Documentation]  Verify login functionality with valid credentials
    [Tags]  ui
    login  ${USER_ID}  ${USER_PWD}
    Location Should Contain    /overview.htm
