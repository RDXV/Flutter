void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2Result = await task2();
  // await is applied to Future and not string where future is a future event which may be int or double or string
  // but we dont know right  now
  // We also have to  mark the task2  as async annd await to complete it
  task3(task2Result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

// Rather than using just  Future , we can use Future<String> to be more specific
Future<String> task2() async {
  Duration threesecs = Duration(seconds: 3);

  // sleep(threesecs); -> shows how sync works

  // Future.delayed(threesecs, () {
  //   // shows async
  //   String result = 'task 2 data';
  //   print('Task 2 complete');
  // });

  // String result = 'task 2 data';
  // print('Task 2 complete');

  String result;
  await Future.delayed(threesecs, () {
    //wiithout await, same null problem
    result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
}

void task3(String task2Result) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2Result');
  // As result we got
  // Task 1 complete
  // Task 3  complete with null
  // Task 2 complete

  // To remove the null, add 'async' before the function curly braces of performTask() so as to stop
  // or make  the task 3 wait till thhe task2 is complete and add keyword 'await' which we got access to after using
  // 'async' and put it right in front of task2
}

// Sync vs Async
// in  Sync, it is important for the first task to get executed  before the second one gets executed. however, in async
// the importance of tasks getting completed in order does not matter. Example - Asking people to give their passport
// numbers. If you keep waiting for each person to give their passport number and then move too next, then it will waste
// time. However, if you mail all to give passport number and then they respond accordingly, that would save time and is
// quite similar to how async works
