import 'package:flutter/material.dart';
import 'models/student.dart';

class QuestionsAPage extends StatefulWidget {
  final Function(int, Student) onPageChange;
  const QuestionsAPage({super.key, required this.onPageChange});

  @override
  State<QuestionsAPage> createState() => _QuestionAPageState();
}

class _QuestionAPageState extends State<QuestionsAPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _recordController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: 'Escribe tu nombre'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'favor de llenar este campo';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: TextFormField(
              controller: _phoneController,
              decoration:
                  const InputDecoration(hintText: 'Escribe tu teléfono'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'favor de llenar este campo';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(hintText: 'Escribe tu correo'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'favor de llenar este campo';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: TextFormField(
              controller: _recordController,
              decoration:
                  const InputDecoration(hintText: 'Escribe tu matricula'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'favor de llenar este campo';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: TextFormField(
              controller: _ageController,
              decoration: const InputDecoration(hintText: 'Escribe tu edad'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'favor de llenar este campo';
                }
                return null;
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Student student = Student(
                    _nameController.text,
                    _phoneController.text,
                    _emailController.text,
                    _recordController.text,
                    _ageController.text);

                print("Nuevo Estudiante ${student.record} - ${student.name}");

                widget.onPageChange(3, student);
              }
            },
            child: Text('Continuar'),
          ),
        ],
      ),
    );
  }
}
