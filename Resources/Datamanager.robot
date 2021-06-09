*** Settings ***
Documentation  use this layer to get data from external files
Library  ../CustomLibs/readcsv.py
*** Keywords ***
Get CSV data
    [Arguments]  ${filepath}
    ${Data} =  read csv file   ${filepath}
    [Return]  ${Data}
