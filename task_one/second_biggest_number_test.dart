import 'dart:math';

int main() {
  List<int> numbers = _generateNumbers();
  int secondBiggest = getSecondBiggestNumbers(numbers: numbers);
  print("Second biggest number is " + secondBiggest.toString());
  return 0;
}

List<int> _generateNumbers() {
  List<int> result = [];
  for (int i = 0; i <= 10; i++) {
    int r = Random().nextInt(100);
    result.add(r);
  }
  print("Original numbers are : " + result.join(","));
  return result;
}

int getSecondBiggestNumbers({required List<int> numbers}) {
  int result = -1;
  //write your function here
  List <int> newlist=[];
  //duplicate
  for (var element in numbers) {
    if(!newlist.contains(element)){
      newlist.add(element);
    }
  }
  print("new lis is :"+newlist.toString());
  //sorting
  for (int i = 1; i < newlist.length; ++i) {
		var temp = newlist[i];
		int pos = i;
		// Shuffle up all sorted items > number[i]
		while (pos > 0 && 
              newlist[pos-1].compareTo(temp) > 0) {
			newlist[pos] = newlist[pos - 1];
			pos--;
		} 
		newlist[pos] = temp;
	}

  print("Sorted number are : "+newlist.toString());
  var second_ = newlist.length-2;
  result=newlist[second_];
  return result;
}
