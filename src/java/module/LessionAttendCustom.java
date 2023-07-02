/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package module;

/**
 *
 * @author admin
 */
public class LessionAttendCustom {
    private int lessionID;
    private String lessionName;
    private String lessionDescription;
    private String lessionContent;
    private int attend;

    public LessionAttendCustom() {
    }

    public LessionAttendCustom(int lessionID, String lessionName, String lessionDescription, String lessionContent, int attend) {
        this.lessionID = lessionID;
        this.lessionName = lessionName;
        this.lessionDescription = lessionDescription;
        this.lessionContent = lessionContent;
        this.attend = attend;
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

    public int getAttend() {
        return attend;
    }

    public void setAttend(int attend) {
        this.attend = attend;
    }
    
    
}
