*** Settings ***
Library  SeleniumLibrary


*** Variables ***

${BROWSER} =  chrome

*** Keywords ***
Begin Web test
    Open browser  about:blank  ${BROWSER}


End Web test
    close browser