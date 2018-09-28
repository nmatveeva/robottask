*** Settings ***
Documentation     A test suite containing tests related to invalid login.
Suite Setup       Open Browser On Login Page
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Test Template     Login With Invalid Credentials Should Return An Error
Resource          resource.robot

*** Test Cases ***           USER ID           PASSWORD
Invalid UserID               invalid           ${VALID_PASSWORD}
Invalid Password             ${VALID_USERID}   invalid

*** Keywords ***
Login With Invalid Credentials Should Return An Error
    [Arguments]  ${userId}  ${password}
    Input UserID  ${userId}
    Input Password  ${password}
    Submit Credentials
    Login Should Have Failed

Login Should Have Failed
    Verify Text Message  The userID or password are incorrect. If you think you have gotten this message in error, please contact your TruNumber Finder Administrator.