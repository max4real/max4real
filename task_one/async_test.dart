import 'dart:math';

/*
    while api is being fetched, gif must be playing until fectching is completely done.
    when api is finished, if there is a currently playing gif, play till this turn ends and stop playing.

    e.g.  api = 8sec, gif = 3sec, 
    result => 
              Starting - 0s
              Done Playing GIF - 3s
              Done Playing GIF - 6s
              Fetched API - 8s
              Done Playing GIF - 9s
              Function End - 9s
 */

int main() {
  coreFunction();
  return 0;
}

void coreFunction() async {
  //write your function here
  print("Starting");

  bool x=true;

  fetchAPI().then((value){
      x=false;
  });
  
  do {
    await playGif();
  } while (x);
}

Future<void> playGif() async {
  await Future.delayed(const Duration(seconds: 3));
  print("Done playing GIF");
}

Future<void> fetchAPI() async {
  int r = Random().nextInt(10);
  int y=10;
  await Future.delayed(Duration(seconds: y));
  print("Fetched API - Duration is " + y.toString() + " seconds.");
}
