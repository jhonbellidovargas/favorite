class ErrorResponse {
  final int statusCode;
  final String message;

  ErrorResponse({required this.statusCode, required this.message});

  static get unknown =>
      ErrorResponse(message: "Unknown error", statusCode: 406);
  static get network =>
      ErrorResponse(message: "Connection error", statusCode: 500);
  static get notFound =>
      ErrorResponse(message: "No encontrado", statusCode: 404);
}
