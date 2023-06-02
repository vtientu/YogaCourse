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
    private Time timeStart;
    private Time timeEnd;
    private int dayOfWeek;
    private Room room;

    public Lession() {
    }

    public Lession(int lessionID, Time timeStart, Time timeEnd, int dayOfWeek, Room room) {
        this.lessionID = lessionID;
        this.timeStart = timeStart;
        this.timeEnd = timeEnd;
        this.dayOfWeek = dayOfWeek;
        this.room = room;
    }

    public int getLessionID() {
        return lessionID;
    }

    public void setLessionID(int lessionID) {
        this.lessionID = lessionID;
    }

    public Time getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(Time timeStart) {
        this.timeStart = timeStart;
    }

    public Time getTimeEnd() {
        return timeEnd;
    }

    public void setTimeEnd(Time timeEnd) {
        this.timeEnd = timeEnd;
    }

    public int getDayOfWeek() {
        return dayOfWeek;
    }

    public void setDayOfWeek(int dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }
    
    
}
