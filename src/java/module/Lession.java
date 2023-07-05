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
    private String lessionName;
    private String lessionDescription;
    private String lessionContent;
    private Classes classModule;

    public Lession() {
    }

    public Lession(int lessionID, String lessionName, String lessionDescription, String lessionContent, Classes classModule) {
        this.lessionID = lessionID;
        this.lessionName = lessionName;
        this.lessionDescription = lessionDescription;
        this.lessionContent = lessionContent;
        this.classModule = classModule;
    }

    public Classes getClassModule() {
        return classModule;
    }

    public void setClassModule(Classes classModule) {
        this.classModule = classModule;
    }
    
    public int getLessionID() {
        return lessionID;
    }

    public void setLessionID(int lessionID) {
        this.lessionID = lessionID;
    }

    public String getLessionName() {
        return lessionName;
    }

    public void setLessionName(String lessionName) {
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
