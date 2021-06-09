*** Settings ***
Resource  ../Resources/Page Object/welcomepaymentpage.robot
Resource  ../Resources/Page Object/slateformpage.robot



*** Keywords ***
Open welcome payment page

    welcomepaymentpage.maximize window
    welcomepaymentpage.verify page loaded


Click Submit payment link


    welcomepaymentpage.Click Submit payment