// import 'package:cloud_firestore/cloud_firestore.dart';

// class QuizController
// {
//   final db = FirebaseFirestore.instance;

//   Future<void> create(String category, String question, String option1, String option2,String option3,String option4,String correct)
//    async {
//     final collectionRef = FirebaseFirestore.instance.collection('quiz');
//     await collectionRef.add({
//       'question': question,
//       'option1': option1,
//       'option2': option2,
//       'option3': option3,
//       'option4':option4,
//       'category':category,
//       'correct_answer':correct,
//     });
    
//   }

// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:terra_treasures/model/quiz_model.dart';

class QuizController {
  final db = FirebaseFirestore.instance;

  Future<List<QuizModel>> fetchQuizQuestionsByCategory(String category) async {
    final querySnapshot = await db.collection('quiz').where('category', isEqualTo: category).get();
    return querySnapshot.docs.map((doc) => QuizModel.fromMap(doc.data())).toList();
  }

  Future<void> create(String category, String question, String option1, String option2, String option3, String option4, String correct) async {
    final collectionRef = FirebaseFirestore.instance.collection('quiz');
    await collectionRef.add({
      'question': question,
      'option1': option1,
      'option2': option2,
      'option3': option3,
      'option4': option4,
      'category': category,
      'correct_answer': correct,
    });
  }
}
