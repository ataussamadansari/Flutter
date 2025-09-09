import 'dart:convert';

import 'package:api_with_getx/app/data/models/response_model.dart';
import 'package:api_with_getx/app/data/providers/api_provider.dart';
import 'package:dio/dio.dart';

class ApiServices
{
    final ApiProvider _apiProvider = ApiProvider();

    // generic method to handle API calls
    Future<ApiResponse<T>> handleApiCall<T>(
        Future<Response> Function() apiCall,
        T Function(dynamic) fromJson
    ) async
    {
        try
        {
            final response = await apiCall();

            if (response.statusCode == 200 || response.statusCode == 201) 
            {
                final data = fromJson(response.data);
                return ApiResponse.success(data);
            }
            else 
            {
                return ApiResponse.error(
                    "Request failed with status: ${response.statusCode}",
                    statusCode: response.statusCode
                );
            }
        }
        on DioException catch (e)
        {
            return ApiResponse.error(
                e.message ?? "Network error occurred",
                statusCode: e.response?.statusCode
            );
        }
        catch (e)
        {
            return ApiResponse.error("Unexpected error: $e");
        }
    }

    // generic method to handle List API calls
    Future<ApiResponse<List<T>>> handleListApiCall<T>(
        Future<Response> Function() apiCall,
        T Function(Map<String, dynamic>) fromJson,
        ) async {
      try {
        final response = await apiCall();

        if (response.statusCode == 200 || response.statusCode == 201) {
          final List<dynamic> jsonList = response.data;
          final List<T> dataList = jsonList.map((json) => fromJson(json as Map<String, dynamic>)).toList();
          return ApiResponse.success(dataList);
        } else {
          return ApiResponse.error(
            "Request failed with status: ${response.statusCode}",
            statusCode: response.statusCode,
          );
        }
      } on DioException catch (e) {
        return ApiResponse.error(
          e.message ?? "Network error occurred",
          statusCode: e.response?.statusCode,
        );
      } catch (e) {
        return ApiResponse.error("Unexpected error: $e");
      }
    }

    // specific GET method for API calls
    Future<ApiResponse<T>> get<T>(
        String endPint,
        T Function(dynamic) fromJson, {
            Map<String, dynamic>? queryParameters,
            CancelToken? cancelToken
        }) async
    {
      return handleApiCall<T> (
          () => _apiProvider.get(
              endPint,
              queryParameters: queryParameters,
              cancelToken: cancelToken
          ),
          fromJson
      );
    }


  // specific GET method for List
  
}
