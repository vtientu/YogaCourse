/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package module;

/**
 *
 * @author admin
 */
public class Account {
    private int aid;
    private String firstName;
    private String lastName;
    private String avatar;
    private int gender;
    private String phone;
    private String email;
    private String address;
    private String password;
    private boolean active;
    private Role role;

    public Account() {
    }

    public Account(int aid, String firstName, String lastName, String avatar, int gender, String phone, String email, String address, String password, boolean active, Role role) {
        this.aid = aid;
        this.firstName = firstName;
        this.lastName = lastName;
        this.avatar = avatar;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.password = password;
        this.active = active;
        this.role = role;
    }

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }
    
    public String getDisplayName() {
        return this.firstName + " " + this.lastName;
    }
}
