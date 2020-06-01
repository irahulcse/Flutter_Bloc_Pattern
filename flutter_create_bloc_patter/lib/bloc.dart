// TODO: imports
// TODO: list of employeees
// TODO: stream controllers
// TODO: stream sink getter
// TODO: constructor add data and listen to changes
// TODO: core functions
// TODO: disponse

import 'dart:async';
import 'employee.dart';

class EmployeeBloc {
  //TODO: sink to add in pipe
  //TODO: sink to get data in pipe
  //TODO: by pipe mean data flow

  List<Employee> _employeeList = [
    Employee(1, "Employee1", 12.20),
    Employee(2, "Employee2", 12.20),
    Employee(3, "Employee3", 12.20),
    Employee(4, "Employee4", 12.20),
    Employee(5, "Employee5", 12.20),
  ];
  final _employeeListStreamController = StreamController<List<Employee>>();

  // for increment and decrement as well
  final _employeeSalaryIncrementStreamController = StreamController<Employee>();
  final _employeeSalaryDecrementStreamController = StreamController<Employee>();

  //getters

  Stream<List<Employee>> get employeeListStream =>
      _employeeListStreamController.stream;
  StreamSink<List<Employee>> get employeeListSink =>
      _employeeListStreamController.sink;
  StreamSink<Employee> get employeeSalaryIncrement =>
      _employeeSalaryIncrementStreamController.sink;
  StreamSink<Employee> get employeeSalaryDecrement =>
      _employeeSalaryDecrementStreamController.sink;

  EmployeeBloc() {
    _employeeListStreamController.add(_employeeList);
    _employeeSalaryIncrementStreamController.stream.listen(_incrementSalary);
    _employeeSalaryDecrementStreamController.stream.listen(_decrementSalary);
  }

  _incrementSalary(Employee employee) {
    double salary = employee.salary;
    double incrementedSalary = salary + salary * 20 / 100;
    _employeeList[employee.id - 1].salary = salary + incrementedSalary;
    employeeListSink.add(_employeeList);
  }

  _decrementSalary(Employee employee) {
    double salary = employee.salary;
    double incrementedSalary = salary - salary * 20 / 100;
    _employeeList[employee.id - 1].salary = salary + incrementedSalary;
    employeeListSink.add(_employeeList);
  }

//  @override
  void dispose() {
    _employeeSalaryDecrementStreamController.close();
    _employeeSalaryIncrementStreamController.close();
    _employeeListStreamController.close();  
    //super.dispose();
  }
}
