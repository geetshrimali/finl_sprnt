*** Settings ***
Library    SeleniumLibrary
Library    DataDriver   file=${EXECDIR}/data_driven_testing/data_driven_testing_data.csv  dialect=excel
Resource  ../variables/home_pg_loc.robot
Resource  ../resources/keywords/common_resources.robot

Suite Setup  Load Environment

Test Setup  open app

Test Teardown  close app

Test Template  register

*** Test Cases ***
Data Driven Testing
   [Documentation]      Data driven testing using csv
   [Tags]  data-driven

*** Keywords ***
register
    [Arguments]  ${Firstname}    ${Lastname}    ${Address}    ${City}    ${State}    ${Zipcode}    ${Phnm}    ${SSN}    ${Username}    ${Password}    ${Confirm}
    Wait Until Element Is Visible    ${register}
    Click Element    ${register}
    Wait Until Element Is Visible    ${f_name}

    Input Text    ${f_name}   ${Firstname}
    Input Text    ${l_name}  ${Lastname}
    Input Text    ${usr_add}  ${Address}
    Input Text    ${city_field}  ${City}
    Input Text    ${state_field}  ${State}
    Input Text    ${zip}  ${Zipcode}
    Input Text    ${ph_no}  ${Phnm}
    Input Text    ${social_sec}  ${SSN}
    Input Text    ${usrnm_field}  ${Username}
    Input Text    ${pwd_field}  ${Password}
    Input Text    ${cnfrm_pwd}  ${Confirm}
    Click Element  ${register_btn}


