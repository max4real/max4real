/*
      - convert student class to student meta class
      - print respective average marks, highest marks, etc.. with the use of StudentMeta class
    
 */

import 'dart:math';

int main() {
  List<Student> stu=coreFunction();

  List<StudentMeta> metalist=[];
  // StudentMeta sm;
  for (var element in stu) {
    // print(element.id);
    int x=0;
    int highest_=0;
    double avg_=0;
    int totalD=0;

    var lis=[element.marks.biology , element.marks.chemistry ,
    element.marks.english , element.marks.maths ,
    element.marks.myanmar , element.marks.physics];
    
    lis.sort();
     for (var element in lis) {
      x=x+element;
      if (element>=80){
        totalD++;
      }
    }
    avg_=x/6;
    highest_=lis.last;   

    metalist.add(StudentMeta(
      studentId: element.id, 
      totalDestinations: totalD, 
      totalMarks: x,
      averageMark: avg_, 
      highestMark: highest_));
  }
  print(metalist.map((each)=>{
    "student id":each.studentId,
    "total D":each.totalDestinations,
    "avg" : each.averageMark,
    "highest" : each.highestMark,
    "total mark":each.totalMarks
  }).toList());
  return 0;
}

List<Student> coreFunction() {
  List<Student> students = [
    Student(
      id: 1,
      name: "Kyaw Kyaw",
      marks: StudentMarks(
          myanmar: 0,
          english: 0,
          maths: 0,
          physics: 0,
          chemistry: 0,
          biology: 0),
    ),
    Student(
      id: 2,
      name: "Kyaw Kyaw",
      marks: StudentMarks(
          myanmar: 0,
          english: 0,
          maths: 0,
          physics: 0,
          chemistry: 0,
          biology: 0),
    ),
    Student(
      id: 3,
      name: "Kyaw Kyaw",
      marks: StudentMarks(
          myanmar: 0,
          english: 0,
          maths: 0,
          physics: 0,
          chemistry: 0,
          biology: 0),
    ),
    Student(
      id: 4,
      name: "Kyaw Kyaw",
      marks: StudentMarks(
          myanmar: 0,
          english: 0,
          maths: 0,
          physics: 0,
          chemistry: 0,
          biology: 0),
    ),
    Student(
      id: 5,
      name: "Kyaw Kyaw",
      marks: StudentMarks(
          myanmar: 0,
          english: 0,
          maths: 0,
          physics: 0,
          chemistry: 0,
          biology: 0),
    ),
  ];
  seedMarks(students: students);
  // print(students.first.marks.english);
  return students;
}

void seedMarks({required List<Student> students}) {
  for (final each in students) {
    Random random = Random();
    each.marks.myanmar = random.nextInt(101);
    each.marks.english = random.nextInt(101);
    each.marks.maths = random.nextInt(101);
    each.marks.chemistry = random.nextInt(101);
    each.marks.physics = random.nextInt(101);
    each.marks.biology = random.nextInt(101);
  }
}

class Student {
  int id;
  String name;
  StudentMarks marks;

  Student({required this.id, required this.name, required this.marks});
}

class StudentMeta {
  int studentId;
  int totalMarks;
  int totalDestinations;
  int highestMark;
  double averageMark;

  StudentMeta(
      {required this.studentId,
      required this.totalDestinations,
      required this.totalMarks,
      required this.averageMark,
      required this.highestMark});
}

class StudentMarks {
  int myanmar;
  int english;
  int maths;
  int physics;
  int chemistry;
  int biology;

  StudentMarks(
      {required this.myanmar,
      required this.english,
      required this.maths,
      required this.chemistry,
      required this.physics,
      required this.biology});
}
