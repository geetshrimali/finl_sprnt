*** Settings ***
Library  SeleniumLibrary
Resource  ../../variables/account_services_loc.robot
Resource  ../keywords/common_resources.robot
Resource  ../pages/home_pg.robot
*** Keywords ***
Create Account
    [Arguments]    ${acc_type}

    Click Element    ${Open_Account}

    Wait Until Element Is Visible    ${Account_Type}    10s

    Wait Until Element Does Not Contain    ${FROM_ACCOUNT}    NONE

    Select From List By Label    ${Account_Type}    ${acc_type}
    Sleep    2
    Click Element    ${Open_New_Account}
    Sleep    1
    Wait Until Page Contains
    ...    Congratulations, your account is now open.

    ${accountId}=    Get Text    ${New_Account_ID_LOC}

    Set Suite Variable    ${NEW_ACCOUNT_ID}    ${accountId}

    Log To Console    Created Account: ${accountId}

    RETURN    ${accountId}
