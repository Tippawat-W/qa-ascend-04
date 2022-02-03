*** Settings ***
Library    Selenium2Library
Library     JSONLibrary
Library     Collections
Resource    resource.robot

*** Test Cases ***
Getdata
    Get Uesr Profile Data

Not Found Profile
    Page Error 404