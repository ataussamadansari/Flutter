class ApiConstants
{
    static const String baseUrl = "https://jsonplaceholder.typicode.com";
    static const String apiVersion = "/v1";
    static const String fullBaseUrl = "$baseUrl$apiVersion";

    //EndPoints
    static const String users = "/users";
    static const String api2 = "/endpoints2";
    static const String api3 = "/endpoints3";

    // Headers
    static const String contentType = "application/json";
    static const String authorization = "Authorization";
    static const String acceptLanguage = "Accept-Language";

    // Timeouts
    static const int connectTimeout = 30000;
    static const int receiveTimeout = 30000;
    static const int sendTimeout = 30000;
}
