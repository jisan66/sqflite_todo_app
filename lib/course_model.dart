class UserCourse {
  final int id;
  final String courseTitle;
  final String courseCode;
  final double courseCredit;

  UserCourse(
      {required this.id,
      required this.courseTitle,
      required this.courseCode,
      required this.courseCredit});

  factory UserCourse.fromJson(Map<String, dynamic> json) {
    return UserCourse(
        id: json['id'],
        courseTitle: json['course_title'],
        courseCode: json['course_code'],
        courseCredit: json['course_credit']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'course_title': courseTitle,
      'course_code': courseCode,
      'course_credit': courseCredit
    };
  }
}
