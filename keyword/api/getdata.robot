*** Settings ***
Resource            ../../resource/imports.robot

*** Keyword ***
User has ${case} requset to get profile data
    Set Test Variable    ${user_id}    ${users_id.${case}}

Get User Profile Data
    create session      GetData      ${base_url.reqres}
    ${response}=    Get On Session     GetData     ${get_profile_data_url}${user_id}    expected_status=any
    Set Test Variable   ${response}

Varify get user profile response success
    Should Be Equal As Strings   ${http_status_codes.ok}     ${response.status_code}
    Should Be Equal As Strings   ${data_id.id}   ${response.json()}[data][id]
    Should Be Equal As Strings   ${data_id.email}   ${response.json()}[data][email]
    Should Be Equal As Strings   ${data_id.first_name}   ${response.json()}[data][first_name]
    Should Be Equal As Strings   ${data_id.last_name}   ${response.json()}[data][last_name]
    Should Be Equal As Strings   ${data_id.avatar}   ${response.json()}[data][avatar]

Varify get user profile response not found
    Should Be Equal As Strings   ${http_status_codes.not_found}     ${response.status_code}
    Should Be Equal As Strings   {}     ${response.content}