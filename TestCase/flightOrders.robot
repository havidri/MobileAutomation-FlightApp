*** Settings ***
Documentation           Test Case Fungtionaly User Booking One Way Flight and Round Trip Flight
Resource                ../pageObject/login.robot
Resource                ../Locator/keywordFlight.robot
Test Setup             Open AppFlight Aplication
Test Teardown          Close Application

*** Variables ***
## Symbol '@' for create list data and Symbol '&' for create data dictionary 
&{FromCity}        CityN=New York    CityC=Chicago    CityT=Toronto
&{ToCity}          CityL=London      CityP=Paris      CityO=Ottawa
&{ClassFlight}     EClass=Economy    FClass=First     BClass=Business
&{FlightPackage}   Flight=Flight     FlightAcomodation=Flight + Hotel
@{GetPrice}        price1    price2    price3   
...                price4    price5    price6   
...                price7    price8    price9

*** Test Cases ***
User Booking One Way Flight
    [Tags]    Positive Test
    Login user with valid username
    Tap Booking Flight
    Choose From City       ${FromCity.CityC}
    Choose To City         ${ToCity.CityO}
    Choose Class           ${ClassFlight.EClass}
    Choice Start Date      03 August 2019
    Choice End Date        23 August 2019
    Choose Flight package  ${FlightPackage.Flight}
    Checklist Day
    Tap button Book
    Verify redirect to page confirm booking
    Choose flight pricing    ${GetPrice}[3]
    Tap button confirm order
    Verify reservation flight is booked

User Booking Round Trip Flight
    [Tags]    Positive Test
    Login user with valid username
    Tap Booking Flight
    Tap Round Trip
    Choose From City       ${FromCity.CityT}
    Choose To City         ${ToCity.CityP}
    Choose Class           ${ClassFlight.FClass}    
    Choice Start Date      11 August 2019
    Choice End Date        19 August 2019
    Choose Flight package  ${FlightPackage.FlightAcomodation}
    Checklist Day
    Tap button Book
    Verify redirect to page confirm booking
    Choose flight pricing    ${GetPrice}[8]
    Tap button confirm order
    Verify reservation flight is booked