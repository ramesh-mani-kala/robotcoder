*** Settings ***
Documentation     A test suite with a single test for opening a new tab.
...               Created using Robot Framework and SeleniumLibrary.
Library           SeleniumLibrary    timeout=10

*** Variables ***
${BROWSER}        Chrome
${SLEEP}          10
${SEARCH_TERM}    Robot Framework

*** Test Cases ***
New Tab Test
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --disable-gpu

    # Create WebDriver with Options
    ${driver}=    Create WebDriver    Chrome    options=${options}

    # Open Google Homepage
    Go To    https://www.google.com

    # Search for the term
    Input Text    name=q    ${SEARCH_TERM}
    Press Keys    name=q    ENTER
    Sleep    3

    # Close Browser
    Close Browser
