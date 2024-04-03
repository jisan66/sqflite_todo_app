class UserCourse {
  final int? id;
  final int userId;
  final String courseTitle;
  final String courseCode;
  final double courseCredit;

  UserCourse(
      {this.id,
        required this.userId,
      required this.courseTitle,
      required this.courseCode,
      required this.courseCredit});

  factory UserCourse.fromJson(Map<String, dynamic> json) {
    return UserCourse(
        id: json['id'],
        userId: json['user_id'],
        courseTitle: json['course_title'],
        courseCode: json['course_code'],
        courseCredit: json['course_credit']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id' : userId,
      'course_title': courseTitle,
      'course_code': courseCode,
      'course_credit': courseCredit
    };
  }
}
