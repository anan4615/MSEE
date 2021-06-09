*** Settings ***
Library  SeleniumLibrary
Library  Dialogs
*** Variables ***

${FORM_URL} =  https://cbo.test.technolutions.net/register/MSEEenrollmentV2
${DOB_month} =  March
${DOB_day} =  25
${DOB_year} =  1988
${phone_number} =  7208971234



*** Keywords ***
Load
    Go To  ${FORM_URL}
Maximize Window
    Maximize Browser Window
Verify Page Loaded
    Wait until page contains  Welcome to CU Boulder!


#update the last number in the id field based to change the course
Select a course
    [Arguments]  ${course}
    click element  id=${course}
    ${course_name} =  get text  id=form_6eae1f48-9baa-4ed3-9736-b4b06f457432
    set global variable  ${course_name1}  ${course_name}

Enter Mandatory information
    [Arguments]   ${mandatory_fields}
    :FOR  ${field}  IN  @{mandatory_fields}
#personal information

    \  Input text  id=form_86a9bc3b-0a24-8cc8-e69a-d88c4ecafe47   ${field[0]}

    \  Input text  id=form_f0833acd-b282-84c3-364e-14532666a1ed   ${field[1]}

    \  Input text  id=form_7a31eeea-89ec-c420-9bb9-4d15c3478817  ${field[2]}

    \  select from list by label  id=form_c43c5715-6e41-51e3-60d9-0b2b4f32191e_country  ${field[3]}

    \  Input text  id=form_c43c5715-6e41-51e3-60d9-0b2b4f32191e_street  ${field[4]}

    \  Input text  id=form_c43c5715-6e41-51e3-60d9-0b2b4f32191e_city  ${field[4]}

    \  select from list by label  id=form_c43c5715-6e41-51e3-60d9-0b2b4f32191e_region  ${field[6]}

    \  Input text  id=form_c43c5715-6e41-51e3-60d9-0b2b4f32191e_postal  ${field[7]}

    \  select from list by label  id=form_bf4cd39f-3ea4-344a-8a97-1a8e9e3e9449  ${field[8]}
    # this has to be updated further(not yet ready)
    \  Run Keyword If  '${field[8]}' == 'Male' and '${field[9]}' == 'United States'    Enable Selective service
    \  select from list by label  id=form_140be1db-2a09-877c-ed38-c359f7f99049  ${field[9]}

     \  Run Keyword If  '${field[9]}' != 'United States'  Enable Permanant resident


Users should be able to select Date of Birth
    select from list by label  id=form_9431eec7-4eef-185e-7287-15b176358ade_m  ${DOB_month}
    select from list by label  id=form_9431eec7-4eef-185e-7287-15b176358ade_d  ${DOB_day}
    select from list by label  id=form_9431eec7-4eef-185e-7287-15b176358ade_y  ${DOB_year}

Users should be able to input phone number

    Input text  id=form_4312a3e3-1b3f-1d01-b1ce-08a6b6f994d0  ${phone_number}

Enable Selective service
    log to console  Enable selective services getting executed
    Page Should Contain Element   xpath=//*[@id="form_bde0e9a1-572b-3dfe-68c4-6f751b17e506"]/div[1]/legend
    ${testing} =  get text  xpath=//*[@id="form_bde0e9a1-572b-3dfe-68c4-6f751b17e506"]/div[1]/legend
    pause execution  Please select your selective service option
    sleep  5s
    log to console   ${testing}

Enable Permanant resident
    log to console  Enable Permanant resident getting executed
    Page Should Contain Element   xpath=//*[@id="form_7e16b508-3e06-4b81-9fc0-61715afe1a86"]
    ${testing1} =  get text  xpath=//*[@id="form_7e16b508-3e06-4b81-9fc0-61715afe1a86"]
    log to console   ${testing1}
    pause execution  Please select your permanant residency status
    sleep  5s
    ${selection} =  run keyword and return status  Radio Button Should Be Set To  form_7e16b508-3e06-4b81-9fc0-61715afe1a86  0

    log to console  ${selection}
    run keyword if  '${selection}' == 'True'  National ID
    ...  ELSE  Social Security number


Social Security number

  Page Should Contain textfield   id=form_e7a85dbe-d0ba-7ce1-7afc-1e076c59c718
  pause execution  Please enter ssn
   sleep  7s
National ID
  Page Should Contain textfield   id=form_08ca9427-e0b7-ce67-1537-63183d96e420
  pause execution  Please enter national ID
   sleep  5s
#comment: match total cost for this course to tuition field
The total cost for this course must match with tuition
    ${total_cost} =  get value  xpath=//*[@id="form_4a7c5c15-aaa9-981d-aa01-554762840ef2"]
     #to print text
     log to console  total cost
     #to print value of the variable
      log to console    ${total_cost}


     ${tuition} =  get text  id=payment_display_form_3f9bbf64-3bef-32dd-f9b6-ff719bd42050
     set global variable  ${tuition1}  ${tuition}

     log to console  tuition cost
     log to console   ${tuition}
     should be equal   ${total_cost}    ${tuition}
     log to console  Sucesss tuition matches






#enroll and pay
Users should be able to click enroll and pay button to go to the payment page
    Click button  css=#form_69032c1d-6e6c-4bfe-f3b4-85e3b47017e8_container > div.action.form_action > button

