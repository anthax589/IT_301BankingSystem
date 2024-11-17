import 'dart:io';
import 'bank.dart';
Bank bank = Bank();
void main() {
   while (true) {
   bank.setData();
   print("Banking System");
    print("1.Login");
    print("2.Exit");
    stdout.write("Enter your choice: ");
    int choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
          bank.verification();
        break;
      case 2:
          print("Thank you for using our service");
        break;
      default:
        print("Invalid choice");
        break;
    }
  }
}  
