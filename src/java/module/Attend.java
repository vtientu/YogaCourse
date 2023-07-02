/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package module;

/**
 *
 * @author admin
 */
public class Attend {
    private int attendId;
    private int attend;
    private Account account;
    private Lession lession;

    public Attend() {
    }

    public Attend(int attendId, int attend, Account account, Lession lession) {
        this.attendId = attendId;
        this.attend = attend;
        this.account = account;
        this.lession = lession;
    }

    public int getAttendId() {
        return attendId;
    }

    public void setAttendId(int attendId) {
        this.attendId = attendId;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Lession getLession() {
        return lession;
    }

    public void setLession(Lession lession) {
        this.lession = lession;
    }

    public int getAttend() {
        return attend;
    }

    public void setAttend(int attend) {
        this.attend = attend;
    }
    
}
