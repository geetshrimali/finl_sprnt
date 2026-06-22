*** Variables ***
${Open_Account}  css=a[href="openaccount.htm"]
${Accounts_Overview}  css=a[href="overview.htm"]
${Transfer_Funds}  css=a[href="transfer.htm"]

${Account_Type}  xpath=//select[@id="type"]
${Existing_Account}  xpath=//select[@id="fromAccountId"]
${Open_New_account}  css=input.button
${New_Account_ID_LOC}   xpath=//a[@id='newAccountId']
${NEW_ACCOUNT_ID}        NONE

${Funds_Amount}  xpath=//input[@id='amount']
${From_Account}  xpath=//select[@id='fromAccountId']
${To_Account}  xpath=//select[@id='toAccountId']
${Transfer_Button}  css=input.button

${Amount_result}  xpath=//span[@id='amountResult']
${From_Account_result}  xpath=//span[@id='fromAccountIdResult']
${To_Account_result}  xpath=//span[@id='toAccountIdResult']