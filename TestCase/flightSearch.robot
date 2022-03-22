*** Settings ***
Documentation           Test Case Fungtionaly for search Flight Number
Resource                ../pageObject/login.robot
Resource                ../Locator/keywordFlight.robot
Suite Setup             Open AppFlight Aplication
Suite Teardown          Close Application

*** Variables ***
&{flightNumbers}        validFNumber=DA935        invalidFNumber=ABC1234

*** Test Cases ***
User did a empty flight number search
    [Tags]    Negative Test
    Login user with valid username    
    Tap Seacrh Flight
    Verify page Flight Number
    Input Flight Number   ${empty}
    Tap button search flight
    Verify flight number is invalid

User did a wrong flight number search
    [Tags]    Negative Test
    Input Flight Number   ${flightNumbers.invalidFNumber}
    Tap button search flight
    Verify flight number is invalid

User did a valid flight number search
    [Tags]    Positive Test
    Clear Flight Number
    Input Flight Number   ${flightNumbers.validFNumber}
    Tap button search flight
    Verify flight number is valid