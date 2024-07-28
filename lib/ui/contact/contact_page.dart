
import 'package:flutter/material.dart';
import 'package:marinoszinonos/widgets/height.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  static const pageId = 'contact';

  @override
  ContactPageState createState() => ContactPageState();
}

class ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process the form submission (e.g., send data to a server)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form submitted successfully')),
      );
    }
  }

  @override
  build(context) => Form(
    key: _formKey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          controller: _nameController,
          decoration: InputDecoration(labelText: 'Name'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your name';
            }
            return null;
          },
        ),
        TextFormField(
          controller: _emailController,
          decoration: InputDecoration(labelText: 'Email'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
              return 'Please enter a valid email address';
            }
            return null;
          },
        ),
        TextFormField(
          controller: _messageController,
          decoration: InputDecoration(labelText: 'Message'),
          maxLines: 5,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a message';
            }
            return null;
          },
        ),
        const Height(16),
        Center(
          child: ElevatedButton(
            onPressed: _submitForm,
            child: Text('Submit'),
          )
        )
      ]
    )
  );
}
