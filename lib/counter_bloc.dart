import 'package:rxdart/rxdart.dart';

class CounterBloc {

  int initialCount = 0; //if the data is not passed by parameter it initializes with 0
  List<String> initialList = ["10", "20", "30"];

  BehaviorSubject<int> _subjectCounter;
  BehaviorSubject<List<String>> _stringList;

  CounterBloc({this.initialCount}){
    _subjectCounter = new BehaviorSubject<int>.seeded(this.initialCount); //initializes the subject with element already
    _stringList = new BehaviorSubject<List<String>>.seeded(initialList.toList());
    // makeStringList();
  }

  Stream<int> get counterObservable => _subjectCounter.stream;
  Stream<List<String>> get stringListObservable => _stringList.stream;

  void increment(){
    initialCount++;
    _subjectCounter.sink.add(initialCount);
  }

  void decrement(){
    initialCount--;
    _subjectCounter.sink.add(initialCount);
  }

  void addToList(String a){

    var blocList = _stringList.value;
    blocList.add(a);

    _stringList.sink.add(blocList);

  }

  void dispose(){
    _subjectCounter.close();
    _stringList.close();
  }

}