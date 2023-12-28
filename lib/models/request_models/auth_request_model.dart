// ignore_for_file: public_member_api_docs, sort_constructors_first
class AuthRequestModel {
  String? email;
  int? code;
  String? password;

  static AuthRequestModel codeLogin(int code, String password) {
    return AuthRequestModel._()
      ..code = code
      ..password = password;
  }

  static AuthRequestModel emailLogin(String email, String password) {
    return AuthRequestModel._()
      ..email = email
      ..password = password;
  }

  AuthRequestModel._();
}
