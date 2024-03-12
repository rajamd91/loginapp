class SignUpWithEmailAndPasswordFailure {
  final String message;

  SignUpWithEmailAndPasswordFailure(
      [this.message = "An Unknown error occured."]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return SignUpWithEmailAndPasswordFailure(
            'Please Enter A Strong Password');
      case 'invalid-email':
        return SignUpWithEmailAndPasswordFailure(
            'Email Is Not valid Or Badly Formatted.');
      case 'email-already-in-use':
        return SignUpWithEmailAndPasswordFailure(
            'An Account Already Exists For That Email.');
      case 'operation-not-allowed':
        return SignUpWithEmailAndPasswordFailure(
            'Operation Is Not Allowed.Please Contact Support.');
      case 'user-disabled':
        return SignUpWithEmailAndPasswordFailure(
            'This User Has Been Disabled.Please Contact Support For Help.');
      default:
        return SignUpWithEmailAndPasswordFailure();
    }
  }
}
