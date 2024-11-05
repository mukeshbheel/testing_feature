class EmployeeSingleton{
  String? name;

  static EmployeeSingleton? _instance;

  // private constructor
  EmployeeSingleton._privateConstructor(this.name);

  // create default instance
  static final EmployeeSingleton _defaultInstance = EmployeeSingleton._privateConstructor('Chintu');

  // method 1
  // static EmployeeSingleton getInstance(){
  //   _instance ??= _defaultInstance;
  //   return _instance!;
  // }

  // method 2
  // static EmployeeSingleton get instance {
  //   _instance ??= _defaultInstance;
  //   return _instance!;
  // }

  // method 3
  factory EmployeeSingleton(){
      _instance ??= _defaultInstance;
      return _instance!;
  }


}