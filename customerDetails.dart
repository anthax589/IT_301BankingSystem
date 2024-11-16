
class Customerdetails {

  int id;

  String name;

  String username;

  String password;

  String role;

  double balance = 0.0;

  Customerdetails(this.id, this.name, this.username, this.password, this.role ,this.balance);
   
   void setID(int id){
     this.id = id;
   }
   void setName(String name){
     this.name = name;
   }
    void setUsername(String username){
      this.username = username;
    }
    void setPassword(String password){
      this.password = password;
    }
    void setRole(String role){
      this.role = role;
    }
    void setBalance(double balance){
      this.balance = balance;
    }
}