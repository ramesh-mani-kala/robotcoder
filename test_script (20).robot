*** Settings ***
Documentation     A test suite with a single test for New Tab
...               Created by hats' Robotcorder
Library           SeleniumLibrary    timeout=10

*** Variables ***
${BROWSER}    chrome
${SLEEP}      10

*** Test Cases ***
New Tab test
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --disable-gpu
    Open Browser    https://guru99.com    ${BROWSER}    options=${options}
    Wait Until Element Is Visible    xpath=//td[@id="gs_tti50"]    timeout=5
    Click Element    xpath=//td[@id="gs_tti50"]
  # Input Text    name=q   //input[@name="search"]    Wait Until Element Is Visible    xpath=//input[@name="search"]    timeout=5
  # Input Text    //input[@name="search"]    testing
  #   Wait Until Element Is Visible    xpath=//button[@class="gsc-search-button    timeout=5
  #   Click Element    xpath=//button[@class="gsc-search-button
  #   Close Browser
