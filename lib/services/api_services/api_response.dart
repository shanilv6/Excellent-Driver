class APIResponse<T> {
  T data;
  bool error;
  String errorMessage;

  APIResponse({required this.data,required this.error,required this.errorMessage});
}
