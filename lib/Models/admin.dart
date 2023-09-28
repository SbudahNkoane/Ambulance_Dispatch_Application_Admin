class Admin {
  final String? userId;
  final String names;
  final String surname;
  final String idNumber;
  final String emailaddress;
  final String role;
  final int cellphoneNumber;

  Admin({
    required this.userId,
    required this.names,
    required this.surname,
    required this.idNumber,
    required this.emailaddress,
    required this.role,
    required this.cellphoneNumber,
  });

  Map<String, Object?> toJson() => {
        'User_Id': userId,
        'Names': names,
        'Surname': surname,
        'ID_Number': idNumber,
        'Email_Address': emailaddress,
        'Role': role,
        'Phone_Number': cellphoneNumber,
      };

  static Admin fromJson(Map<dynamic, dynamic>? json) => Admin(
        cellphoneNumber: json!['Phone_Number'] as int,
        emailaddress: json['Email_Address'] as String,
        role: json['Role'] as String,
        idNumber: json['ID_Number'] as String,
        names: json['Names'] as String,
        surname: json['Surname'] as String,
        userId: json['User_Id'] as String?,
      );
}
