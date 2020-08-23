*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  JSONLibrary

*** Variables ***
${base_url}  https://jsonplaceholder.typicode.com/invalidposts

*** Test Cases ***
InvalidRequests
    create session  mysession  ${base_url}
    ${response}  get request  mysession  /invalidposts

    log to console  ${response.status_code}
    ${status_code}  convert to string  ${response.status_code}
    should be equal  ${status_code}    404