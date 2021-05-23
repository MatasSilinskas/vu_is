abstract class Grade {
  final int maxCredits;
  final int obtainedCredits;
  final int grade;

  Grade(this.maxCredits, this.obtainedCredits, this.grade);

  String getCredits() {
    return obtainedCredits.toString() + '/' + maxCredits.toString();
  }
}
