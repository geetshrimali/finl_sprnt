*** Settings ***
Library  SeleniumLibrary
Resource  ../../variables/home_pg_loc.robot
Resource  ../keywords/common_resources.robot
*** Keywords ***
login
    [Arguments]  ${id}  ${pwd}

    Input Text    ${usr_fld}    ${id}
    Sleep    1
    Log    entering id

    Input Text    ${pass_fld}    ${pwd}
    Sleep    1
    Log    entering password

    Sleep    1

    Click Element    ${login}
    Log    login