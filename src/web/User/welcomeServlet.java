package web.User;

import bean.PostandUser;
import service.Post.getAllPostService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/welcomeServlet")
public class welcomeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int start=0;
        getAllPostService getAllPostService = new getAllPostService();
        List<PostandUser> allPost = getAllPostService.getAllPost(start);
        List<PostandUser> allPost1 = getAllPostService.getAllPost();
        request.setAttribute("allPost",allPost);
        request.setAttribute("allPost1",allPost1);
        request.setAttribute("start", start);
        request.getRequestDispatcher("index.jsp").forward(request, response);  //转发所有的帖子信息
    }
}
