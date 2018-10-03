*** Settings ***
Documentation    A resource file with reusable keywords and variables.
Library  SeleniumLibrary

*** Variables ***
${BROWSER}         Chrome
${LOGIN URL}       https://finder.iconectiv.com/finder/sec/login
${DELAY}           0            #Specify delay in seconds
${VALID_USERID}    userId       #Specify valid UserID value
${VALID_PASSWORD}  userPass     #Specify valid Password value
${MESSAGE}         class:mr-3
${VALID_EMAIL}     email@test.com
${ERROR_TEXT1}     The userID or password are incorrect. If you think you have gotten this message in error, please contact your TruNumber Finder Administrator.
${ERROR_TEXT2}     UserID and Password are required.
*** Keywords ***
Open Browser On Login Page
    Open Browser  ${LOGIN URL}  ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be  TruNumber Finder

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input UserID
    [Arguments]  ${user}
    Clear Element Text  id:loginuser
    Input Text  id:loginuser  ${user}

Input Password
    [Arguments]  ${password}
    Clear Element Text  id:loginpassword
    Input Text  id:loginpassword  ${password}

Submit Credentials
    Click Button  id:loginbutton

Send UserID
    Input Text  id:userID  ${VALID_USERID}
    Element Should Be Enabled  id:sendbutton
    Click Button  id:sendbutton

Send Email
    Input Text  id:email  ${VALID_EMAIL}
    Element Should Be Enabled  id:sendbutton
    Click Button  id:sendbutton

Open Browser On Forgot Password Page
    Open Browser On Login Page
    Click Link   id:forgotpasswordlink
    Wait Until Element Is Visible  id:userID
    Element Should Be Disabled  id:sendbutton

Open Browser On Forgot UserID Page
    Open Browser On Login Page
    Click Link   id:forgotuseridlink
    Wait Until Element Is Visible  id:email
    Element Should Be Disabled  id:sendbutton

Verify Text Message
    [Arguments]  ${textmessage}
    Wait Until Element Is Visible  ${MESSAGE}
    Element Text Should Be  ${MESSAGE}  ${textmessage}