*** Settings ***
Documentation     A test suite containing tests related to login with empty credentials.
Suite Setup       Open Browser On Login Page
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Test Template     Login With Empty Credentials Should Return An Error
Resource          resource.robot

*** Test Cases ***           USER ID           PASSWORD
Empty UserID                 ${EMPTY}          ${VALID_PASSWORD}
Empty Password               ${VALID_USERID}   ${EMPTY}
Empty UserID And Password    ${EMPTY}          ${EMPTY}

*** Keywords ***
Login With Empty Credentials Should Return An Error
    [Arguments]  ${userId}  ${password}
    Input UserID  ${userId}
    Input Password  ${password}
    Submit Credentials
    Login Should Have Failed

Login Should Have Failed
    Verify Text Message  UserID and Password are required.

