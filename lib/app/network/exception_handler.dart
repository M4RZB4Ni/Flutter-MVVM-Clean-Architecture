import 'package:freezed_annotation/freezed_annotation.dart';
part 'exception_handler.freezed.dart';

@freezed
class ExceptionHandler with _$ExceptionHandler {
  const factory ExceptionHandler.requestCancelled() = RequestCancelled;

  const factory ExceptionHandler.unauthorizedRequest(final String message) =
      UnauthorizedRequest;

  const factory ExceptionHandler.socketIoError(final String message) =
      SocketIoError;

  const factory ExceptionHandler.badRequest() = BadRequest;

  const factory ExceptionHandler.notFound(final String reason) = NotFound;

  const factory ExceptionHandler.methodNotAllowed() = MethodNotAllowed;

  const factory ExceptionHandler.notAcceptable() = NotAcceptable;

  const factory ExceptionHandler.requestTimeout() = RequestTimeout;

  const factory ExceptionHandler.sendTimeout() = SendTimeout;

  const factory ExceptionHandler.conflict() = Conflict;

  const factory ExceptionHandler.internalServerError() = InternalServerError;

  const factory ExceptionHandler.notImplemented() = NotImplemented;

  const factory ExceptionHandler.serviceUnavailable() = ServiceUnavailable;

  const factory ExceptionHandler.noInternetConnection() = NoInternetConnection;

  const factory ExceptionHandler.formatException() = FormatException;

  const factory ExceptionHandler.badGateway() = BadGateWay;

  const factory ExceptionHandler.gatewayTimeout() = GatewayTimeout;

  const factory ExceptionHandler.networkAuthRequired() = NetworkAuthRequired;

  const factory ExceptionHandler.forbidden() = Forbidden;

  const factory ExceptionHandler.unableToProcess() = UnableToProcess;

  const factory ExceptionHandler.defaultError(final String error) =
      DefaultError;

  const factory ExceptionHandler.unexpectedError() = UnexpectedError;

  const factory ExceptionHandler.wrongVerification() = WrongVerification;

  const factory ExceptionHandler.invalidEmail() = InvalidEmail;

  const factory ExceptionHandler.wrongPassword() = WrongPassword;

  const factory ExceptionHandler.userNotFound() = UserNotFound;

  const factory ExceptionHandler.userDisabled() = UserDisabled;

  const factory ExceptionHandler.tooManyRequests() = TooManyRequests;

  const factory ExceptionHandler.operationNotAllowed() = OperationNotAllowed;

  const factory ExceptionHandler.emailAlreadyExists() = EmailAlreadyExists;

  const factory ExceptionHandler.customTokenMismatch() = CustomTokenMismatch;

  const factory ExceptionHandler.invalidCustomToken() = InvalidCustomToken;

  const factory ExceptionHandler.undefined() = undefined;

  const factory ExceptionHandler.preConditionError() = UserRegisterBefore;

  static String getErrorMessage(
    final ExceptionHandler exceptionHandler, {
    final bool showInLog = true,
    final dynamic stackTrace,
  }) {
    var errorMessage = '';
    exceptionHandler.when(
      notImplemented: () {
        errorMessage = 'Not Implemented';
      },
      requestCancelled: () {
        errorMessage = 'Request Cancelled';
      },
      internalServerError: () {
        errorMessage = 'Internal Server Error';
      },
      notFound: (final String reason) {
        errorMessage = reason;
      },
      serviceUnavailable: () {
        errorMessage = 'Service unavailable';
      },
      methodNotAllowed: () {
        errorMessage = 'Method Allowed';
      },
      badRequest: () {
        errorMessage = 'Bad request';
      },
      unauthorizedRequest: (final String message) {
        errorMessage = message.isEmpty ? 'Unauthorized request' : message;
      },
      unexpectedError: () {
        errorMessage = 'Unexpected error occurred';
      },
      requestTimeout: () {
        errorMessage = 'Connection request timeout';
      },
      noInternetConnection: () {
        errorMessage = 'No internet connection';
      },
      conflict: () {
        errorMessage = 'Error due to a conflict';
      },
      sendTimeout: () {
        errorMessage = 'Send timeout in connection with API server';
      },
      unableToProcess: () {
        errorMessage = 'Unable to process the data';
      },
      defaultError: (final String error) {
        errorMessage = error;
      },
      formatException: () {
        errorMessage = 'Unexpected error occurred';
      },
      notAcceptable: () {
        errorMessage = 'Not acceptable';
      },
      socketIoError: (final String message) {
        errorMessage = 'Socket Connection Error';
      },
      networkAuthRequired: () {
        errorMessage = 'Unable to process the data';
      },
      badGateway: () {
        errorMessage = 'Bad Gateway';
      },
      forbidden: () {
        errorMessage = 'Forbidden access';
      },
      gatewayTimeout: () {
        errorMessage = 'Forbidden';
      },
      operationNotAllowed: () {
        errorMessage = 'Signing in with number and Password is not enabled.';
      },
      customTokenMismatch: () {
        errorMessage = 'customTokenMismatch';
      },
      emailAlreadyExists: () {
        errorMessage =
            'The email has already been registered. Please login or reset your password.';
      },
      tooManyRequests: () {
        errorMessage = 'Too many requests. Try again later.';
      },
      wrongVerification: () {
        errorMessage = 'Wrong code. Please try again.';
      },
      invalidCustomToken: () {
        errorMessage = 'invalidCustomToken';
      },
      invalidEmail: () {
        errorMessage = 'Your email address appears to be malformed.';
      },
      undefined: () {
        errorMessage = 'An undefined Error happened.';
      },
      userNotFound: () {
        errorMessage = 'Invalid phone number. Please try again.';
      },
      userDisabled: () {
        errorMessage = 'User with this number has been disabled.';
      },
      wrongPassword: () {
        errorMessage = 'Your password is wrong.';
      },
      preConditionError: () {
        errorMessage =
            'This phone number already has been registered, Please try again.';
      },
    );

    return errorMessage;
  }

  factory ExceptionHandler.handleResponse(final int error, {stackTrace}) {
    switch (error) {
      case 400:
        return const ExceptionHandler.badRequest();

      case 401:
        return const ExceptionHandler.unauthorizedRequest('Please Check Token');
      case 403:
        return const ExceptionHandler.forbidden();
      case 404:
        return const ExceptionHandler.notFound(
            'Route Not found, Check your address');
      case 405:
        return const ExceptionHandler.methodNotAllowed();
      case 409:
        return const ExceptionHandler.conflict();
      case 408:
        return const ExceptionHandler.requestTimeout();
      case 412:
        return const ExceptionHandler.preConditionError();
      case 500:
        return const ExceptionHandler.internalServerError();
      case 501:
        return const ExceptionHandler.notImplemented();
      case 502:
        return const ExceptionHandler.badGateway();
      case 503:
        return const ExceptionHandler.serviceUnavailable();
      case 504:
        return const ExceptionHandler.gatewayTimeout();
      case 511:
        return const ExceptionHandler.networkAuthRequired();
      default:
        return const ExceptionHandler.unexpectedError();
      // return ExceptionHandler.defaultError(
      //   'Received invalid status code: $responseCode',
      // );
    }
  }

  // factory ExceptionHandler.getException(final Exception error,
  //     {required dynamic stackTrace}) {
  //   debugPrint('low level error--> ${error}');
  //
  //
  //
  //
  //
  // }
}
