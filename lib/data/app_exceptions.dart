class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix $_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error During communication');
}

class IntegerDivisionByZeroException extends AppException{
  IntegerDivisionByZeroException([String? message]): super(message, '');
}
