*** Settings ***
Library                AppiumLibrary
Variables              locators.yaml


*** Variables ***
${remote_url}                 http://localhost:4723/wd/hub
${PlatformNames}              Android
${DeviceNames}                emulator-5574
${AppPackages}                com.example.myapplication
${AppActivitys}               com.example.myapplication.MainActivity


*** Keywords ***
Open AppFlight Aplication
    Open Application           ${remote_url} 
    ...                        platformName=${PlatformNames}    
    ...                        deviceName=${DeviceNames}
    ...                        appPackage=${AppPackages}    
    ...                        appActivity=${AppActivitys}

Tap button Login
    Wait Until Element Is Visible          ${btn_login} 
    Click Element                          ${btn_login}

Input username
    [Arguments]        ${userName}
    Wait Until Element Is Visible          ${input_username}
    Input Text                             ${input_username}        ${userName}

Input passwords
    [Arguments]        ${passWord}
    Input Text                             ${input_password}        ${passWord}

Tap button SingIn
    Tap                                    ${btn_Singin}

Verification successful login
    Wait Until Element Is Visible          ${VerifySuccess_login}
    Page Should Contain Element            ${VerifySuccess_login}


Verification failed login
    Page Should Contain Text               Invalid username/password

Tap Booking Flight
    Wait Until Element Is Visible          ${btn_Booking}  
    Tap                                    ${btn_Booking}  

Tap Round Trip
    Wait Until Element Is Visible           ${tap_RoundTrip}
    Tap                                     ${tap_RoundTrip}

Choose From City
    [Arguments]        ${fromCity}
    Wait Until Element Is Visible          ${spinner_FromCity}
    Tap                                    ${spinner_FromCity}
    Tap                                    //*[contains(@text,"${fromCity}")] 

Choose To City
    [Arguments]        ${toCity}
    Wait Until Element Is Visible          ${spinner_ToCity}
    Tap                                    ${spinner_ToCity}
    Tap                                    //*[contains(@text,'${toCity}')] 
    
Choose Class
    [Arguments]        ${classFlight}
    Wait Until Element Is Visible         ${spinner_Class}
    Tap                                   ${spinner_Class}
    Tap                                   //*[contains(@text,'${classFlight}')]
    Sleep                                 2

Choice Start Date
    [Arguments]        ${startDate}
    Tap                                   ${tap_StartDate}
    Wait Until Element Is Visible         ${view_Month}
    Tap                                   //android.view.View[@content-desc="${startDate}"]
    Tap                                   ${btn_DateOK}

Choice End Date
    [Arguments]        ${endDate}
    Tap                                   ${tap_EndDate}
    Wait Until Element Is Visible         ${view_Month}
    Tap                                   //android.view.View[@content-desc="${endDate}"]
    Tap                                   ${btn_DateOK}
    
Choose Flight package
    [Arguments]        ${flight_package}
    Tap                                    //*[contains(@text,'${flight_package}')] 

Checklist Day
    Tap                                    ${checklist_Day}

Tap button Book
    Tap                                    ${btn_Book}
    
Verify redirect to page confirm booking
    Wait Until Element Is Visible          ${VerifyPage_ConfirmBook}

Choose flight pricing
    [Arguments]        ${flightPrice}
    Tap                                    ${choose_FlightPrice}/${flightPrice}

Tap button confirm order
    Tap                                    ${btn_ConfirmOrder}

Verify reservation flight is booked
    Wait Until Element Is Visible          ${VerifyReservationBook}
    Element Should Be Visible              ${VerifyReservationBook}

Tap Seacrh Flight
    Tap                                   ${Tap_SearchFlight} 

Verify page Flight Number
    Wait Until Element Is Visible          ${waitVisibleFlightNumber}
    Page Should Contain Text               Enter Flight Number

Input Flight Number
    [Arguments]        ${flightNumber}
    Wait Until Element Is Visible         ${Input_FlightNumber}
    Input Text                            ${Input_FlightNumber}            ${flightNumber}

Clear Flight Number
    Clear Text                            ${clear_FlightNumber}

Tap button search flight
    Tap                                   ${btn_SearchFlight}

Verify flight number is invalid
    Page Should Contain Text               Please enter valid Flight Number
    
Verify flight number is valid
    Wait Until Element Is Visible          ${waitFlightNumberVisible}
    Page Should Contain Text               Toronto to Paris
    Page Should Contain Text               DA 935