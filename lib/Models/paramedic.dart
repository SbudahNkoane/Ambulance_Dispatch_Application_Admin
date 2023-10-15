class Paramedic {
  final String? userId;
  final String names;
  final String surname;
  final String idNumber;
  final String emailaddress;
  final String role;
  final String cellphoneNumber;
  final String? profilePicture;

  Paramedic({
    this.profilePicture,
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
        'CellPhone_Number': cellphoneNumber,
        'Profile_Picture': profilePicture,
      };

  static Paramedic fromJson(Map<dynamic, dynamic>? json) => Paramedic(
        cellphoneNumber: json!['CellPhone_Number'] as String,
        emailaddress: json['Email_Address'] as String,
        role: json['Role'] as String,
        idNumber: json['ID_Number'] as String,
        names: json['Names'] as String,
        surname: json['Surname'] as String,
        userId: json['User_Id'] as String?,
        profilePicture: json['Profile_Picture'] as String?,
      );
}
