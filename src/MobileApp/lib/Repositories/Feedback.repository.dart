// @dart=2.9
import 'package:ReachUp/Model/Feedback.model.dart';
import 'package:ReachUp/www/ReachUpAPI.dart';

class FeedbackRepository extends ReachUpAPI {
  Future<bool> add(Feedback feedback) async {
    await super.httpPost("Feedback/", feedback.toJson());

    print(super.response.data);
    if (super.response.statusCode == 200) {
      return super.response.data;
    }

    return null;
  }
}
