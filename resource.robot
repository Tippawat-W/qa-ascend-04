*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections


*** Variables ***
${base_url}    https://reqres.in/


*** Keyword ***
Get Uesr Profile Data
    create session      GetData      ${base_url}
    ${response}=    Get On Session     GetData     api/users/12    expected_status=200
    ${actual_code}=    convert to string  ${response.status_code}

    should be equal     ${actual_code}     200
    Should Be Equal As Strings   12   ${response.json()}[data][id]
    Should Be Equal As Strings   rachel.howell@reqres.in   ${response.json()}[data][email]
    Should Be Equal As Strings   Rachel   ${response.json()}[data][first_name]
    Should Be Equal As Strings   Howell   ${response.json()}[data][last_name]
    Should Be Equal As Strings   https://reqres.in/img/faces/12-image.jpg   ${response.json()}[data][avatar]


    log to console  ${actual_code}
    log to console  ${response.content}

Page Error 404
    create session      GetData      ${base_url}
    ${response}=    Get On Session     GetData     api/users/1234    expected_status=404
    ${actual_code}=    convert to string  ${response.status_code}

    should be equal     ${actual_code}     404
    log to console  ${actual_code}
    log to console  ${response.content}