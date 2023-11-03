// @dart=2.9
class Course {
  double degress;
  String collateralDirection;
  String cardialDirection;

  Course({this.degress, this.collateralDirection, this.cardialDirection});

  List<Course> getCoursesLimitators() {
    return [
      toCourse(45),
      toCourse(135),
      toCourse(225),
      toCourse(315),
    ];
  }

  Course getCourseDirection(double azi) {
    Course c = new Course().toCourse(azi);

    switch (c.collateralDirection) {
      case "NE":
        c.degress > 45
            ? c = new Course(
                degress: c.degress,
                collateralDirection: "SE",
                cardialDirection: "E")
            : c = new Course(
                degress: c.degress,
                collateralDirection: "NE",
                cardialDirection: "N");
        break;
      case "SE":
        c.degress > 45
            ? c = new Course(
                degress: c.degress,
                collateralDirection: "SE",
                cardialDirection: "E")
            : c = new Course(
                degress: c.degress,
                collateralDirection: "SE",
                cardialDirection: "S");
        break;

      case "SW":
        c.degress > 45
            ? c = new Course(
                degress: c.degress,
                collateralDirection: "SW",
                cardialDirection: "W")
            : c = new Course(
                degress: c.degress,
                collateralDirection: "SE",
                cardialDirection: "S");
        break;

      case "NW":
        c.degress > 45
            ? c = new Course(
                degress: c.degress,
                collateralDirection: "SW",
                cardialDirection: "W")
            : c = new Course(
                degress: c.degress,
                collateralDirection: "NE",
                cardialDirection: "N");
        break;
    }

    return c;
  }

  Course toCourse(double azi) {
    if (between(azi, 0, 90)) {
      return new Course(degress: azi, collateralDirection: "NE");
    }

    if (between(azi, 90, 180)) {
      return new Course(degress: 180 - azi, collateralDirection: "SE");
    }

    if (between(azi, 180, 270)) {
      return new Course(degress: azi - 180, collateralDirection: "SW");
    }

    if (between(azi, 270, 361)) {
      return new Course(degress: 360 - azi, collateralDirection: "NW");
    }
    return null;
  }

  bool between(double e, double a, double b) => e >= a && e < b;
}
