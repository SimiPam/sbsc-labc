import 'package:registeration_app/dartTest.dart';
import 'dart:io';

void main() {
  ReportCard reportCard = new ReportCard();
}

class ReportCard {
  var res;
  String name = "";
  double CGPA;

  ReportCard() {
    int i = 0;
    print("Please enter name");
    String userResponse = stdin.readLineSync();
    if (userResponse.isNotEmpty && userResponse != " ") name = userResponse;
    print("Please enter number of subjects");
    userResponse = stdin.readLineSync();
    int num = int.tryParse(userResponse);
    if (num != null) {
      res = new List(num);
      while (i < res.length) {
        inputResponse(i);
        i++;
      }
      calculateGPA(res);
      percentage(CGPA);
    }
  }

  void percentage(double cgpa) {
    double percent = cgpa * 9.5;
    print("Percentage: " + percent.toString());
  }

  void calculateGPA(List res) {
    double totalScore, currentScore;
    totalScore = 0;
    for (int x = 0; x < res.length; x++) {
      currentScore = res[x] / 10;
      totalScore = totalScore + currentScore;
    }
    CGPA = totalScore / res.length;

    if (name.isNotEmpty && name != "") {
      print("Total score for $name: " + totalScore.toString());
    } else {
      print("Total score: " + totalScore.toString());
    }
    print("CGPA: " + CGPA.toString());
  }

  void inputResponse(int i) {
    print("Please enter subject $i score");
    String userResponse = stdin.readLineSync();
    int score = int.tryParse(userResponse);
    if (score != null) {
      res[i] = score;
    }
  }
}
