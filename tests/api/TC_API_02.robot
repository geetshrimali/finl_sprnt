*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup  Create Session To API

*** Test Cases ***
TC_API_02 verify account exists
    [Documentation]  Verify Account Exists in API Response
    [Tags]  api

    ${response}=  Get Customer Accounts    ${CUSTOMER_ID}
    Should Be Equal As Integers    ${response.status_code}    200
    ${body}=    Set Variable    ${response.json()}
    Should Not Be Empty    ${body}
    Should Contain    ${response.text}    ${ACCOUNT_ID}

    Log To Console    ${body}
    Log To Console    ${response.status_code}