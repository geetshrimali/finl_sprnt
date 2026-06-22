*** Settings ***
Library  SeleniumLibrary
Resource  ../../variables/home_pg_loc.robot
Resource  ../keywords/common_resources.robot
*** Keywords ***
login
    [Arguments]  ${id}  ${pwd}
    Wait Until Element Is Visible    ${usr_fld}
    Input Text    ${usr_fld}    ${id}

    Log    entering id

    Input Text    ${pass_fld}    ${pwd}

    Log    entering password

    Click Element    ${login}
    Log    login

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
