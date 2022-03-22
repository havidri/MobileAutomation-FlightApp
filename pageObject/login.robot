*** Settings ***
Resource                ../Locator/keywordFlight.robot

*** Keywords ***
Login user with valid username
    Tap button Login
    Input username     support@ngendigital.com
    Input passwords    abc123
    Tap button SingIn
    Verification successful login