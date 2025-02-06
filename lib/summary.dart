import 'package:flutter/material.dart';
import 'models/student.dart';
import 'models/answer.dart';

class SummaryPage extends StatelessWidget {
  final Function(int) onPageChange;
  final Student student;
  final Answer answer;

  const SummaryPage({super.key, required this.onPageChange, required this.student, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Resumen', style: TextStyle(fontSize: 40)),
          Text('Nombre: ${student.name}', style: TextStyle(fontSize: 20)),
          Text('Teléfono: ${student.phone}', style: TextStyle(fontSize: 20)),
          Text('Correo: ${student.email}', style: TextStyle(fontSize: 20)),
          Text('Matrícula: ${student.record}', style: TextStyle(fontSize: 20)),
          Text('Edad: ${student.age}', style: TextStyle(fontSize: 20)),
          const Divider(),
          Text('Horario: ${answer.horario}', style: TextStyle(fontSize: 20)),
          Text('Carrera: ${answer.carrera}', style: TextStyle(fontSize: 20)),
          Text('Especialidad: ${answer.especialidad}', style: TextStyle(fontSize: 20)),
          Text('Promedio: ${answer.promedio}', style: TextStyle(fontSize: 20)),
          Text('Sector: ${answer.sector}', style: TextStyle(fontSize: 20)),
          ElevatedButton(
            onPressed: () => onPageChange(0),
            child: const Text('Listo'),
          ),
        ],
      ),
    );
  }
}