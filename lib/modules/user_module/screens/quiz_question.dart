import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/model/quiz_model.dart';
import 'package:terra_treasures/modules/admin/controller/quiz_controller.dart';
import 'package:terra_treasures/util/constants.dart';

// class QuestionPage extends StatelessWidget {
//   const QuestionPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               color: bgColor,
//             ),
//             height: 200,
//            child: AppBar(
//             backgroundColor: kPrimaryColor,
//             leading: IconButton(onPressed: (){}, 
//             icon: const Icon(Icons.arrow_circle_left_outlined,size: 30,color: Colors.white,)),
//             title: Text("Quiz",style: GoogleFonts.inder(color:Colors.white,fontSize:24,),),
//             centerTitle: true,
//             elevation: 0,
//               actions:  const [
//           Padding(padding: EdgeInsets.only(right: 20,top: 20),
//           child: InkWell(
//            // onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const HomeScreen())),
//             child: Text('Skip',style: TextStyle(
//               color: Colors.white,
//               fontSize: 16.0,fontWeight: FontWeight.w400),
//               ),
//           ),),
//         ],
//            ),
//           ),
//            Padding(
//              padding: const EdgeInsets.only(top: 100,),
//              child: Card(
//               margin: const EdgeInsets.fromLTRB(30,20,30,120),
//               child: ListView(
//                 children: [
//                   const SizedBox(height: 30,),
//                   Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 20,),
//                         child: Text("Which of these is a non-renewable resource?",
//                         style: GoogleFonts.inder(color:Colors.black,fontSize:18,)),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
//                         height: 50,
//                         width: 250,
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey),
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 30,right: 100,),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                 height: 26,
//                                 width: 26,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(50),
//                                   border: Border.all(color: Colors.grey),
//                                 ),
//                               ),
//                               Text("Sun",style:GoogleFonts.inder(color:Colors.black,fontSize:16,) ,)
//                             ],
//                           ),
//                         ),
//                       ),
//                        Container(
//                         margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
//                         height: 50,
//                         width: 250,
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey),
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 30,right: 100,),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                 height: 26,
//                                 width: 26,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(50),
//                                   border: Border.all(color: Colors.grey),
//                                 ),
//                               ),
//                               Text("Moon",style:GoogleFonts.inder(color:Colors.black,fontSize:16,) ,)
//                             ],
//                           ),
//                         ),
//                       ),
//                        Container(
//                         margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
//                         height: 50,
//                         width: 250,
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey),
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 30,right: 100,),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                 height: 26,
//                                 width: 26,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(50),
//                                   border: Border.all(color: Colors.grey),
//                                 ),
//                               ),
//                               Text("Coal",style:GoogleFonts.inder(color:Colors.black,fontSize:16,) ,)
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 70,),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: kPrimaryColor,
//                           fixedSize: const Size(200, 35)
//                         ),
//                         onPressed: (){}, 
//                       child:  Text("Next",
//                       style: GoogleFonts.inder(color:Colors.white,fontSize:16,) ,))
//                     ],
//                   )
//                 ],
//               ),
//               ),
//            ),
           
//         ],
//       ),
//     );
//   }
// }


class QuestionPage extends StatefulWidget {
  final String category;

  const QuestionPage({required this.category, Key? key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final QuizController _quizController = QuizController();
  List<QuizModel> _questions = [];
  int _currentQuestionIndex = 0;
  String _selectedAnswer = '';
  bool _isCorrect = false;
  bool _hasAnswered = false;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    _questions = await _quizController.fetchQuizQuestionsByCategory(widget.category);
    setState(() {});
  }

  void _checkAnswer(String answer) {
    setState(() {
      _selectedAnswer = answer;
      _hasAnswered = true;
      _isCorrect = _questions[_currentQuestionIndex].correct == answer;
    });
  }

  void _nextQuestion() {
    setState(() {
      _currentQuestionIndex++;
      _selectedAnswer = '';
      _hasAnswered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Quiz')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final currentQuestion = _questions[_currentQuestionIndex];
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: bgColor,
            ),
            height: 200,
            child: AppBar(
              backgroundColor: kPrimaryColor,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_circle_left_outlined,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              title: Text(
                "Quiz",
                style: GoogleFonts.inder(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              centerTitle: true,
              elevation: 0,
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 20, top: 20),
                  child: InkWell(
                    // onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const HomeScreen())),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Card(
              margin: const EdgeInsets.fromLTRB(30, 20, 30, 120),
              child: ListView(
                children: [
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          currentQuestion.question,
                          style: GoogleFonts.inder(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      _buildOption(currentQuestion.option1),
                      _buildOption(currentQuestion.option2),
                      _buildOption(currentQuestion.option3),
                      _buildOption(currentQuestion.option4),
                      const SizedBox(height: 70),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          fixedSize: const Size(200, 35),
                        ),
                        onPressed: _hasAnswered ? _nextQuestion : null,
                        child: Text(
                          "Next",
                          style: GoogleFonts.inder(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOption(String option) {
    bool isSelected = option == _selectedAnswer;
    bool isCorrect = option == _questions[_currentQuestionIndex].correct;
    Color color;

    if (_hasAnswered) {
      if (isSelected && _isCorrect) {
        color = Colors.green;
      } else if (isSelected && !_isCorrect) {
        color = Colors.red;
      } else if (isCorrect) {
        color = Colors.green;
      } else {
        color = Colors.transparent;
      }
    } else {
      color = Colors.transparent;
    }

    return GestureDetector(
      onTap: _hasAnswered ? null : () => _checkAnswer(option),
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        height: 50,
        width: 250,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 26,
                width: 26,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.grey),
                ),
              ),
              Text(
                option,
                style: GoogleFonts.inder(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
