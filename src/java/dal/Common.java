/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.xml.bind.DatatypeConverter;

/**
 *
 * @author admin
 */
public class Common {
    
    //Mã hóa password
    public String convertPassToMD5(String password) {
        MessageDigest convert = null;

        try {
            convert = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
        }

        convert.update(password.getBytes());
        byte[] passwordByte = convert.digest();
        return DatatypeConverter.printHexBinary(passwordByte);
    }
    
    //Random code
    public String getVerifyCode() {
        String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*_";
        Random random = new Random();
        StringBuilder builder = new StringBuilder();

        for (int i = 0; i < 8; i++) {
            int index = random.nextInt(str.length());
            builder.append(str.charAt(index));
        }

        return builder.toString();
    }
    
    //Send mail
    public void send(String to, String code) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("killermid16@gmail.com", "ckpitlhcqecelhew");
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("killermid16@gmail.com"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(to));
            message.setSubject("Verification Mail");
            String htmlEmail = "Your new password: " + code;

            MimeBodyPart mimeBodyPart = new MimeBodyPart();
            mimeBodyPart.setContent(htmlEmail, "text/html");

            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(mimeBodyPart);

            message.setContent(multipart);

            Transport.send(message);

            System.out.println("Đã gửi email");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
    
    public static void main(String[] args) {
        Common c = new Common();
        System.out.println(c.convertPassToMD5("123"));
    }
}
