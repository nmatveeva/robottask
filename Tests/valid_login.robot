*** Settings ***
Documentation     A test suite with a single test for valid login.
Resource          resource.robot

*** Test Cases ***
Valid Login
    Open Browser On Login Page
    Input UserID    ${VALID_USERID}
    Input Password  ${VALID_PASSWORD}
    Submit Credentials
    #Welcome Page Should Be Open -> unable to add validation without valid credentials
    Close Browser