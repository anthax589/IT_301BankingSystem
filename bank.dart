// import 'dart:io';
import 'dart:io';

List<String> costumerDetail = [];
List<String> employeeDetail = [];
const String employeeFileName = "Employee.txt";
const String customerFileName = "Customer.txt";

class Bank {
  void verfication() {
    while (true) {
      try {
         print("Welcome to the bank");
         stdout.write("Enter your username: ");
          String? username = stdin.readLineSync();
          stdout.write("Enter your password: ");
          String? password = stdin.readLineSync();
          List<String> user = isExist(username, password);
          if (user.isNotEmpty) {
             String role = user[4];
              switch (role) {
                case "customer":
                  break;
                case "employee":
                  break;
                default:
                  print("Invalid role");
            break;
          }
        }
        else {
          print("Invalid username or password");
        }
      } catch (e) {
        print("Invalid input");
        
      }
    }
  }
  
  List<String> isExist(String? username, String? password) {
    List<String> user = [];
    if (costumerDetail.contains(username) && costumerDetail.contains(password)) {
      user = costumerDetail;
    } else if (employeeDetail.contains(username) && employeeDetail.contains(password)) {
      user = employeeDetail;
    } else {
      print("Invalid username or password");
    }
    return user;
  }
}
