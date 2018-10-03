*** Settings ***
Documentation     A test suite containing tests related to invalid login.
Suite Setup       Open Browser On Login Page
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Test Template     Login With Invalid Credentials Should Return An Error
Resource          resource.robot

*** Test Cases ***           USER ID           PASSWORD             Message
Invalid UserID               invalid           ${VALID_PASSWORD}    ${ERROR_TEXT1}
Invalid Password             ${VALID_USERID}   invalid              ${ERROR_TEXT1}
Empty UserID                 ${EMPTY}          ${VALID_PASSWORD}    ${ERROR_TEXT2}
Empty Password               ${VALID_USERID}   ${EMPTY}             ${ERROR_TEXT2}
Empty UserID And Password    ${EMPTY}          ${EMPTY}             ${ERROR_TEXT2}

*** Keywords ***
Login With Invalid Credentials Should Return An Error
    [Arguments]  ${userId}  ${password}  ${message}
    Input UserID  ${userId}
    Input Password  ${password}
    Submit Credentials
    Verify Text Message  ${message}