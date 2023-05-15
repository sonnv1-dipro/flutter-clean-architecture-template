import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'network_caller.g.dart';

@RestApi(baseUrl: "")
abstract class RetrofitClient<R, P, Q> {
  factory RetrofitClient(Dio dio, {String baseUrl}) = _RetrofitClient<T>;

  @GET("https://httpbin.org/get")
  Future<String> namedExample(
      @Query("apikey") String apiKey,
      @Query("scope") String scope,
      @Query("type") String type,
      @Query("from") int from);

  @PATCH("/tasks/{id}")
  Future<T> updateTaskPart(@Path() String id, @Body() Map<String, dynamic> map);

  @PUT("/tasks/{id}")
  Future<T> updateTask(@Path() String id, @Body() Task task);

  @DELETE("/tasks/{id}")
  Future<T> deleteTask(@Path() String id);

  @POST("/tasks")
  Future<T> post(@Body() P body);
}
