import 'package:employees_control/src/domain/responses/sign_in_response.dart';

abstract class SignInRepository {
  const SignInRepository();

  Future<SignInResponse> signInWithUsernameAndPassword(
    final String username,
    final String password,
  );
}
