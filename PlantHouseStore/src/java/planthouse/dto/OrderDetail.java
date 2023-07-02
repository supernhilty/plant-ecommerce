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
//        [OrderId]
//      ,[ProductId]
//      ,[OrderQuantity]
//      ,[ProductOrderPrice]
public class OrderDetail {
    private int orderId;
    private Product product;
    private int orderQuantity;
    private double productOrderPrice;

    public OrderDetail() {
    }

    public OrderDetail(int orderId, Product product, int orderQuantity, double productOrderPrice) {
        this.orderId = orderId;
        this.product = product;
        this.orderQuantity = orderQuantity;
        this.productOrderPrice = productOrderPrice;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getOrderQuantity() {
        return orderQuantity;
    }

    public void setOrderQuantity(int orderQuantity) {
        this.orderQuantity = orderQuantity;
    }

    public double getProductOrderPrice() {
        return productOrderPrice;
    }

    public void setProductOrderPrice(double productOrderPrice) {
        this.productOrderPrice = productOrderPrice;
    }

   
}
