import 'dart:io';
import 'customerDetails.dart';

List<String> customerDetail = [];
List<String> employeeDetail = [];
const String employeeFileName = "Employee.txt";
const String customerFileName = "Customer.txt";

class Bank {
  // Function to start the verification and handle login
  void verification() {
    setData(); // Load data from the files
    while (true) {
      try {
        print("Welcome to the bank");
        stdout.write("Enter your username: ");
        String? username = stdin.readLineSync();
        stdout.write("Enter your password: ");
        String? password = stdin.readLineSync();

        if (username != null && password != null) {
          List<String> user = isExist(username, password);
          if (user.isNotEmpty) {
            String role = user[4];
            switch (role) {
              case "customer":
                customerDashboard(user);
                break;
              case "employee":
                employeeDashboard(user);
                break;
              default:
                print("Invalid role");
                break;
            }
          } else {
            print("Invalid username or password");
          }
        } else {
          print("Username or password cannot be null");
        }
      } catch (e) {
        print("Invalid input: $e");
      }
    }
  }

  // Function to load customer and employee data from the files
  void setData() {
    getCustomer();
    getEmployee();
  }

  // Function to check if the username and password exist in either customer or employee records
  List<String> isExist(String? username, String? password) {
    // Check customer details first
    for (var data in customerDetail) {
      List<String> user = data.split("|");
      String userUsername = user[2];  // username is at index 2
      String userPassword = user[3];  // password is at index 3
      if (username == userUsername && password == userPassword) {
        return user; // Found customer
      }
    }

    // Check employee details next
    for (var data in employeeDetail) {
      List<String> user = data.split("|");
      String userUsername = user[2];  // username is at index 2
      String userPassword = user[3];  // password is at index 3
      if (username == userUsername && password == userPassword) {
        return user; // Found employee
      }
    }

    return []; // If no match found, return an empty list
  }

  // Function to load customer data from the Customer.txt file
  void getCustomer() {
    try {
      File file = File(customerFileName);
      if (file.existsSync()) {
        List<String> lines = file.readAsLinesSync();
        customerDetail.addAll(lines); // Add customer data to customerDetail
      }
    } catch (e) {
      print("Error loading customer data: $e");
    }
  }

  // Function to load employee data from the Employee.txt file
  void getEmployee() {
    try {
      File file = File(employeeFileName);
      if (file.existsSync()) {
        List<String> lines = file.readAsLinesSync();
        employeeDetail.addAll(lines); // Add employee data to employeeDetail
      }
    } catch (e) {
      print("Error loading employee data: $e");
    }
  }

  // Customer dashboard after successful login
  void customerDashboard(List<String> user) {
    Customerdetails customer = Customerdetails(
      int.parse(user[0]),
      user[1],
      user[2],
      user[3],
      user[4],
      double.parse(user[5])
    );
    print("\nCustomer Dashboard");
    print("Welcome ${user[1]}");
    print("1. Deposit");
    print("2. Withdraw");
    print("3. Check Balance");
    print("4. Exit");
    stdout.write("Enter your choice: ");
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        deposit(customer);
        break;
      case 2:
        withdraw(customer);
        break;
      case 3:
        checkBalance(customer);
        break;
      case 4:
        print("Exit");
        break;
      default:
        print("Invalid choice");
        break;
    }
  }

  // Deposit function for customers
  void deposit(Customerdetails customer) {
    stdout.write("Enter amount to deposit: ");
    double amount = double.parse(stdin.readLineSync()!);
    customer.setBalance(amount); // Add to customer's balance
    stdout.write("Amount deposited successfully\n");
  }

  // Check balance function for customers
  void checkBalance(Customerdetails customer) {
    print("Your balance is: ${customer.balance}");
  }

  // Withdraw function for customers
  void withdraw(Customerdetails customer) {
    stdout.write("Enter amount to withdraw: ");
    double amount = double.parse(stdin.readLineSync()!);
    if (amount > customer.balance) {
      print("Insufficient balance");
    } else {
      customer.setBalance(-amount); // Deduct from customer's balance
      print("Amount withdrawn successfully");
    }
  }

  // Employee dashboard after successful login
  void employeeDashboard(List<String> user,) {
    print("\nEmployee Dashboard");
    print("Welcome ${user[1]}");
    print("1. Add Customer");
    print("2. Delete Customer");
    print("3. Update Customer");
    print("4. Add Employee");
    print("5. Exit");
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
        addEmployee();
        break;
      case 5:
        print("Exit");
        break;
      default:
        print("Invalid choice");
        break;
    }
  }

  // Function to add a new customer
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

    // Append the new customer data to the file
    file.writeAsStringSync("$id|$name|$username|$password|$role|$balance\n", mode: FileMode.append);
    print("Customer added successfully");
  }

  // Function to delete a customer by id
  void deleteCustomer() {
    stdout.write("Enter customer id: ");
    int id = int.parse(stdin.readLineSync()!);
    File file = File(customerFileName);
    List<String> lines = file.readAsLinesSync();
    List<String> updatedLines = [];

    for (String line in lines) {
      List<String> user = line.split("|");
      if (int.parse(user[0]) != id) {
        updatedLines.add(line); // Keep all lines except the deleted one
      }
    }

    file.writeAsStringSync(updatedLines.join('\n'));
    print("Customer deleted successfully");
  }

  // Function to update customer details
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
      List<String> user = line.split("|");
      if (int.parse(user[0]) == id) {
        updatedLines.add("$id|$name|$username|$password|$role|$balance"); // Update this customer's data
      } else {
        updatedLines.add(line);
      }
    }

    file.writeAsStringSync(updatedLines.join('\n'));
    print("Customer updated successfully");
  }

  // Function to add a new employee
  void addEmployee() {
    File file = File(employeeFileName);
    stdout.write("Enter employee id: ");
    int id = int.parse(stdin.readLineSync()!);
    stdout.write("Enter employee name: ");
    String name = stdin.readLineSync()!;
    stdout.write("Enter employee username: ");
    String username = stdin.readLineSync()!;
    stdout.write("Enter employee password: ");
    String password = stdin.readLineSync()!;
    stdout.write("Enter employee role: ");
    String role = stdin.readLineSync()!;
    stdout.write("Enter employee balance: ");
    double balance = double.parse(stdin.readLineSync()!);

    // Append the new employee data to the file
    file.writeAsStringSync("$id|$name|$username|$password|$role|$balance\n", mode: FileMode.append);
    print("Employee added successfully");
  }
}
