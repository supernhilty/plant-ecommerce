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
public class Order {
//    SELECT TOP (1000) [OrderId]
//      ,[OrderDate]
//      ,[ShipDate]
//      ,[UserId]
//      ,[Status]
//      ,[Total]
//  FROM [PlantHouseManagement].[dbo].[Order]
    private int orderId;
    private String OrderDate;
    private String shipDate;
    private User userId;
    private boolean status;
    private double total;

    public Order(int orderId, String OrderDate, String shipDate, User userId, boolean status, double total) {
        this.orderId = orderId;
        this.OrderDate = OrderDate;
        this.shipDate = shipDate;
        this.userId = userId;
        this.status = status;
        this.total = total;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

   

    public Order() {
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(String OrderDate) {
        this.OrderDate = OrderDate;
    }

    public String getShipDate() {
        return shipDate;
    }

    public void setShipDate(String shipDate) {
        this.shipDate = shipDate;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

   

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
    
}
