import 'package:flutter/material.dart';

class SelectTeam2Page extends StatefulWidget {
  @override
  _SelectTeam2PageState createState() => _SelectTeam2PageState();
}

class _SelectTeam2PageState extends State<SelectTeam2Page> {
  final List<Student> students = [
  Student("Abhishek Singh", "Batsman", Icons.sports_cricket, false),
  Student("Avish Yadav", "All-Rounder", Icons.sports, false),
  Student("Anurag Mishra", "Wicket Keeper Batsman", Icons.sports_tennis, false),
  Student("Sami", "Fast Bowler", Icons.sports_baseball, false),
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          "Create Match",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Select Team 1",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: students.length,
              itemBuilder: (context, index) {
                return _buildStudentCard(students[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton("Discard", Colors.white, Colors.purple, () {}),
                _buildButton("Save", Colors.purple, Colors.white, () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStudentCard(Student student) {
    return GestureDetector(
      onTap: () {
        setState(() {
          student.isSelected = !student.isSelected;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Checkbox(
              value: student.isSelected,
              onChanged: (bool? value) {
                setState(() {
                  student.isSelected = value!;
                });
              },
              activeColor: Colors.purple,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    student.role,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              student.icon,
              color: Colors.purple,
              size: 30.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String label, Color bgColor, Color textColor, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        minimumSize: Size(150, 50),
        side: BorderSide(color: Colors.purple),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        label,
        style: TextStyle(color: textColor),
      ),
    );
  }
}

class Student {
  final String name;
  final String role;
  final IconData icon;
  bool isSelected;

  Student(this.name, this.role, this.icon, this.isSelected);
}
