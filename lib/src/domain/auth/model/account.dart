class Account {
  final String id;
  final String userName;
  final String email;
  final DateTime dateTimeCreate;

  final String? tel;
  final DateTime? dob;

  const Account({
    required this.id,
    required this.userName,
    required this.email,
    this.tel,
    required this.dateTimeCreate,
    this.dob,
  });
}
