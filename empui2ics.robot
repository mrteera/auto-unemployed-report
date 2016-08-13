*** Settings ***
Library    Selenium2Library
Library    generate_cron.py

*** Variables ***
${username}       username
${password}       password
${Browser}        Google Chrome
${SiteUrl}        http://empui.doe.go.th

*** Test Cases ***
GetAppointmentSchedule
    # Open Browser and Login
    # Goto tracking index page
    # Extract appointments from table
    Generate cron
    # sleep    5s
    [Teardown]    Close Browser

*** Keywords ***
Open Browser and Login
    Open Browser    ${SiteUrl}      ${Browser}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Press Key     password    \\13

Goto tracking index page
    Go to     http://empui.doe.go.th/tracking/index

Extract appointments from table
    ${day1} =    Get Text    xpath=//tbody/tr[1]/td[2]
    ${day2} =    Get Text    xpath=//tbody/tr[2]/td[2]
    ${day3} =    Get Text    xpath=//tbody/tr[3]/td[2]
    ${day4} =    Get Text    xpath=//tbody/tr[4]/td[2]
    ${day5} =    Get Text    xpath=//tbody/tr[5]/td[2]
    ${day6} =    Get Text    xpath=//tbody/tr[6]/td[2]
    Log to console      \n${day1}\n
    Log to console      ${day2}\n
    Log to console      ${day3}\n
    Log to console      ${day4}\n
    Log to console      ${day5}\n
    Log to console      ${day6}\n

Generate cron
    generate a cron       04/09/2559
    generate a cron       04/10/2559

