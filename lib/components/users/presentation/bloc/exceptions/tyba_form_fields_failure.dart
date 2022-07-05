class TybaFormFieldsFailure implements Exception {
  /// {@macro log_in_with_email_and_password_failure}
  const TybaFormFieldsFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory TybaFormFieldsFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const TybaFormFieldsFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const TybaFormFieldsFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const TybaFormFieldsFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const TybaFormFieldsFailure(
          'Incorrect password, please try again.',
        );
      default:
        return const TybaFormFieldsFailure();
    }
  }

  /// The associated error message.
  final String message;
}