class AuthenticationException implements Exception{
  final String message;

  AuthenticationException({this.message = 'Unknown error occurred. '});
}