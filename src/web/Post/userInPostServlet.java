package web.Post;
import bean.PostandUser;
import bean.ReturnPostandUser;
import bean.User;
import service.ReturnPost.getReturnPostandUser;
import service.User.LoginService;
import service.User.getUserAndPostInformation;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/userInPostServlet")
public class userInPostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getQueryString();
        getUserAndPostInformation getUserAndPostInformation = new getUserAndPostInformation();
        List<PostandUser> userAndPostInformation = getUserAndPostInformation.getUserAndPostInformation(name);
        User user = getUserAndPostInformation.findall(name);  //得到该用户的信息
        int userId = user.getUserId();
        getReturnPostandUser getReturnPostandUser = new getReturnPostandUser();
        List<ReturnPostandUser> ret = getReturnPostandUser.getReturnPostandUser(userId);  //得到该用户的回帖信息
        request.setAttribute("ret", ret);


        if (userAndPostInformation.size() == 0) {  //如果当前用户的帖子被删除的没有了
            request.setAttribute("user", user);  //传递该用户的信息
            request.getRequestDispatcher("userInPost.jsp").forward(request, response);
        } else {
            request.setAttribute("user", userAndPostInformation);
            request.getRequestDispatcher("userInPost.jsp").forward(request, response);
        }
    }
}
