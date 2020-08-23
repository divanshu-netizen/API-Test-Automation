*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${base_url}  https://jsonplaceholder.typicode.com

*** Test Cases ***
PutRequest
    create session  mysession  ${base_URL}
    ${body}=  create dictionary  id=1  title=abc  body=xyz  userId=1
    ${header}=  create dictionary  Content-Type=application/json; charset=utf-8
    ${response}=  put request  mysession  /posts/1  data=${body}  headers=${header}

    log to console  ${response.status_code}
    # Validations of Status Code
    ${status_code}=  convert to string  ${response.status_code}
    should be equal  ${status_code}  200

Validations_UpdatedRecord
    create session  mysession  ${base_URL}
    ${body}=  create dictionary  id=1  title=abc  body=xyz  userId=1
    ${header}=  create dictionary  Content-Type=application/json; charset=utf-8
    ${response}=  put request  mysession  /posts/1  data=${body}  headers=${header}
    ${response_body}=  convert to string  ${response.content}
    should contain  ${response_body}  abc

