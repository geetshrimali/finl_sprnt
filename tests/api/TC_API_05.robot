*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup  Create Session To API

*** Test Cases ***
TC_API_05 Invalid Account ID
    [Documentation]  Verify API response for invalid account ID
    [Tags]  api

    ${response}=  Get Account Details    ${INVALID_ID}
    Should Be Equal As Integers    ${response.status_code}    400

    Log To Console    ${response.text}
    Log To Console    ${response.status_code}