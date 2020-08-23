*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Variables ***
${base_url}  https://jsonplaceholder.typicode.com

*** Test Cases ***
CreateUser
    create session  mysession  ${base_URL}
    ${body}=  create dictionary  title=foo  body=bar  userId=1
    ${header}=  create dictionary  Content-Type=application/json; charset=utf-8
    ${response}=  post request  mysession  /posts  data=${body}  headers=${header}

    log to console  ${response.status_code}
    # Validations of Status Code
    ${status_code}=  convert to string  ${response.status_code}
    should be equal  ${status_code}  201


Record_Validations
    create session  mysession  ${base_URL}
    ${body}=  create dictionary  title=foo  body=bar  userId=1
    ${header}=  create dictionary  Content-Type=application/json; charset=utf-8
    ${response}=  post request  mysession  /posts  data=${body}  headers=${header}
    ${response_body}=  convert to string  ${response.content}
    should contain  ${response_body}  bar
    #should contain  ${response_body}  2020-08-17T16:30:04.988Z

