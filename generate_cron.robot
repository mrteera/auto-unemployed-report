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
    Extract appointments and generate cron
    [Teardown]    Close Browser

*** Keywords ***
Open Browser and Login
    Open Browser    ${SiteUrl}      ${Browser}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Press Key     password    \\13

Goto tracking index page
    Go to     http://empui.doe.go.th/tracking/index

Extract appointments and generate cron
    ${d1} =    Get Text    xpath=//tbody/tr[1]/td[2]
    ${d2} =    Get Text    xpath=//tbody/tr[2]/td[2]
    ${d3} =    Get Text    xpath=//tbody/tr[3]/td[2]
    ${d4} =    Get Text    xpath=//tbody/tr[4]/td[2]
    ${d5} =    Get Text    xpath=//tbody/tr[5]/td[2]
    ${d6} =    Get Text    xpath=//tbody/tr[6]/td[2]
    ${Appointments} =   Create List     ${d1}    ${d2}    ${d3}     ${d4}    ${d5}      ${d6}
    generate a cron       ${Appointments}
