*** Settings ***
Documentation     A test suite with a single test to verify ability to recover UserID.
Resource          resource.robot

*** Test Cases ***
Send Email To Recover UserID
    Open Browser On Forgot UserID Page
    Send Email
    Verify Text Message  If your email is found in the system, your userID information will be sent to your email address. If you do not receive it, please contact your TruNumber Finder Administrator.
    Close Browser