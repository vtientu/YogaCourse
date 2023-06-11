/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package module;

import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class Classes {
    private int classID;
    private String className;
    private Account trainer;
    private Course course;
    private ArrayList<Account> listMember;
    private ArrayList<Lession> listLession;

    
    
    public Classes() {
    }

    public Classes(int classID, String className, Account trainer, Course course, ArrayList<Account> listMember, ArrayList<Lession> listLession) {
        this.classID = classID;
        this.className = className;
        this.trainer = trainer;
        this.course = course;
        this.listMember = listMember;
        this.listLession = listLession;
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

    public ArrayList<Account> getListMember() {
        return listMember;
    }

    public void setListMember(ArrayList<Account> listMember) {
        this.listMember = listMember;
    }

    public ArrayList<Lession> getListLession() {
        return listLession;
    }

    public void setListLession(ArrayList<Lession> listLession) {
        this.listLession = listLession;
    }

    
    
}
