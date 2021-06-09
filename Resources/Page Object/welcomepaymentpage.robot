*** Settings ***
Library  SeleniumLibrary
Library  String
*** Keywords ***


Maximize Window
    Maximize Browser Window
Verify Page Loaded
    Wait until page contains  Welcome to CU Boulder!




#click submit payment
Click Submit payment
    sleep  3s
    click link  Submit Payment


    ${pay_url}=   Get Location
    @{link} =    Split String   ${pay_url}  /
    ${len} =  get length  ${link}

    ${str} =  Replace String  ${pay_url}  @{link}[2]  cbo.test.technolutions.net
    Go To  ${str}
    Wait until page contains  Submit Payment


    ${amount} =  get text  css=#content > table > tbody > tr:nth-child(3) > td
    ${course} =  get text  css=#content > table > tbody > tr:nth-child(2) > td

    run keyword and continue on failure  should be equal  ${tuition1}   ${amount}
    log to console  Sucesss amount matches
    run keyword and continue on failure  should be equal  ${course_name1}   ${course}
    log to console  Sucesss course name matches
    click button  xpath=//*[@id="content"]/form/div/button