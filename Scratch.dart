import 'dart:io';

void main(){
  performTasks();
}


performTasks() async {
  task1();
  String task2result = await task2();
  task3(task2result);
}


task1(){
  String result = 'task 1 data here';
  print('task 1 completed');

}


Future task2() async{
  String result;
  Duration twoseconds = Duration(seconds: 2);
  sleep(twoseconds);
  Future.delayed(twoseconds,(){
    result = 'task 2 data here';
    print('task 2 completed');
    return result;
  });
  // String result = 'task 2 data here';
  // print('task 2 completed');

}


task3(String task2data){
  String result = 'task 3 data here';
  print('task 3 completed $task2data');

}


