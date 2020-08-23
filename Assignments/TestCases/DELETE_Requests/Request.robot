*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${base_url}  https://jsonplaceholder.typicode.com

*** Test Cases ***
DeleteUser
    create session  mysession  ${base_url}
    ${response}  delete request  mysession  /posts/1

    log to console  ${response.status_code}
    ${status_code}  convert to string  ${response.status_code}
    should be equal  ${status_code}  200

Response_Verification
    create session  mysession  ${base_url}
    ${response}  delete request  mysession  /posts/1
    ${response_body}=  convert to string  ${response.content}
    should contain  ${response_body}  {}