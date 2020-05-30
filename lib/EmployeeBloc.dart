// Do following this for bloc pattern

//TODO: imports
import 'dart:async';
import 'Employee.dart';

//TODO: List of employees
class EmployeeBloc {
  List<Employee> _employeeList = [
    Employee(1, 'Emp One', 10000.0),
    Employee(2, 'Emp Two', 20000.0),
    Employee(3, 'Emp Three', 30000.0),
    Employee(4, 'Emp Four', 40000.0),
    Employee(5, 'Emp Five', 50000.0),
  ];

  //TODO: Stream Controller
  // sink to add in pipe
  // stream to get data from pipe
  // And the pipe is data flow
  final _employeeListStreamController = StreamController<List<Employee>>();

  // for inc and dec
  final _employeeSalaryIncrementStreamContorller = StreamController<Employee>();

  final _employeeSalaryDeccrementStreamContorller =
      StreamController<Employee>();


//TODO: Stream Sink getter
  // getters
  Stream<List<Employee>> get employeeListStream => _employeeListStreamController.stream;

  StreamSink<List<Employee>> get employeeListSink =>
  _employeeListStreamController.sink;

  StreamSink<Employee> get employeeSalaryIncrement =>
  _employeeSalaryIncrementStreamContorller.sink;

  StreamSink<Employee> get employeeSalaryDecrement =>
  _employeeSalaryDecrementStreamContorller.sink;

//TODO: Constructor - add data; listen to changes

EmployeeBloc(){
  _employeeListStreamController.add(_employeeList);
_employeeSalaryIncrementStreamContorller.stream.listen(_incrementSalary);
_employeeSalaryDecrementStreamContorller.stream.listen(_decrementSalary);
}

//TODO: Core fuctions

_incrementSalary(Employee employee){
  double salary = employee.salary;
  
  double incrementedSalary = salary * 20/100;

  _employeeList[employee.id - 1].salary = salary + incrementedSalary;

  employeeListSink.add(_employeeList);
}
_decrementSalary(Employee employee){
  double salary = employee.salary;
  
  double decrementedSalary = salary * 20/100;

  _employeeList[employee.id - 1].salary = salary - decrementedSalary;

  employeeListSink.add(_employeeList);

}


void dispose(){
  _employeeSalaryIncrementStreamController.close();
  _employeeSalaryDecrementStreamController.close();
  _employeeListStreamController.close(); 
}
  

}


//TODO: diapose
