class AppResponse<T> {
  final bool isSuccess;
  final String? message;
  final T? data;
  final T Function(Map<String, dynamic>)? converter;

  AppResponse({
    required this.isSuccess,
    this.message,
    this.data,
    this.converter,
  });
}
