
class Customerdetails {

  int id;

  String name;

  String username;

  String password;

  String role;

  Customerdetails(this.id, this.name, this.username, this.password, this.role);
   
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
}