*** Settings ***
Resource            ../../resource/imports.robot
Variables           ../../resource/testdata/test_data.yaml
Variables           ../../resource/common_configs.yaml

*** Keywords ***
Check Get Data
    [Arguments]     ${actual_code}      ${response.json()}
    should be equal     ${actual_code}     ${http_status_codes.ok}
    Should Be Equal As Strings   ${data_id.id}   ${response.json()}[data][id]
    Should Be Equal As Strings   ${data_id.email}   ${response.json()}[data][email]
    Should Be Equal As Strings   ${data_id.first_name}   ${response.json()}[data][first_name]
    Should Be Equal As Strings   ${data_id.last_name}   ${response.json()}[data][last_name]
    Should Be Equal As Strings   ${data_id.avatar}   ${response.json()}[data][avatar]