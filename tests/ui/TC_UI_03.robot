*** Settings ***
Resource  ../../resources/keywords/common_resources.robot
Resource  ../../resources/pages/open_account.robot

Suite Setup  Load Environment
Test Setup  open app
Test Teardown  Save Screenshot

*** Test Cases ***
TC_UI_03 Validate negative account creation
    [Documentation]  Validate Account Creation with Missing Required Selection
    [Tags]  ui negative

    login    ${USER_ID}    ${USER_PWD}
    Click Element    ${Open_Account}
    Wait Until Element Contains    ${From_Account}    13344
    Click Element    ${Open_New_Account}
    Wait Until Element Is Visible    ${New_Account_ID_LOC}  5s
    ${accountId}=    Get Text    ${New_Account_ID_LOC}
    Log To Console    Created Account: ${accountId}
    
    Page Should Contain    Congratulations, your account is now open.
    
    

