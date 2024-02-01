*** Settings ***
Documentation     
Library           SeleniumLibrary

Suite Setup       Open Browser    ${url}    chrome

*** Variables ***
${URL}             http://automationexercise.com
${MAINCLASS}       Automation
${REGI_BTN}        xpath=//a[@href='/login']
${EMAIL}           test@automationexercise.com
${PASSWORD}        securepassword
${EMAIL_INPUT}     name:email
${PWD_INPUT}       name:password
${LOGIN_BTN}       xpath=//button[@data-qa='login-button']
${LOGGED_IN_ELEMENT}    xpath=//a[contains(text(),'Logged in as') and contains(b,'john')]
${CLICK_DEL}       xpath=//a[contains(@href, '/delete_account')]
${DEL_HEADER}    xpath=//h2[@class='title text-center' and @data-qa='account-deleted' and @style='color: green;']/b[contains(text(), 'Account Deleted!')]
*** Keywords ***
Check Page
   Wait Until Page Contains        ${MAINCLASS}
Click Register
   Click Element                   ${REGI_BTN} 
Input Email
   [Arguments]              ${EMAIL}
   Input Text    ${EMAIL_INPUT}    ${EMAIL}
Input Password
   [Arguments]              ${PASSWORD}
   Input Text    ${PWD_INPUT}    ${PASSWORD}
Click Login
   Click Element    ${LOGIN_BTN}
Check Login
  Wait Until Page Contains Element      ${LOGGED_IN_ELEMENT} 
Click delete_account
  Click Element    ${CLICK_DEL}
Check delete_account
  Wait Until Page Contains Element    ${DEL_HEADER} 
*** Test Cases ***
Reigstering
   [Documentation]
   Check Page 
   Click Register
   Input Email       ${EMAIL}
   Input Password    ${PASSWORD}
   Click Login
   Check Login
   Click delete_account
   Check delete_account