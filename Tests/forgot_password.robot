*** Settings ***
Documentation     A test suite with a single test to verify ability to recover user password.
Resource          resource.robot

*** Test Cases ***
Send UserID To Recover Password
    Open Browser On Forgot Password Page
    Send UserID
    Verify Text Message  If your userID is valid and active, a password reset link will be sent to your email address. If you do not receive one, please contact your TruNumber Finder Administrator.
    Close Browser