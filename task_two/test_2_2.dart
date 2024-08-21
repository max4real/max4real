import 'dart:math';

int main() {
  coreFunction();
  // getAverageRating();
  return 0;
}

List <Doctor> coreFunction() {
  //write code here
  /*
      1. write Patient Class with desired attributes
      2. write Doctor Class with desired attributes
      3. write Appointment with desired attributes
      4. write some relevant functions for appointments
   */
  List <Patient> patientlist=[];
  patientlist.add(Patient(age: 24, name: "maung maung", id: 1));
  patientlist.add(Patient(age: 44, name: "soe maung", id: 2));
  patientlist.add(Patient(age: 34, name: "maung soe", id: 3));
  patientlist.add(Patient(age: 64, name: "min min", id: 4));
  patientlist.add(Patient(age: 38, name: "hla hla", id: 5));

  List<Doctor> doclist=[];
  doclist.add(Doctor(name: "Dr.Hla Myo", id: 1,totalRating: 19,totalRatingCount: 5));
  doclist.add(Doctor(name: "Dr.Thu Thu", id: 2,totalRating: 0,totalRatingCount: 0));
  doclist.add(Doctor(name: "Dr.Win Htun", id: 3,totalRating: 34,totalRatingCount: 9));

  List<Appointment> appoinmentList=[];

  makeAppointment(appointments: appoinmentList, newAppointment: Appointment(id: 1, dateTime: DateTime(2024,9,1), doctorId: 1, patientId: 1));
  makeAppointment(appointments: appoinmentList, newAppointment: Appointment(id: 1, dateTime: DateTime(2024,9,1), doctorId: 1, patientId: 2));
  makeAppointment(appointments: appoinmentList, newAppointment: Appointment(id: 1, dateTime: DateTime(2024,9,3), doctorId: 1, patientId: 3));

  print(appoinmentList.map((each)=>{
    "id":each.id,
    "date" :each.dateTime,
    "Doctor":each.doctorId,
    "patient":each.patientId
  }).toList());



  int selectdoc_id=2;
  Random random=Random();
  for (var element in doclist) {
    int tr=0;
    int rc=0;
    if(element.id==selectdoc_id){
      tr=element.totalRating+(random.nextInt(5)+1);
      rc=element.totalRatingCount+1;
      element.totalRating=tr;
      element.totalRatingCount=rc;
    }
  }
  // print(doclist.map((each)=>{
  //   "id":each.id,
  //   "name":each.name,
  //   "total rating":each.totalRating,
  //   "total rating count":each.totalRatingCount
  // }).toList());
  return doclist;
}
double getAverageRating() {
    //write code
    // int docid=3;
    var avglist=[];
    List <Doctor> doclist=coreFunction();
    for (var element in doclist) {
      double avgrating=0;
      avgrating=element.totalRating/element.totalRatingCount;
      avglist.add(avgrating);
    }
    print(avglist);
    return 0;
  }

void makeAppointment({required List<Appointment> appointments,required Appointment newAppointment}){
  bool xValidate = validateAppointment(appointments: appointments, newAppointment: newAppointment);
  if(xValidate){
    //write code here
    appointments.add(newAppointment);
  }
  else{
    //do nth
  }
}

bool validateAppointment({required List<Appointment> appointments,required Appointment newAppointment}){
  bool result = true;
  //
  for (var element in appointments) {
    if ((element.doctorId==newAppointment.doctorId)&&(element.dateTime.isAtSameMomentAs(newAppointment.dateTime))){
      result =false;
    }
  }
  
  return result;
}

class Appointment {
  int id;
  DateTime dateTime;
  int patientId;
  int doctorId;
  

  Appointment(
      {required this.id,
      required this.dateTime,
      required this.doctorId,
      required this.patientId});
}

class Patient {
  int id;
  String name;
  int age;

  Patient({required this.age, required this.name, required this.id});
}

class Doctor {
  int id;
  String name;
  int totalRating;
  int totalRatingCount;

  Doctor(
      {this.totalRating = 0,
      this.totalRatingCount = 0,
      required this.name,
      required this.id});
}
