// @dart=2.9
import 'package:ReachUp/Model/Feedback.model.dart';
import 'package:ReachUp/Repositories/Feedback.repository.dart';

class FeedbackController {
  FeedbackRepository feedbackRepository;

  FeedbackController() {
    feedbackRepository = new FeedbackRepository();
  }

  Future<bool> add(Feedback feedback) async {
    return feedbackRepository.add(feedback);
  }
}
