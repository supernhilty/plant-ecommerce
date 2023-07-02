/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package planthouse.dto;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author leyen
 */
public class Cart {

    private Map<Integer, Item> cart;

    public Cart() {
    }

    public Cart(Map<Integer, Item> cart) {
        this.cart = cart;
    }

    public static List<Item> getItemlist(Cart cart) {
        Collection<Item> item = cart.getCart().values();
        return new ArrayList<>(item);
    }
   
    public Map<Integer, Item> getCart() {
        return cart;
    }

    public void setCart(Map<Integer, Item> cart) {
        this.cart = cart;
    }

    public void add(Item item) {
        if (this.cart == null) {
            this.cart = new HashMap<>();
        }
        if (this.cart.containsKey(item.getProduct().getId())) {
            int currentQuantity = this.cart.get(item.getProduct().getId()).getQuantity();
            item.setQuantity((currentQuantity + item.getQuantity()));
        }
        cart.put(item.getProduct().getId(), item);
    }

    public void delete(int id) {
        if (this.cart == null) {
            return;
        }
        if (this.cart.containsKey(id)) {
            this.cart.remove(id);
        }
    }

    public void update(int id, Item newItem) {
        if (this.cart == null) {
            return;
        }
        if (this.cart.containsKey(id)) {
            this.cart.replace(id, newItem);
        }
    }

    //private Item getItembyID() -> getQuantityByID
    public double getTotalMoney() {
        double total = 0;
        for (Map.Entry<Integer, Item> entry : cart.entrySet()) {
            int key = entry.getKey();
            Item value = entry.getValue();
            total += entry.getValue().getQuantity()
                    * entry.getValue().getProduct().getPrice();
        }
        return total;
    }
    public int getTotalCount() {
        int total=0;
        for (Map.Entry<Integer, Item> entry : cart.entrySet()) {
            int key = entry.getKey();
            Item value = entry.getValue();
            total += entry.getValue().getQuantity();
                   
        }
        return total;
    }
}
