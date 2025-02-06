*** Settings ***
Documentation     A test suite with a single test for New Tab
Library           SeleniumLibrary    timeout=10

*** Variables ***
${BROWSER}    chrome
${SLEEP}      10

*** Test Cases ***
New Tab Test
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --disable-gpu
    Open Browser    https://www.google.com    ${BROWSER}    options=${options}

    # Ensure page is loaded properly before interacting
    Wait Until Page Contains Element    xpath=//input[@name='q']    timeout=10

    # Perform a Google Search for testing purposes
    Input Text    xpath=//input[@name='q']    Robot Framework
    Press Keys    xpath=//input[@name='q']    ENTER

    # Wait for results and click first result
    Wait Until Element Is Visible    xpath=//h3[@class="LC20lb"]    timeout=5
    Click Element    xpath=//h3[@class="LC20lb"]

    # Wait for an SVG element to load (if applicable)
    Wait Until Element Is Visible    xpath=//svg    timeout=5
    Click Element    xpath=//svg

    Sleep    5
    Close Browser
