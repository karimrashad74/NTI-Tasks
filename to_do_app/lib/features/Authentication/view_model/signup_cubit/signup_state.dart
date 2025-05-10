class SignupState {
  final bool obscurePassword;
  final bool obscureConfirmPassword;
  final bool isChecked;

  SignupState({
    this.obscurePassword = true,
    this.obscureConfirmPassword = true,
    this.isChecked = true,
  });

  SignupState copyWith({
    bool? obscurePassword,
    bool? obscureConfirmPassword,
    bool? isChecked,
  }) {
    return SignupState(
      obscurePassword: obscurePassword ?? this.obscurePassword,
      obscureConfirmPassword:
          obscureConfirmPassword ?? this.obscureConfirmPassword,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}
