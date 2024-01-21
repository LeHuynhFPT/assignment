import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'student.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({Key? key}) : super(key: key);

  @override
  _StudentListScreenState createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  DatabaseHelper dbHelper = DatabaseHelper.instance;
  List<Student> students = [];

  @override
  void initState() {
    super.initState();
    refreshStudentList();
  }

  Future<void> refreshStudentList() async {
    List<Student> studentList = await dbHelper.getAllStudents();
    setState(() {
      students = studentList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(students[index].name),
                  subtitle: Text(students[index].email),
                  onTap: () {
                    // TODO: Navigate to student detail screen
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // TODO: Navigate to student form screen
              },
              child: Text('Add Student'),
            ),
          ),
        ],
      ),
    );
  }
}
