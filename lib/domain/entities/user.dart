/// A user of the application.
class User {

  /// The user's full Name
  final String fullName;

  /// The user's unique ID.
  final String uid;

  /// The user's email address.
  final String email;

  /// The user's phone number.
  final String phone;

  User.fromUser(User user)
      : fullName = user.fullName,
        uid = user.uid,
        email = user.email,
        phone = user.phone;

  User.fromJson(Map<String, dynamic> map)
      : fullName = map['fullName'],
        uid = map['uid'],
        email = map['email'],
        phone = map['phone'];

  /// Convert [this] to a Json `Map<String, dynamic>`. Complex structures keep their initial
  /// types.
  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'uid': uid,
        'email': email
      };

  /// Convert [this] to a Json `Map<String, String>`. All complex structures
  /// are also converted to `String`.
  Map<String, String> toJson2() => {
        'fullName': fullName,
        'uid': uid,
        'email': email
      };

  @override
  operator ==(dynamic user) => user is User && uid == user.uid;

  @override
  int get hashCode =>
      fullName.hashCode ^ uid.hashCode ^ email.hashCode ^ phone.hashCode;
}
