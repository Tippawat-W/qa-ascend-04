*** Settings ***
Resource            ../resource/imports.robot
Resource            ../keyword/api/getdata.robot

*** Test Cases ***
Scenario: Get Success Data
    Given User has valid requset to get profile data
    When Get User Profile Data
    Then Varify get user profile response success

Scenario: Get Unsuccess Data
    Given User has invalid requset to get profile data
    When Get Not Found User Profile Data
    Then Varify get user profile response unsuccess
