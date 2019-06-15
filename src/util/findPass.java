package util;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
@SuppressWarnings("all")
public class findPass {
    public static Boolean findPass(String Addressee_mail,String pass) {
        boolean falg = false;
        //1  编写配置  服务器，  端口，  验证    协议到  配置文件
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.163.com"); //smtp服务端
        prop.put("mail.smtp.auth", "true");      //是否验证
        prop.put("mail.transport.protocol", "smtp"); //传输协议
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        prop.put("mail.smtp.socketFactory.port", "465");
        prop.put("mail.smtp.port", 465);   //这三句我也不知道干啥的。。。大概就是用ssh验证登录的另一个端口，  一般发送邮件的smtp是用25端口， 这个有ssl验证的不一样， 而且注意  socketFactory的后面一定要加双引号
        try {
            //2.创建sesssion
            Session session = Session.getDefaultInstance(prop, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("suhang12332@163.com", "suhang12332");
                }
            });

            //3.开启session的调试模式，可以查看当前邮件发送状态
            session.setDebug(true);

            //4.建邮件
            /**
             * 邮件对象， ---发件人 收件人 抄送人 主题  内容
             */
            String body="<body bgcolor=\"#222222\">\n" +
                    "\n" +
                    "<div align=\"center\">\n" +
                    "    <table class=\"body-wrap w320\">\n" +
                    "        <tr>\n" +
                    "            <td></td>\n" +
                    "            <td class=\"container\">\n" +
                    "                <div class=\"content\">\n" +
                    "                    <table cellspacing=\"0\">\n" +
                    "                        <tr>\n" +
                    "                            <td>\n" +
                    "                                <table class=\"soapbox\">\n" +
                    "                                    <tr>\n" +
                    "                                        <td class=\"soapbox-title\">欢迎注册未来论坛</td>\n" +
                    "                                    </tr>\n" +
                    "                                </table>\n" +
                    "                                <table class=\"status-container single\">\n" +
                    "                                    <tr>\n" +
                    "                                        <td class=\"status-padding\"></td>\n" +
                    "                                        <td>\n" +
                    "                                            <table class=\"status\" bgcolor=\"#fffeea\" cellspacing=\"0\">\n" +
                    "                                            </table>\n" +
                    "                                        </td>\n" +
                    "                                        <td class=\"status-padding\"></td>\n" +
                    "                                    </tr>\n" +
                    "                                </table>\n" +
                    "                                <table class=\"body\">\n" +
                    "                                    <tr>\n" +
                    "                                        <td class=\"body-padding\"></td>\n" +
                    "                                        <td class=\"body-padded\">\n" +
                    "                                            <div class=\"body-title\">嗨, 你的密码是："+pass+"，请牢记密码</div>\n" +
                    "                                            <table class=\"body-text\">\n" +
                    "                                                <tr>\n" +
                    "                                                </tr>\n" +
                    "                                            </table>\n" +
                    "                                            <div style=\"text-align:left;\">\n" +
                    "                                                <table class=\"body-signature-block\">\n" +
                    "                                                    <tr>\n" +
                    "                                                    </tr>\n" +
                    "                                                </table>\n" +
                    "                                            </div>\n" +
                    "                                        </td>\n" +
                    "                                        <td class=\"body-padding\"></td>\n" +
                    "                                    </tr>\n" +
                    "                                </table>\n" +
                    "                            </td>\n" +
                    "                        </tr>\n" +
                    "                    </table>\n" +
                    "                </div>\n" +
                    "            </td>\n" +
                    "            <td></td>\n" +
                    "        </tr>\n" +
                    "    </table>\n" +
                    "\n" +
                    "</div>\n" +
                    "\n" +
                    "</body>";
            MimeMessage mail = new MimeMessage(session);
            mail.setFrom(new InternetAddress("suhang12332@163.com"));
            mail.setRecipient(Message.RecipientType.TO, new InternetAddress(Addressee_mail));
            mail.setSubject("找回密码通知");
            mail.setContent(body, "text/html;charset=utf-8"); // 注意 用text/plain text/html

            //4.通过session获取Transport对象（发送邮件的核心API）
            Transport ts = session.getTransport();
            //6.发送电子邮件

            ts.send(mail);
            falg = true;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        if (falg) {
            return true;
        } else {
            return false;
        }
    }
}
