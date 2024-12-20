*** Settings ***
Resource  resource.robot
Suite Setup      Open And Configure Browser
Suite Teardown   Close Browser
Test Setup       Reset References

*** Test Cases ***
Page should contain a dropdown for selecting reference type
    Go To Main Page
    Click Dropdown  type
    Page Should Contain  Misc
    Page Should Contain  Article
    Page Should Contain  Book

Selecting reference
    Go To Main Page 
    Click Dropdown  type
    Select Type  type  article
    Click Button  Go
    Page Should Contain  volume
    Go To Main Page 
    Click Dropdown  type
    Select Type  type  misc
    Click Button  Go
    Page Should Contain  howpublished
    Go To Main Page 
    Click Dropdown  type
    Select Type  type  book
    Click Button  Go
    Page Should Contain  publisher

Adding a valid article reference
    Go To Main Page
    Click Dropdown  type
    Select Type  type  article
    Click Button  Go
    Set Author  Allan Collins and John Seely Brown and Ann Holum
    Set Title  Cognitive apprenticeship: making thinking visible
    Set Journal  American Educator
    Set Year  1991
    Set Volume  50
    Set Number  2
    Submit New Reference
    Adding A Valid Reference Should Succeed With Message  Successfully added reference Cognitive apprenticeship: making thinking visible
    Page Should Contain  Allan Collins and John Seely Brown and Ann Holum, Cognitive apprenticeship: making thinking visible, American Educator, vol. 50, no. 2, 1991

Adding a valid misc type reference
    Go To Main Page
    Click Dropdown  type
    Select Type  type  misc
    Click Button  Go
    Set Author  Allan Collins and John Seely Brown and Ann Holum
    Set Title  Cognitive apprenticeship: making thinking visible
    Set Year  1991
    Set Howpublished  Web
    Set Note  Translated to english
    Submit New Reference
    Adding A Valid Reference Should Succeed With Message  Successfully added reference Cognitive apprenticeship: making thinking visible
    Page Should Contain  Allan Collins and John Seely Brown and Ann Holum, Cognitive apprenticeship: making thinking visible, Web, Translated to english, 1991

Adding a valid book type reference
    Go To Main Page
    Click Dropdown  type
    Select Type  type  book
    Click Button  Go
    Set Author  Allan Collins and John Seely Brown and Ann Holum
    Set Title  Cognitive apprenticeship: making thinking visible
    Set Year  1991
    Set Publisher  Penguin Classics
    Submit New Reference
    Adding A Valid Reference Should Succeed With Message  Successfully added reference Cognitive apprenticeship: making thinking visible
    Page Should Contain  Allan Collins and John Seely Brown and Ann Holum, Cognitive apprenticeship: making thinking visible, Penguin Classics, 1991

Adding a reference with invalid year
    Go To Main Page
    Click Dropdown  type
    Select Type  type  article
    Click Button  Go
    Set Author  Allan Collins and John Seely Brown and Ann Holum
    Set Title  Cognitive apprenticeship: making thinking visible
    Set Journal  American Educator
    Set Year  nineteen ninety-one
    Submit New Reference
    Adding An Invalid Reference Should Fail With Message  Adding was unsuccessful. Invalid year.

Adding a reference with invalid pages pertinent
    Go To Main Page
    Click Dropdown  type
    Select Type  type  article
    Click Button  Go
    Set Author  Allan Collins and John Seely Brown and Ann Holum
    Set Title  Cognitive apprenticeship: making thinking visible
    Set Journal  American Educator
    Set Year  1991
    Set Pages Pertinent    kaksi
    Submit New Reference
    Adding An Invalid Reference Should Fail With Message  Invalid pages pertinent

Adding a reference with invalid pages pertinent format, letters last
    Go To Main Page
    Click Dropdown  type
    Select Type  type  article
    Click Button  Go
    Set Author  Allan Collins and John Seely Brown and Ann Holum
    Set Title  Cognitive apprenticeship: making thinking visible
    Set Journal  American Educator
    Set Year  1991
    Set Pages Pertinent    215-kolme
    Submit New Reference
    Adding An Invalid Reference Should Fail With Message  Invalid pages pertinent

Adding a reference with invalid pages pertinent format, letters first
    Go To Main Page
    Click Dropdown  type
    Select Type  type  article
    Click Button  Go
    Set Author  Allan Collins and John Seely Brown and Ann Holum
    Set Title  Cognitive apprenticeship: making thinking visible
    Set Journal  American Educator
    Set Year  1991
    Set Pages Pertinent    kolme-215
    Submit New Reference
    Adding An Invalid Reference Should Fail With Message  Invalid pages pertinent

*** Keywords ***
Adding A Valid Reference Should Succeed With Message
    [Arguments]  ${message}
    Main Page Should Be Open
    Page Should Contain  ${message}

Adding An Invalid Reference Should Fail With Message
    [Arguments]  ${message}
    Add Reference Page Should Be Open
    Page Should Contain  ${message}
