*** Settings ***
Library    Collections
Library    Selenium2Library
Library    generate_cron.py

*** Variables ***
${username}       username
${password}       password
${Browser}        PhantomJS
${SiteUrl}        http://empui.doe.go.th

*** Test Cases ***
GetAppointmentSchedule
    Open Browser and Login
    sleep 2s
    Goto tracking index page
    Submit report
    [Teardown]    Close Browser

*** Keywords ***
Open Browser and Login
    Open Browser    ${SiteUrl}      ${Browser}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Press Key     password    \\13

Goto tracking index page
    Go to     http://empui.doe.go.th/tracking/index

Submit report
    Click Element       xpath=//button[@value="รายงานตัว"]
