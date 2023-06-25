/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package module;

/**
 *
 * @author admin
 */
public class Payment {
    private int paymentID;
    private String cardNumber;
    private String expires;
    private String cardName;
    private String cvc;

    public Payment() {
    }

    public Payment(int paymentID, String cardNumber, String expires, String cardName, String cvc) {
        this.paymentID = paymentID;
        this.cardNumber = cardNumber;
        this.expires = expires;
        this.cardName = cardName;
        this.cvc = cvc;
    }

    public int getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getExpires() {
        return expires;
    }

    public void setExpires(String expires) {
        this.expires = expires;
    }

    public String getCardName() {
        return cardName;
    }

    public void setCardName(String cardName) {
        this.cardName = cardName;
    }

    public String getCvc() {
        return cvc;
    }

    public void setCvc(String cvc) {
        this.cvc = cvc;
    }
    
    
}
