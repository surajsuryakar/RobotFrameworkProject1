*** Settings ***
Library    SeleniumLibrary

Suite Setup    Log    Inside suite setup...
Test Setup    Log    Inside testcase setup..
Test Teardown    Log    Inside testcase teardown..
Suite Teardown    Log    Inside suite teardown...

Default Tags    Default


*** Variables ***
${UrlOrange}    https://opensource-demo.orangehrmlive.com/
@{ListCredOrange}    Admin    admin123
&{DictionaryCredOrange}    username=Admin    password=admin123


*** Test Cases ***
MyTestCase1
    [Tags]    Tag1
    Set Tags    Default
    Log    Inside 1st test case
    Remove Tags    Tag1
    
MyTestCase2
    Log    Inside 2nd test case
    Set Tags    Tag2
    
MyTestCase3
    Log    Inside 3rd test case

# LogTestCase
    # Log    Welcome to Tieto
    # Log    This use case is executed by %{username} on %{os}
    # Log    ${EXECDIR}${/}Input
    # Log    Current Dir: ${CURDIR}

    
# SeleniumTestCase1
    # Open Browser    https://google.com    chrome
    # Maximize Browser Window
    # Set Selenium Timeout    30
    # Set Browser Implicit Wait    5
    # Input Text    name=q    RPA Robot Framework
    # # Press Keys    name=q    ESC
    # # Press Keys    name=q    ENTER
    # Click Button    name=btnK
    # #Capture Page Screenshot
    # Close Browser
    # Log    Test Completed..
          

# OrangeWebTest
    # [Documentation]    This is a sample login logout test
    # Log    Hiii..
    # OrangeLogin
    # Sleep    1
    # Capture Page Screenshot
    # Scroll Element Into View    id=footer
    # Capture Element Screenshot    class=flot-overlay
    # OrangeLogout
    # Log    Bye..
    
*** Keywords ***
OrangeLogin
    Open Browser    ${UrlOrange}    chrome
    Maximize Browser Window
    Set Selenium Timeout    30
    Set Browser Implicit Wait    5
    Input Text    id=txtUsername    ${ListCredOrange}[0]
    Input Password    id=txtPassword    ${DictionaryCredOrange}[password]
    Click Button    id=btnLogin
    
OrangeLogout
    Click Element    id=welcome
    Click Element    link=Logout
    Close Browser
