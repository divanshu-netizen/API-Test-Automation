*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  JSONLibrary
Library  JsonValidator

*** Variables ***
${base_url}  https://jsonplaceholder.typicode.com

*** Test Cases ***
TestCase_StatusCode_Validation
    create session  mysession  ${base_url}
    ${response}  get request  mysession  /posts


    log to console  ${response.status_code}

    ${status_code}  convert to string  ${response.status_code}
    should be equal  ${status_code}  200

TestCase_Records_Validation
    create session  mysession  ${base_url}
    ${response}  get request  mysession  /posts

    ${json_object}  to json  ${response.content}
    log to console  ${response.content}


   ${json_length}  get length  ${json_object}
   log to console  ${json_length}









