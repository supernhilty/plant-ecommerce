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
public class Categories {
    // [cid]
//      ,[cname]
//  FROM [PlantHouseManagement].[dbo].[Categories]
    private int cid;
    private String name;

    public Categories(int cid, String name) {
        this.cid = cid;
        this.name = name;
    }

    public Categories() {
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
}
