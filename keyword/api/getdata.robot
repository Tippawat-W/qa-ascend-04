*** Settings ***
Resource            ../../resource/imports.robot
Resource            checkdata.robot
Variables           ../../resource/testdata/test_data.yaml
Variables           ../../resource/common_configs.yaml

*** Keyword ***
Get User Profile Data
    create session      GetData      ${base_url.reqres}
    ${response}=    Get On Session     GetData     ${users_id.valid}    expected_status= ${http_status_codes.ok}
    ${actual_code}=    convert to string  ${response.status_code}
    Check Get Data     ${actual_code}     ${response.json()}
    log to console  ${actual_code}
    log to console  ${response.content}

Get Not Found User Profile Data
    create session      GetData      ${base_url.reqres}
    ${response}=    Get On Session     GetData     ${users_id.invalid}    expected_status= ${http_status_codes.not_found}
    ${actual_code}=    convert to string  ${response.status_code}
    log to console  ${actual_code}
    log to console  ${response.content}