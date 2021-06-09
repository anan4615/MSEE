*** Settings ***
Resource  ../Resources/Page Object/slateformpage.robot

*** Variables ***

*** Keywords ***


Open Slate form
    slateformpage.Load
    slateformpage.maximize window
    slateformpage.verify page loaded
Choose a Course
    [Arguments]  ${course_no}
    slateformpage.Select a course  ${course_no}



Input personal info
    [Arguments]  ${data}
    slateformpage.Enter Mandatory information   ${data}
    slateformpage.Users should be able to select Date of Birth
    slateformpage.Users should be able to input phone number


Verify Tuition
    slateformpage.The total cost for this course must match with tuition

Click Enroll and Pay
    slateformpage.Users should be able to click enroll and pay button to go to the payment page
