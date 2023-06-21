import 'package:flutter/material.dart';
 class CourseOutline {
  String courseName;
  String courseCode;
  String courseDescription;
  List<String> courseTopics;
  List<String> courseContent;
  CourseOutline(this.courseName, this.courseCode, this.courseDescription,
      this.courseTopics, this.courseContent);
  void addContent(String content) {
    courseContent.add(content);
  }
   void removeContent(String content) {
    courseContent.remove(content);
  }
   void updateTopics(List<String> topics) {
    courseTopics = topics;
  }
}

var ItCourse = CourseOutline(
  'Introduction to Programming',
  'IT101',
  'This course introduces the fundamentals of programming',
  [
    'Understand the basic concepts of programming',
    'Write simple programs in Dart'
  ],
  [
    'Variables and data types',
    'Control structures',
    'Functions',
    'Object-oriented programming'
  ],
);
var EnglishCourse = CourseOutline(
  'English Language',
  'ENG101',
  'This course introduces the fundamentals of English language',
  [
    'Understand the basic concepts of English grammar',
    'Improve English speaking and writing skills'
  ],
  [
    'Parts of speech',
    'Tenses',
    'Punctuation',
    'Vocabulary building',
    'Writing a letter',
    'Debates'
  ],
);
var ManagementCourse = CourseOutline(
  'Introduction to Management',
  'MGT101',
  'This course introduces the fundamentals of management',
  [
    'Understand the basic concepts of management',
    'Develop leadership skills',
    'Business management'
  ],
  ['Planning', 'Organizing', 'Leading', 'Controlling'],
);
var MedicalCourse = CourseOutline(
  'Introduction to Medicine',
  'MED101',
  'This course introduces the fundamentals of medicine',
  [
    'Understand the basic concepts of human anatomy and physiology',
    'Learn about common diseases and their treatments'
  ],
  [
    'Anatomy and physiology',
    'Diseases and treatments',
    'Medical terminology',
    'Healthcare ethics'
  ],
);
void main() => runApp(const MyApp());
 class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Course Outline App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        hintColor: const Color.fromARGB(255, 165, 165, 123),
        fontFamily: 'Roboto',
      ),
      home: const LoginPage(),
    );
  }
}
 }
 class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
   final String title;
   @override
  State<HomePage> createState() => _HomePageState();
}
 class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child:Text('courses')
            ),
            ListTile(
              title: Text(ItCourse.courseName),
              onTap: () {
                // Handle course selection
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(EnglishCourse.courseName),
              onTap: () {
                // Handle course selection
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(ManagementCourse.courseName),
              onTap: () {
                // Handle course selection
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(MedicalCourse.courseName),
              onTap: () {
                // Handle course selection
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
 class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
   @override
  State<LoginPage> createState() => _LoginPageState();
}
 class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              MaterialButton(
                child: const Text('Log In'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Perform login functionality here
                  late String username = _usernameController.text;
                  late String password = _passwordController.text;
                     // Navigate to Home Page after successful login
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(title: 'Home Page'),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}