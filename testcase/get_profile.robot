*** Settings ***
Resource            ../resource/imports.robot
Variables           ../resource/testdata/test_data.yaml
Resource            ../keyword/api/getdata.robot

*** Test Cases ***
Scenario: Get Success Data
    Get User Profile Data

Scenario: Get Unsuccess Data
    Get Not Found User Profile Data
