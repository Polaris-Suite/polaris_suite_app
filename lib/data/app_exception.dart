class AppException implements Exception {
  final _message;
  final _prefix;

  AppException(this._message, this._prefix);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataExcetion extends AppException {
  FetchDataExcetion(String? message)
      : super(message, 'Error During Communication');
}

class BadRequestException extends AppException {
  BadRequestException(String? message) : super(message, 'Invalid Request');
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException(String? message)
      : super(message, 'Unauthorized Request');
}

class InvalidInputException extends AppException {
  InvalidInputException(String? message) : super(message, 'Invalid Input');
}
