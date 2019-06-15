package web.User;

import service.User.RegisteredService;
import util.MailUtils;
import util.MyUTF;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@SuppressWarnings("all")
@WebServlet("/RegisteredServlet")
public class RegisteredServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String username = MyUTF.getNewString(request.getParameter("username"));
        String password = request.getParameter("password");
        String sex = MyUTF.getNewString(request.getParameter("sex"));
        String qq = request.getParameter("qq");
        String email = request.getParameter("email");
        RegisteredService registeredService =new RegisteredService(); //传入service层的注册操作类
        Integer registered = registeredService.Registered(username,password,sex,qq,email); //得到返回之后的结果
        if(registered==null){ //为空则说明当前用户名已经存在
            response.getWriter().write("<script language='javascript'>alert('该用户已经被占用')</script>");
            response.setHeader("refresh","0;Registered.jsp");
        }
        else if (registered>0) { //结果大于0则注册成功
            response.getWriter().write("<script language='javascript'>alert('注册成功, 即将返回登录页面')</script>");
//            String content = "亲爱的" + username + ",当你收到这封邮件的时候，恭喜你，已经成为了本论坛的会员，希望在今后的时间里，你会在本论坛收获良多。";
            Boolean aBoolean = MailUtils.mailUtils(email,username);
            response.setHeader("refresh","0;login.jsp");
        }

    }
}
