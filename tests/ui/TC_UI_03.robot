*** Settings ***
Resource  ../../resources/keywords/common_resources.robot
Resource  ../../resources/pages/open_account.robot

Suite Setup  Load Environment
Test Setup  open app
Test Teardown  close app

*** Test Cases ***
TC-UI-03 Validate negative account creation
    [Documentation]  Validate Account Creation with Missing Required Selection
    [Tags]  ui negative

    login    ${USER_ID}    ${USER_PWD}

    Click Element    ${Open_Account}

    Wait Until Element Is Visible    ${Account_Type}
    
    Sleep    1
    
    Click Element    ${Open_New_Account}

    Sleep   2

    Wait Until Page Contains
    ...    Congratulations, your account is now open.
