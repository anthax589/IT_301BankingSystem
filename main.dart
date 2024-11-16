import 'dart:io';
import 'bank.dart';
Bank bank = Bank();
void main() {
   while (true) {
   print("Banking System");
    print("1.Customer");
    print("2.Employee");
    print("3.Exit");
    stdout.write("Enter your choice: ");
    int choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
          bank.verfication();
        break;
      case 2:
          employeeDashboard();
        break;
      case 3:
        print("Exit");
        break;
      default:
        print("Invalid choice");
        break;
    }
  }
}  