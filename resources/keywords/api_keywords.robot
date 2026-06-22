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

Account Should Exist In API
    [Arguments]    ${account_id}

    ${response}=    Get Account Details    ${account_id}
    Should Be Equal As Integers    ${response.status_code}    200

Validate Transfer Via API
    [Arguments]    ${fr_ac}    ${to_ac}    ${before_from}    ${before_to}

    ${from_after}=    Get Account Details    ${fr_ac}
    ${to_after}=      Get Account Details    ${to_ac}

    ${after_from}=    Set Variable    ${from_after.json()['balance']}
    ${after_to}=      Set Variable    ${to_after.json()['balance']}

    ${expected_from}=    Evaluate    float(${before_from}) - 100
    ${expected_to}=      Evaluate    float(${before_to}) + 100

    Should Be Equal As Numbers    ${after_from}    ${expected_from}
    Should Be Equal As Numbers    ${after_to}      ${expected_to}

Clear Database
    Create Session To API
    ${headers}=  Create Dictionary    Accept=application/json
    ${response}=    POST On Session    parabank  /cleanDB   expected_status=any  headers=${headers}
    RETURN    ${response}
