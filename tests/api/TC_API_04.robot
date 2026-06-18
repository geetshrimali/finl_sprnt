*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup  Create Session To API

*** Test Cases ***
TC_API_04 Invalid Customer ID
    [Documentation]  Verify API response for invalid customer ID
    [Tags]  api negative

    ${response}=  Get Customer Accounts    ${INVALID_ID}
    Should Be Equal As Integers    ${response.status_code}    400

    Log To Console    ${response.text}
    Log To Console    ${response.status_code}