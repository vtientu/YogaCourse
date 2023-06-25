/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package module;

import java.sql.Date;

/**
 *
 * @author admin
 */
public class Enroll {
    private int enrollID;
    private Date enrollDate;
    private double totalPrice;
    private boolean status;
    private Account account;
    private Classes classOrder;
    private Payment payment;

    public Enroll() {
    }

    public Enroll(int enrollID, Date enrollDate, double totalPrice, boolean status, Account account, Classes classOrder, Payment payment) {
        this.enrollID = enrollID;
        this.enrollDate = enrollDate;
        this.totalPrice = totalPrice;
        this.status = status;
        this.account = account;
        this.classOrder = classOrder;
        this.payment = payment;
    }

    public Payment getPayment() {
        return payment;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
    }

    public int getEnrollID() {
        return enrollID;
    }

    public void setEnrollID(int enrollID) {
        this.enrollID = enrollID;
    }

    public Date getEnrollDate() {
        return enrollDate;
    }

    public void setEnrollDate(Date enrollDate) {
        this.enrollDate = enrollDate;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }    

    public Classes getClassOrder() {
        return classOrder;
    }

    public void setClassOrder(Classes classOrder) {
        this.classOrder = classOrder;
    }
    
}
