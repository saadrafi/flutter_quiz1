import 'package:flutter/material.dart';
import 'son.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal.shade900,
        appBar: AppBar(
          title: Text('Quiz'),
          centerTitle: true,
        ),
        body: QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  QuizBrain quizBrain = QuizBrain();

  List<Icon> score=[];

  void chekedAnswer(bool userAnswer){
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if(userAnswer== correctAnswer){
        score.add(Icon(Icons.check,color: Colors.green,));
      }else{
          score.add(Icon(Icons.close,color: Colors.red,));
      }
        quizBrain.nextQuestion();

    });



  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    quizBrain.getQuestionText(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.green,
                child: TextButton(
                  child: Text(
                    'TRUE',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                    ),
                  ),
                  onPressed: () {
                    chekedAnswer(true);
                  },
                ),
              ),
            ),
            SizedBox(height: 8,),
            Expanded(
              child: Container(
                color: Colors.red,
                child: TextButton(
                  child: Text(
                    'FAlSE',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                    ),
                  ),
                  onPressed: () {
                    chekedAnswer(false);
                  },
                ),
              ),
            ),
            SizedBox(height: 8,),
            Row(
              children: score
            )
          ],
        ),
      ),
    );
  }
}
