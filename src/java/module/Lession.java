/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package module;

import java.sql.Time;


/**
 *
 * @author admin
 */
public class Lession {
    private int lessionID;
    private int lessionName;
    private String lessionDescription;
    private String lessionContent;

    public Lession() {
    }

    public Lession(int lessionID, int lessionName, String lessionDescription, String lessionContent) {
        this.lessionID = lessionID;
        this.lessionName = lessionName;
        this.lessionDescription = lessionDescription;
        this.lessionContent = lessionContent;
    }

    public int getLessionID() {
        return lessionID;
    }

    public void setLessionID(int lessionID) {
        this.lessionID = lessionID;
    }

    public int getLessionName() {
        return lessionName;
    }

    public void setLessionName(int lessionName) {
        this.lessionName = lessionName;
    }

    public String getLessionDescription() {
        return lessionDescription;
    }

    public void setLessionDescription(String lessionDescription) {
        this.lessionDescription = lessionDescription;
    }

    public String getLessionContent() {
        return lessionContent;
    }

    public void setLessionContent(String lessionContent) {
        this.lessionContent = lessionContent;
    }

    
    
}
