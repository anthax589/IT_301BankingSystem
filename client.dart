
import 'customerDetails.dart';
 class employee extends Customerdetails{
  double _balance  = 0.0;
   employee(int id, String name, String username, String password, String role, double balance) 
   : _balance = balance, super(id, name, username, password, role, balance);

   void setBalance(double balance){
     _balance = (_balance) + balance;
   }
   double getBalance(double balance){
     return _balance;
   }
 }

