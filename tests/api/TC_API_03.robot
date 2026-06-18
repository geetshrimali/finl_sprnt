*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup  Create Session To API

*** Test Cases ***
TC_API_03 Validate account details
    [Documentation]  Validate account details and response schema
    [Tags]  api

    ${response}=  Get Customer Accounts    ${CUSTOMER_ID}
    Should Be Equal As Integers    ${response.status_code}    200
    ${body}=    Set Variable    ${response.json()}
    Should Not Be Empty    ${body}
    ${account}=  Set Variable    ${body[0]}

    Dictionary Should Contain Key    ${account}    id
    Dictionary Should Contain Key    ${account}    customerId
    Dictionary Should Contain Key    ${account}    balance
    Dictionary Should Contain Key    ${account}    type

    Log To Console    ${account}