package AM_service;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.*;
import java.util.*;

public class SendEmailService {
    private String host = "smtp.163.com";
    private String from = "grandfather1140@163.com"; // 发件人地址
    private String to; // 收件人地址
    private String user = "grandfather1140@163.com"; // 用户名
    private String pwd = "zhangzhicong123"; // 密码
    private String subject; // 邮件标题

    public void setAddress(String to, String subject) {
        this.to = to;
        this.subject = subject;
    }


    public void send(String content) {

        Properties props = new Properties();
        props.put("smtp.163.com", host);
        props.put("smtp.163.com", "true");
        Session session = Session.getDefaultInstance(props);
        session.setDebug(true);
        MimeMessage message = new MimeMessage(session);
        try {
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            Multipart multipart = new MimeMultipart();
            BodyPart contentPart = new MimeBodyPart();
            contentPart.setText(content);
            multipart.addBodyPart(contentPart);
            message.setContent(multipart);
            message.saveChanges();
            Transport transport = session.getTransport("smtp");
            transport.connect(host, user, pwd);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
