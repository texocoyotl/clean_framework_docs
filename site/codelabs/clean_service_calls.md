summary: Clean - Creating a Service Call
id: clean_service_calls
categories: Flutter
tags: REST, REST Service, API, API Service, Flutter, Service, Clean Service
status:  Active
authors: Eric Narvaez


# Clean - Creating a Service Call

## Prepare
Before to create your first service call, you need to know below informations:
- Base url, endpoint path, HTTP method, request query/body
- Response contentType, response structure(for JSON)

## Implement JsonRequestModel
You need to implement your request model with parameters and toJson function. The toJson function is used for request body of post, put & patch method.

    class DemoRequestModel implements JsonRequestModel {
        final String accountId;

        DemoRequestModel({this.accountId}) : assert(() {
            return accountId != null && accountId.isNotEmpty;
        }());

        Map<String, dynamic> toJson() {
            Map<String, dynamic> data = {"accountId": accountId};
            return data;
        }
    }

## Implement JsonResponseModel
JsonResponseModel defined with EquatableMixin, so you have to import Equatable first. And then implement your response model with parameters and fromJson constructor. 

    class DemoResponseModel extends Equatable implements JsonResponseModel {
        final String accountId;

        DemoResponseModel(this.accountId) : assert(() {
            return accountId != null && accountId.isNotEmpty;
        }());

        @override
        List<Object> get props => [this.accountId];

        DemoResponseModel.fromJson(Map<String, dynamic> json)
            : accountId = json['accountId'] ?? "";
    }


## Inherit from EitherService
To create your service class, you need to extend EitherService and 2 generic types from JsonRequestModel & JsonResponseModel. 

    class DemoService extends EitherService<DemoRequestModel, DemoResponseModel> {
        DemoService({RestApi restApi}) : super(
            method: RestMethod.get,
            restApi: restApi,//extends from RestApi, RestApi is a class of Clean_Framework 
            path: "/demo");
    }


## Override parseResponse
In most of cases, you need to override parseResponse for EitherService to parse JSON objct(Map<String, dynamic>) to your ResponseModel. 

    @override
    DemoResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
        return DemoResponseModel.fromJson(jsonResponse);
    }


## Handle onError
EitherService will invoke onError function if the response code is not 200 or 201. To handle those situations, you need to override onError function. Then you can find the failure object in response.

    @override
    ServiceFailure onError(RestResponseType responseType, Map<String, dynamic> jsonResponse) {
        if (responseType == RestResponseType.unauthorized)
            return TokenInvalidServiceFailure();//this is a sub type of GeneralServiceFailure
        else
            return GeneralServiceFailure();
    }
## How to test
We use [mockito](https://pub.dev/packages/mockito) to mock our unit tests. The key rule is mock everything except the one you want to test/verify. Specific to service, you need to mock RestApi and put it into the service constructor. 

    test('Demo service test', () async {
        final mockedApi = MockApi();
        final service = DemoService(restApi: mockedApi);
        final response = await service.request();
        expect(response, isNotNull);
    });

For different test case, you can mock the RestApi with different response. You can learn how to mock scenariors at [here](../)