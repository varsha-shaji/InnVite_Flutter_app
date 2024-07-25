class Users {
  final int? usrId;
  final String name;
  final String usrPassword;
  final String usrEmail;
  final String usrPhone;
  final String usrAddress;

  Users({
    this.usrId,
    required this.name,
    required this.usrPassword,
    required this.usrEmail,
    required this.usrPhone,
    required this.usrAddress,
  });

  factory Users.fromMap(Map<String, dynamic> json) => Users(
    usrId: json["usrId"],
    name: json["name"],
    usrPassword: json["usrPassword"],
    usrEmail: json["usrEmail"],
    usrPhone: json["usrPhone"],
    usrAddress: json["usrAddress"],
  );

  Map<String, dynamic> toMap() => {
    "usrId": usrId,
    "name": name,
    "usrPassword": usrPassword,
    "usrEmail": usrEmail,
    "usrPhone": usrPhone,
    "usrAddress": usrAddress,
  };


}
