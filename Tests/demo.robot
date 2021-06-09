*** Settings ***
Documentation  User fills slate form
Resource  ../Resources/Datamanager.robot
Resource  ../Resources/slate.robot
Resource  ../Resources/welcomepayment.robot
Resource  ../Resources/common.robot
Test Setup  common.Begin Web test
Test Teardown  common.End Web test


*** Variables ***

# robot -d results tests/demo.robot
${credentials_instate_CSV} =  C:\\development\\robot-scripts\\MSEECSV\\Data\\instate.csv
${credentials_outstate_CSV} =  C:\\development\\robot-scripts\\MSEECSV\\Data\\outstate.csv
${credentials_international_CSV} =  C:\\development\\robot-scripts\\MSEECSV\\Data\\international.csv
${course1} =  form_000164e3-6f86-9af7-74c7-62f0c65937aa_1
${course2} =  form_000164e3-6f86-9af7-74c7-62f0c65937aa_2
${course3} =  form_000164e3-6f86-9af7-74c7-62f0c65937aa_3

*** Test Cases ***




Instate User enters Personal,citizenship information and clicks on enroll and pay button in the slate form
    [Documentation]   This test verifies the ability of the instate user to enter his personal information
    [Tags]  smoke regression
    ${scenarios} =  Datamanager.Get CSV data  ${credentials_instate_CSV}
    slate.Open Slate form
    slate.choose a course  ${course1}
    slate.Input personal info  ${scenarios}
    slate.Verify Tuition
    slate.Click Enroll and Pay

#comment: click submit payment link
    welcomepayment.Open welcome payment page
    welcomepayment.Click Submit payment link

Outstate User enters Personal,citizenship information and clicks on enroll and pay button in the slate form
    [Documentation]   This test verifies the ability of the  out of state user to enter his personal information
    [Tags]  smoke regression
    ${scenarios} =  Datamanager.Get CSV data  ${credentials_outstate_CSV}
    slate.Open Slate form
    slate.choose a course  ${course2}
    slate.Input personal info  ${scenarios}
    slate.Verify Tuition
    slate.Click Enroll and Pay
#comment: click submit payment link
    welcomepayment.Open welcome payment page
    welcomepayment.Click Submit payment link

International User enters Personal,citizenship information and clicks on enroll and pay button in the slate form
    [Documentation]   This test verifies the ability of the international user to enter his personal information
    [Tags]  smoke regression
    ${scenarios} =  Datamanager.Get CSV data  ${credentials_international_CSV}
    slate.Open Slate form
    slate.choose a course  ${course3}
    slate.Input personal info  ${scenarios}
    slate.Verify Tuition
    slate.Click Enroll and Pay
#comment: click submit payment link
    welcomepayment.Open welcome payment page
    welcomepayment.Click Submit payment link