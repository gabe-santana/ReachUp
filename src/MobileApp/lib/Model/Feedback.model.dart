// @dart=2.9
import 'package:ReachUp/Model/User.model.dart';

class Feedback {
  int feedbackId;
  int type;
  String typeName;
  User feedbackUser;
  String description;
  String feedbackDate;
  int stars;

  Feedback(
      {this.feedbackId,
      this.type,
      this.typeName,
      this.feedbackUser,
      this.description,
      this.feedbackDate,
      this.stars});

  Feedback.fromJson(Map<String, dynamic> json) {
    feedbackId = json['feedbackId'];
    type = json['type'];
    typeName = json['typeName'];
    feedbackUser = json['feedbackUser'] != null
        ? new User.fromJson(json['feedbackUser'])
        : null;
    description = json['description'];
    feedbackDate = json['feedbackDate'];
    stars = json['stars'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['feedbackId'] = this.feedbackId;
    data['type'] = this.type;
    data['typeName'] = this.typeName;
    if (this.feedbackUser != null) {
      data['feedbackUser'] = this.feedbackUser.toJson();
    }
    data['description'] = this.description;
    data['feedbackDate'] = this.feedbackDate;
    data['stars'] = this.stars;
    return data;
  }
}
