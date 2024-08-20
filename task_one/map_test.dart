import '../test_enum.dart';

/// expected result
/*
    {
      "Man-City" : ["Haaland","Foden"],
      "Man-U" : ["Sancho"],
      "Arsenal" : ["Jesus","Saliba"],
      "Real" : ["Mbappe","Kroos"],
      "Inter Miami" : ["Messi"]
    }
 */
int main() {
  convertToTeamPlayersMap();
  return 0;
}
void convertToTeamPlayersMap() {
  List<PlayerModel> players = getPlayers();
  //write your code here
  Map<String,List<String>> mymap= new Map();

  for (PlayerModel element in players) {
    // print(element.team);
    List<String> namelist=[];

    if (mymap.containsKey(element.team)){
      // mymap[element.team].toList().add(element.name);
      namelist = mymap[element.team]??[];
      namelist.add(element.name);
      mymap[element.team]=namelist;
    }else{
      namelist.add(element.name);
      mymap[element.team]=namelist;
    }
  }
  print(mymap);
}

List<PlayerModel> getPlayers() {
  return [
    PlayerModel(name: "Sancho", team: "Man-U"),
    PlayerModel(name: "Haaland", team: "Man-City"),
    PlayerModel(name: "Foden", team: "Man-City"),
    PlayerModel(name: "Jesus", team: "Arsenal"),
    PlayerModel(name: "Mbappe", team: "Real"),
    PlayerModel(name: "Kroos", team: "Real"),
    PlayerModel(name: "Saliba", team: "Arsenal"),
    PlayerModel(name: "Messi", team: "Inter Miami"),
  ];
}

class PlayerModel {
  String name;
  String team;

  PlayerModel({required this.name, required this.team});
}