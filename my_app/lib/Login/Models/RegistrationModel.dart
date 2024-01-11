class RegistrationModel {
  String fullName = '';
  String idOrPassportCard = '';
  String phoneNumber = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  RegistrationModel(this.fullName, this.idOrPassportCard, this.phoneNumber,
      this.email, this.password, this.confirmPassword) {}
}
