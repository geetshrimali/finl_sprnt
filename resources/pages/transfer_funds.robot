*** Settings ***
Library  SeleniumLibrary
Resource  ../../variables/account_services_loc.robot
Resource  ../keywords/common_resources.robot
Resource  ../pages/home_pg.robot
*** Keywords ***
Transfer Funds A
    [Arguments]  ${from_acc}  ${to_acc}  ${amount}
    Click Element    ${Transfer_Funds}
    Log    clicked transfer funds

    Wait Until Element Is Visible    ${Funds_Amount}   5s

    Input Text    ${Funds_Amount}    ${amount}

    Sleep    1

    Select From List By Value    ${From_Account}    ${from_acc}
    Select From List By Value    ${To_Account}    ${to_acc}

    ${from}=    Get Selected List Value    ${From_Account}
    ${to}=      Get Selected List Value    ${To_Account}

    Set Suite Variable    ${TRANSFER_AMOUNT}    ${amount}
    Set Suite Variable    ${FROM_ACCOUNT}    ${from}
    Set Suite Variable    ${TO_ACCOUNT}    ${to}

    Sleep    2
    Click Element    ${Transfer_Button}
    Sleep    2
    Wait Until Page Contains    Transfer Complete!
    Log    Funds transferred

Transfer Funds B
    [Arguments]  ${amount}
    Click Element    ${Transfer_Funds}
    Log    clicked transfer funds

    Wait Until Element Is Visible    ${Funds_Amount}   5s

    Input Text    ${Funds_Amount}    ${amount}

    Sleep    1

    Select From List By Index    ${From_Account}    0
    Select From List By Index    ${To_Account}    1

    ${from}=    Get Selected List Value    ${From_Account}
    ${to}=      Get Selected List Value    ${To_Account}

    Set Suite Variable    ${TRANSFER_AMOUNT}    ${amount}
    Set Suite Variable    ${FROM_ACCOUNT}    ${from}
    Set Suite Variable    ${TO_ACCOUNT}    ${to}

    Sleep    2
    Click Element    ${Transfer_Button}
    Sleep    2
    Wait Until Page Contains    Transfer Complete!
    Log    Funds transferred

Validate Transfer
    Page Should Contain    Transfer Complete!

    ${amount}=    Get Text    ${Amount_Result}
    ${from}=      Get Text    ${From_Account_Result}
    ${to}=        Get Text    ${To_Account_Result}

    Should Contain    ${amount}    ${TRANSFER_AMOUNT}
    Should Be Equal    ${from}    ${FROM_ACCOUNT}
    Should Be Equal    ${to}      ${TO_ACCOUNT}

    Log  Transfer validated successfully

Transfer Funds Same Account
    [Arguments]  ${amount}
    Click Element    ${Transfer_Funds}
    Log    clicked transfer funds

    Wait Until Element Is Visible    ${Funds_Amount}   5s

    Input Text    ${Funds_Amount}    ${amount}

    Sleep    1

    Select From List By Index    ${From_Account}    0
    Select From List By Index    ${To_Account}    0
    Sleep    2
    Click Element    ${Transfer_Button}
    Sleep    1
    Wait Until Page Contains    Transfer Complete!
    Log    Funds transferred
