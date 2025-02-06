import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'survey.dart';
import 'questionsa.dart';
import 'questionsb.dart';
import 'summary.dart';
import 'models/student.dart';
import 'models/answer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String title = "Inicio";
  Student? _currentStudent;
  Answer? _currentAnswer;

  static const List<String> _titles = <String>[
    'Dashboard',
    'Encuesta',
    'Pregunta',
    'Preguntas (cont)',
    'Resumen',
  ];

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      DashboardPage(onPageChange: _pageChange),
      SurveyPage(onPageChange: _pageChange),
      QuestionsAPage(onPageChange: _pageChangeWithStudent),
      QuestionsBPage(onPageChange: _pageChangeWithAnswer, student: _currentStudent ?? Student("", "", "", "", "")),
      SummaryPage(onPageChange: _pageChange, student: _currentStudent ?? Student("", "", "", "", ""), answer: _currentAnswer ?? Answer("", "", "", "", "")),
    ];
  }

  void _pageChange(int index) {
    setState(() {
      _selectedIndex = index;
      title = _titles[index];
    });
  }

  void _pageChangeWithStudent(int index, Student student) {
    setState(() {
      _currentStudent = student;
      _selectedIndex = index;
      title = _titles[index];
      _pages[3] = QuestionsBPage(onPageChange: _pageChangeWithAnswer, student: _currentStudent!);
    });
  }

  void _pageChangeWithAnswer(int index, Answer answer) {
    setState(() {
      _currentAnswer = answer;
      _selectedIndex = index;
      title = _titles[index];
      _pages[4] = SummaryPage(onPageChange: _pageChange, student: _currentStudent!, answer: _currentAnswer!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _selectedIndex != 0
            ? IconButton(
                onPressed: () {
                  _pageChange(_selectedIndex - 1);
                },
                icon: const Icon(Icons.arrow_back),
              )
            : null,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_titles.elementAt(_selectedIndex)),
      ),
      body: _pages.elementAt(_selectedIndex),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () => _pageChange(1),
              tooltip: 'Nueva Encuesta',
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}