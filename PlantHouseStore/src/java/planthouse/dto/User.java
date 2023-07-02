/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package planthouse.dto;

/**
 *
 * @author leyen
 */
public class User {
//    SELECT TOP (1000) [UserName]
//      ,[Email]
//      ,[Role]
//      ,[Password]
//      ,[FullName]
//      ,[Phone]
//      ,[Address]
//      ,[City]
//      ,[Point]
//  FROM [PlantHouseManagement].[dbo].[User]

    private String userID;   
    private String role="US"; 
    private String password;
    private String fullName;
    private String phone;
    private String address="";
    private String city="";
    
    private int point=0;
    private String registerDate;

    public User() {
    }

    public User(String userID, String password, String fullName, String phone, String registerDate) {
        this.userID = userID;
        this.password = password;
        this.fullName = fullName;
        this.phone = phone;
        this.registerDate = registerDate;
    }
     public User(String userID, String password, String fullName, String phone) {
        this.userID = userID;
        this.password = password;
        this.fullName = fullName;
        this.phone = phone;
        
    }
 
    public User(String userID, String password, String fullName, String phone, 
            String address, String city, String registerDate) {
        this.userID = userID;
        this.password = password;
        this.fullName = fullName;
        this.phone = phone;
        this.registerDate = registerDate;
        this.address=address;
        this.city=city;
    }
    public User(String userID, String password, String fullName, String phone, 
            String address, String city) {
        this.userID = userID;
        this.password = password;
        this.fullName = fullName;
        this.phone = phone;
       
        this.address=address;
        this.city=city;
    }
    

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public String getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(String regiterDate) {
        this.registerDate = regiterDate;
    }

    

    

   

  
    
}
