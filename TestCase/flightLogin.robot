*** Settings ***
Documentation           Test Fungtionaly login AppFlight
Resource                ../Locator/keywordFlight.robot
Test Setup              Open AppFlight Aplication
Test Teardown           Close Application

*** Variables ***
&{userNames}        validUsername=support@ngendigital.com    invalidUsername=adudu@gmail.com
&{Passwd}           validPasswrd=abc123        invalidPasswrd=super123

*** Test Cases ***
User should be able login with valid username
    [Tags]    Positive Test
    Tap button Login
    Input username     ${userNames.validUsername}
    Input passwords    ${Passwd.validPasswrd}
    Tap button SingIn
    Verification successful login

User should not be able login with invalid username
    [Tags]    Negative Test
    Tap button Login
    Input username     ${userNames.invalidUsername}
    Input passwords    ${Passwd.invalidPasswrd}
    Tap button SingIn
    Verification failed login

User should not be able login with empty username
    [Tags]    Negative Test
    Tap button Login
    Input username     ${Empty}
    Input passwords    ${Empty}
    Tap button SingIn
    Verification failed login