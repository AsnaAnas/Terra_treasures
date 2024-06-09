import 'package:cloud_firestore/cloud_firestore.dart';

class QuizController
{
  final db = FirebaseFirestore.instance;

  Future<void> create(String category, String question, String option1, String option2,String option3,String option4)
   async {
    final collectionRef = FirebaseFirestore.instance.collection('quiz');
    await collectionRef.add({
      'question': question,
      'option1': option1,
      'option2': option2,
      'option3': option3,
      'option4':option4,
      'category':category
    });
    
  }

}