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
public class Product {
//    SELECT TOP (1000) [ID]
//      ,[Name]
//      ,[cat_ID]
//      ,[Quantity]
//      ,[ImgPath]
//      ,[Price]
//      ,[Adddate]
//      ,[Describe]
//  FROM [PlantHouseManagement].[dbo].[Product]
    private int id;
    private String name;
    private String category;
    private int quantity;
    private String imgPath;    
    private double price;
    private String addDate;
    private String Describe;

    public Product() {
    }

    public Product(int id, String name, String category, int quantity, String imgPath, double price, String addDate, String Describe) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.quantity = quantity;
        this.imgPath = imgPath;
        this.price = price;
        this.addDate = addDate;
        this.Describe = Describe;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }


    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getAddDate() {
        return addDate;
    }

    public void setAddDate(String addDate) {
        this.addDate = addDate;
    }

    

    public String getDescribe() {
        return Describe;
    }

    public void setDescribe(String Describe) {
        this.Describe = Describe;
    }
    
    
    
}
