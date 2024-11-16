import 'dart:io';

void main() {
   while (true) {
   print("Banking System");
    print("1.Customer");
    print("2.Employee");
    print("3.Exit");
    int choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
        print("Welcome Customer");
        break;
      case 2:
        print("Welcome Employee");
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