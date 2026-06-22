*** Variables ***
${usr_fld}  css=input[name=username]
${pass_fld}  css=input[name=password]
${register}  css=a[href="register.htm"]
${login}  css=input.button

${f_name}  xpath=//input[@id="customer.firstName"]
${l_name}  xpath=//input[@id="customer.lastName"]
${usr_add}  xpath=//input[@id="customer.address.street"]
${city_field}  xpath=//input[@id="customer.address.city"]
${state_field}  xpath=//input[@id="customer.address.state"]
${zip}  xpath=//input[@id="customer.address.zipCode"]
${ph_no}  xpath=//input[@id="customer.phoneNumber"]
${social_sec}  xpath=//input[@id="customer.ssn"]
${usrnm_field}  xpath=//input[@id="customer.username"]
${pwd_field}  xpath=//input[@id="customer.password"]
${cnfrm_pwd}  xpath=//input[@id="repeatedPassword"]
${register_btn}  xpath=//input[@value="Register"]