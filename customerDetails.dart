
class Customerdetails {
  int id;
  String name;
  String username;
  String password;
  String role;
  double balance;

  Customerdetails(this.id, this.name, this.username, this.password, this.role, this.balance);

  void setBalance(double amount) {
    balance += amount;
  }
}
