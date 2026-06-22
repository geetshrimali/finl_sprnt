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

    Select From List By Label    ${Account_Type}    ${acc_type}


    Wait Until Element Contains    ${From_Account}    13344

    Wait Until Element Is Enabled  ${Open_New_account}  5s
    Click Element    ${Open_New_account}
    Wait Until Page Contains  Congratulations, your account is now open.
    Wait Until Element Is Visible    ${New_Account_ID_LOC}  5s
    ${accountId}=    Get Text    ${New_Account_ID_LOC}

    Set Suite Variable    ${NEW_ACCOUNT_ID}    ${accountId}

    Log To Console    Created Account: ${accountId}

    RETURN    ${accountId}
