summary: Mockoon - Integration test Service
id: mockoon_create_a_service
categories: flutter
tags: REST, REST Service, API, API Service, Flutter, Service, Mock
status:  Active
authors: Eric Narvaez

# Mockoon - Integration test Service
## Download & install Mockoon App
You can download Mockoon application from [here](https://mockoon.com/#download), and follow the guide to install it on your OS.
![Mockoon launching screen](mockoon_create_a_service/mockoon_launch.jpg)

## Import existing services
Once launch your Mockoon application, click Import/export button on the menu. Then select Mockoon's format -> Import from a file(JSON). And select the **mockoon.json** file under **integration_test** folder.

![Mockoon import menu](mockoon_create_a_service/mockoon_import.jpg)

## Launch the server
After import, you should see an enviroment named HNB(HN) in the slide. Select it and clike the green play button(Start server).

![Mockoon start button](mockoon_create_a_service/mockoon_start.jpg)

## Run integration test
Use the command below to run integration test.

    flutter drive -t integration_test/integration_tests.dart --driver=integration_test/integration_test_driver.dart --flavor qa


## Rules
All services must be arranged in alphabetical order by name. 
## How to search an exists service
Mockoon application does not support search currently. If you need to find out a service in GUI application. Here has 2 scenarios. 
1. You know the service endpoint. Then you need to open the mockoon.json file in any editor and search the endpoint, then you should be able to find out the name of the endpoint. Remember that name and back to Mockoon application and find it out manually, all services are arranged in alphabetical order by name.
2. You know the service name. Then you should be able to find it out from the endpoint list manually, because all services are arranged in alphabetical order by name.
