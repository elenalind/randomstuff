Step 1. pip install robot framework and the ssh library in this case.

sudo pip install robotframework
sudo pip install robotframework-sshlibrary

Step 2. Create a text file with the test case/s to be run. You can use prefedined keywords or create your own.

ecrehar@elxahkpv4m2:~/robot/me$ cat lshw_test.robot 
*** Settings ***
Documentation          I ssh to a node and check the out of lshw command.
...                    A particular PCI address should be in the output.

Library                SSHLibrary
Suite Setup            Open Connection And Log In
Suite Teardown         Close All Connections

*** Variables ***
${HOST}                80.80.80.7
${USERNAME}            ecrehar
${PASSWORD}            **

*** Test Cases ***
Check that the pci address of NIC is the expected one
    [Documentation]    In this test I ssh to a node and run lshw command.
    ...                In the ouput I should find a particular PCI address.
    ${output}=         Execute Command  lshw -businfo -C network
    Should Contain     ${output}        pci@0000:3a:00.0

*** Keywords ***
Open Connection And Log In
   Open Connection     ${HOST}
   Login               ${USERNAME}        ${PASSWORD}

Step 3. Run the test and check the result and logs. nice html reports. https://tinyurl.com/yb2s9zr2

ecrehar@elxahkpv4m2:~/robot/me$ robot lshw_test.robot 
==============================================================================
Lshw Test :: I ssh to a node and check the out of lshw command.               
==============================================================================
Check that the pci address of NIC is the expected one :: In this t... | PASS |
------------------------------------------------------------------------------
Lshw Test :: I ssh to a node and check the out of lshw command.       | PASS |
1 critical test, 1 passed, 0 failed
1 test total, 1 passed, 0 failed
==============================================================================
Output:  /home/ecrehar/robot/me/output.xml
Log:     /home/ecrehar/robot/me/log.html
Report:  /home/ecrehar/robot/me/report.html
ecrehar@elxahkpv4m2:~/robot/me$ 
