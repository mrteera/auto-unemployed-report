*** Settings ***
Library    Selenium2Library

*** Variables ***
${username}       username
${password}       password
${Browser}        Google Chrome
${SiteUrl}        http://empui.doe.go.th

*** Test Cases ***
LoginTest
    Open Browser and Login
    sleep    5s
    [Teardown]    Close Browser

*** Keywords ***
Open Browser and Login
    Open Browser    ${SiteUrl}      ${Browser}
    Input Text    username    ${username}
    Input Text    password    ${password}
    Press Key     password    \\13
