import 'dart:io';

void main(){
    var name = ["a", "b", "c", "d", "e", "f", "g", "h", "i"];

    print("enter player 1 name");
    String? first=stdin.readLineSync();
    print("enter player 2 name");
    String? second=stdin.readLineSync();

    var player =[first, second, first, second, first, second, first, second, first];
    int times=0;
  
    do {
      print(" "+name[0]+" | "+name[1]+" | "+name[2]);
      print("---|---|---");
      print(" "+name[3]+" | "+name[4]+" | "+name[5]);
      print("---|---|---");
      print(" "+name[6]+" | "+name[7]+" | "+name[8]);
      print("");
      print(player[times].toString()+" turn");

      String letter =letteraccept();
      if (player[times]==first) {
            for (int t = 0; t < 9; t++) {
                if (name[t]==letter) {
                    name[t] = "*";
                }
            }
        } else {
            for (int t = 0; t < 9; t++) {
                if (name[t]==letter) {
                    name[t] = "o";
                }
            }
        }
        if (((name[0]=="*") && (name[1]=="*") && (name[2]=="*")) || ((name[3]=="*") && (name[4]=="*") && (name[5]=="*")) || ((name[6]=="*") && (name[7]=="*") && (name[8]=="*")) || ((name[0]=="*") && (name[3]=="*") && (name[6]=="*")) || ((name[1]=="*") && (name[4]=="*") && (name[7]=="*")) || ((name[2]=="*") && (name[5]=="*") && (name[8]=="*"))|| ((name[0]=="*") && (name[4]=="*") && (name[8]=="*"))|| ((name[2]=="*") && (name[4]=="*") && (name[6]=="*"))) {
                win(first!);
                times = 8;
            }
            if (((name[0]=="o") && (name[1]=="o") && (name[2]=="o")) || ((name[3]=="o") && (name[4]=="o") && (name[5]=="o")) || ((name[6]=="o") && (name[7]=="o") && (name[8]=="o")) || ((name[0]=="o") && (name[3]=="o") && (name[6]=="o")) || ((name[1]=="o") && (name[4]=="o") && (name[7]=="o")) || ((name[2]=="o") && (name[5]=="o") && (name[8]=="o")|| ((name[0]=="o") && (name[4]=="o") && (name[8]=="o"))|| ((name[2]=="o") && (name[4]=="o") && (name[6]=="o")))) {
                win(second!);
                times = 8;
            }
      times++;
    } while (times<9);

}

String letteraccept(){
  print("choose any letter");
  String x=stdin.readLineSync()!;
  return x;
}
void win(String x){
  print("player "+x+" win");
}

