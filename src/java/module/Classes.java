/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package module;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class Classes {
    private int classID;
    private String className;
    private Date startDate;
    private Date endDate;
    private Account trainer;
    private Course course;
    private ArrayList<Account> listMember;
    private ArrayList<Lession> timeTable;

    public Classes() {
    }

    public Classes(int classID, String className, Date startDate, Date endDate, Account trainer, Course course, ArrayList<Account> listMember, ArrayList<Lession> timeTable) {
        this.classID = classID;
        this.className = className;
        this.startDate = startDate;
        this.endDate = endDate;
        this.trainer = trainer;
        this.course = course;
        this.listMember = listMember;
        this.timeTable = timeTable;
    }

    public ArrayList<Account> getListMember() {
        return listMember;
    }

    public void setListMember(ArrayList<Account> listMember) {
        this.listMember = listMember;
    }

    public ArrayList<Lession> getTimeTable() {
        return timeTable;
    }

    public void setTimeTable(ArrayList<Lession> timeTable) {
        this.timeTable = timeTable;
    }

    public int getClassID() {
        return classID;
    }

    public void setClassID(int classID) {
        this.classID = classID;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Account getTrainer() {
        return trainer;
    }

    public void setTrainer(Account trainer) {
        this.trainer = trainer;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }
    
    
}
