import 'package:flutter/material.dart';
import 'models/student.dart';
import 'models/answer.dart';

class QuestionsBPage extends StatefulWidget {
  final Function(int, Answer) onPageChange;
  final Student student;

  const QuestionsBPage({super.key, required this.onPageChange, required this.student});

  @override
  State<QuestionsBPage> createState() => _QuestionsBPageState();
}

class _QuestionsBPageState extends State<QuestionsBPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _horarioController = TextEditingController();
  final TextEditingController _carreraController = TextEditingController();
  final TextEditingController _especialidadController = TextEditingController();
  final TextEditingController _promedioController = TextEditingController();
  final TextEditingController _sectorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Questions B', style: TextStyle(fontSize: 40)),
          Text('Nombre: ${widget.student.name}', style: TextStyle(fontSize: 20)),
          TextFormField(
            controller: _horarioController,
            decoration: InputDecoration(hintText: 'Horario Preferencial (Matutino/Vespertino)'),
            validator: (value) => value == null || value.isEmpty ? 'Falta llenar el horario' : null,
          ),
          TextFormField(
            controller: _carreraController,
            decoration: InputDecoration(hintText: 'Carrera a Elegir'),
            validator: (value) => value == null || value.isEmpty ? 'Falta llenar la carrera' : null,
          ),
          TextFormField(
            controller: _especialidadController,
            decoration: InputDecoration(hintText: 'Especialidad'),
            validator: (value) => value == null || value.isEmpty ? 'Falta llenar la especialidad' : null,
          ),
          TextFormField(
            controller: _promedioController,
            decoration: InputDecoration(hintText: 'Promedio'),
            validator: (value) => value == null || value.isEmpty ? 'Falta llenar el promedio' : null,
          ),
          TextFormField(
            controller: _sectorController,
            decoration: InputDecoration(hintText: 'Sector de Residencial (norte, sur, etc)'),
            validator: (value) => value == null || value.isEmpty ? 'Falta llenar el sector' : null,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                Answer answer = Answer(
                  _horarioController.text,
                  _carreraController.text,
                  _especialidadController.text,
                  _promedioController.text,
                  _sectorController.text,
                );
                widget.onPageChange(4, answer);
              }
            },
            child: const Text('Terminar'),
          ),
        ],
      ),
    );
  }
}