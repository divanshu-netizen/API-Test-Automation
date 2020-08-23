*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  JSONLibrary

*** Variables ***
${base_url}  https://jsonplaceholder.typicode.com

*** Test Cases ***
TC_StatusCode_Validation
    create session  mysession  ${base_url}
    ${response}  get request  mysession  /posts/1

    log to console  ${response.status_code}

    ${status_code}  convert to string  ${response.status_code}
    should be equal  ${status_code}  200

TC_Record_Validation
    create session  mysession  ${base_url}
    ${response}  get request  mysession  /posts/1



    ${json_object}  to json  ${response.content}
    log to console  ${response.content}

    ${json_length}  get length  ${json_object}
    log to console  ${json_length}



TC_Id_validation
    create session  mysession  ${base_url}
    ${response}  get request  mysession  /posts/1
    ${response_body}=  convert to string  ${response.content}
    should contain  ${response_body}  1

