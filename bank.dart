// import 'dart:io';
import 'dart:io';
import 'customerDetails.dart';
import 'employee.dart';
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
                  customerDashboard();
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

  void getCustumerDetails() {
    try {
      File file = File(customerFileName);
      List<String> lines = file.readAsLinesSync();
      for (String line in lines) {
        costumerDetail = line.split(",");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  void getEmployeeDetails() {
    try {
      File file = File(employeeFileName);
      List<String> lines = file.readAsLinesSync();
      for (String line in lines) {
        employeeDetail = line.split(",");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
  
  List<String> isExist(String? username, String? password) {
    List<String> user = [];
    for(var data in costumerDetail){
      List<String> user = data.split(",");
      String username = user[2];
      String password = user[3];
      if (username == username && password == password) {
        return user;
      }
    }
    for(var data in employeeDetail){
      List<String> user = data.split(",");
      String username = user[2];
      String password = user[3];
      if (username == username && password == password) {
        return user;
      }
    }
    return user;}
}
void customerDashboard() {
Customerdetails customer = Customerdetails(int.parse(costumerDetail[0]), costumerDetail[1], costumerDetail[2], costumerDetail[3], costumerDetail[4], double.parse(costumerDetail[5]));

  print("Welcome Customer");
  print("1.Deposit");
  print("2.Withdraw");
  print("3.Check Balance");
  print("4.Exit");
  stdout.write("Enter your choice: ");
  int choice = int.parse(stdin.readLineSync()!);
  switch (choice) {
    case 1:
      deposit(customer);
      break;
    case 2:
      break;
    case 3:
      break;
    case 4:
      break;
    default:
      print("Invalid choice");
      break;
  }
}

void deposit(Customerdetails customer) {
stdout.write("Enter amount to deposit: ");
  double amount = double.parse(stdin.readLineSync()!);
  customer.setBalance(amount);
 stdout.write("Amount deposited successfully");
}
void checkBalance(Customerdetails customer) {
  print("Your balance is: ${costumerDetail[5]}");
}
void withdraw(Customerdetails customer) {
  print("Enter amount to withdraw: ");
  double amount = double.parse(stdin.readLineSync()!);
  if (amount > double.parse(costumerDetail[5])) {
    print("Insufficient balance");
  } else {
    customer.setBalance(-amount);
    print("Amount withdrawn successfully");
  }
}

void employeeDashboard() {
  print("Welcome Employee");
  print("1.Add Customer");
  print("2.Delete Customer");
  print("3.Update Customer");
  print("4.Exit");
  stdout.write("Enter your choice: ");
  int choice = int.parse(stdin.readLineSync()!);
  switch (choice) {
    case 1:
      addCustomer();
      break;
    case 2:
      deleteCustomer();
      break;
    case 3:
      updateCustomer();
      break;
    case 4:
      print("Exit");
      break;
    default:
      print("Invalid choice");
      break;
  }
}
void addCustomer() {
  File file = File(customerFileName);
stdout.write("Enter customer id: ");
  int id = int.parse(stdin.readLineSync()!);
  stdout.write("Enter customer name: ");
  String name = stdin.readLineSync()!;
 stdout.write("Enter customer username: ");
  String username = stdin.readLineSync()!;
  stdout.write("Enter customer password: ");
  String password = stdin.readLineSync()!;
 stdout.write("Enter customer role: ");
  String role = stdin.readLineSync()!;
 stdout.write("Enter customer balance: ");
  double balance = double.parse(stdin.readLineSync()!);
  // Customerdetails customer = Customerdetails(id, name, username, password, role, balance);
  file.writeAsStringSync("$id,$name,$username,$password,$role,$balance\n", mode: FileMode.append);
  print("Customer added successfully");
}
void deleteCustomer() {
  stdout.write("Enter customer id: ");
  int id = int.parse(stdin.readLineSync()!);
  File file = File(customerFileName);
  List<String> lines = file.readAsLinesSync();
  List<String> updatedLines = [];
  for (String line in lines) {
    List<String> user = line.split(",");
    if (int.parse(user[0]) != id) {
      updatedLines.add(line);
    }
  }
  print("Customer deleted successfully");
}
void updateCustomer() {
 stdout.write("Enter customer id: ");
  int id = int.parse(stdin.readLineSync()!);
 stdout.write("Enter customer name: ");
  String name = stdin.readLineSync()!;
  stdout.write("Enter customer username: ");
  String username = stdin.readLineSync()!;
 stdout.write("Enter customer password: ");
  String password = stdin.readLineSync()!;
 stdout.write("Enter customer role: ");
  String role = stdin.readLineSync()!;
  stdout.write("Enter customer balance: ");
  double balance = double.parse(stdin.readLineSync()!);
  File file = File(customerFileName);
  List<String> lines = file.readAsLinesSync();
  List<String> updatedLines = [];
  for (String line in lines) {
    List<String> user = line.split(",");
    if (int.parse(user[0]) == id) {
      updatedLines.add("$id,$name,$username,$password,$role,$balance");
    } else {
      updatedLines.add(line);
    }
  }
  print("Customer updated successfully");
}
