import 'package:nabeey/imports.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});
  static const String id = 'quiz_page';

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Can't load quizes"),
      ),
    );
  }
}
