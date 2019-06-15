package web.User;

import bean.User;
import service.User.FindPasswordService;
import util.findPass;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/FindPasswordServlet")
public class FindPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        String qq = request.getParameter("qq");
        String email = request.getParameter("email");
        FindPasswordService findPasswordService = new FindPasswordService();
        User password = findPasswordService.getPassword(username, qq, email);
        if (password != null) {
            response.getWriter().write("<script language='javascript'>alert('找回成功，请查看邮箱')</script>");
            Boolean pass = findPass.findPass(password.getUserEmail(), password.getUserPassword());
            response.setHeader("refresh","0;login.jsp");
        } else {
            response.getWriter().write("<script language='javascript'>alert('找回失败，请稍后再试')</script>");
            response.setHeader("refresh","0;findpassword.jsp");
        }
    }
}
