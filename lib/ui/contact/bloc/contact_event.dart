
sealed class ContactEvent {
  const ContactEvent();
}

final class SubmitPressed extends ContactEvent {
  final String name;
  final String email;
  final String message;

  const SubmitPressed({
    required this.name,
    required this.email,
    required this.message
  });
}