*** Settings ***
Documentation     A test suite with a single test for New Tab
...               Created by hats' Robotcorder
Library           SeleniumLibrary    timeout=10

*** Variables ***
${BROWSER}    chrome
${SLEEP}      10

*** Test Cases ***
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --disable-gpu
    Open Browser    https://docs.google.com/spreadsheets/d/1nwvv46OnptzdxYzpQSj5_yePqo4HnEx-eOL6dh60Bys/edit?gid=1981353702#gid=1981353702    ${BROWSER}    options=${options}
    Wait Until Element Is Visible    xpath=(//span)[10]    timeout=5
    Click Element    xpath=(//span)[10]
    Wait Until Element Is Visible    xpath=(//span)[14]    timeout=5
    Click Element    xpath=(//span)[14]
    Close Browser
