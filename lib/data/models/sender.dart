
class Sender {
  final String name;
  final String email;
  final String message;

  const Sender({
    required this.name,
    required this.email,
    required this.message
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'message': message
  };
}