*** Settings ***
Library  RequestsLibrary
Library  Collections

Resource  ../../variables/api_variables.robot
Resource  ../keywords/common_resources.robot
Resource  ../pages/home_pg.robot
Resource  ../pages/transfer_funds.robot

*** Keywords ***
Create Session To API
    Create Session  parabank  ${API_BASE_URL}

Get Customer Accounts
    [Arguments]  ${customerId}
    ${headers}=  Create Dictionary    Accept=application/json
    ${response}=    GET On Session    parabank   /customers/${customerId}/accounts  expected_status=any  headers=${headers}
    RETURN    ${response}

Get Account Details
    [Arguments]  ${accountId}
    ${headers}=  Create Dictionary    Accept=application/json
    ${response}=    GET On Session    parabank   /accounts/${accountId}  expected_status=any  headers=${headers}
    RETURN    ${response}

Clear Database
    Create Session To API
    ${headers}=  Create Dictionary    Accept=application/json
    ${response}=    POST On Session    parabank  /cleanDB   expected_status=any  headers=${headers}
    RETURN    ${response}
