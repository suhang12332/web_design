package web.Post;

import bean.PostandUser;
import bean.ReturnPostandUser;
import bean.User;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import service.Post.deletePostService;
import service.ReturnPost.getReturnPostandUser;
import service.User.getUserAndPostInformation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@SuppressWarnings("all")
@WebServlet("/deletePostServlet")
public class deletePostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        int postid = Integer.parseInt(request.getQueryString());
        deletePostService deletePostService = new deletePostService();
        PostandUser postandUser = deletePostService.postandUser(postid);//通过该帖子查找该用户的信息
        String userName1 = postandUser.getUserName();//得到该用户的名字
        getUserAndPostInformation getUserAndPostInformation1 = new getUserAndPostInformation();//得到该用户信息
        User findall = getUserAndPostInformation1.findall(userName1);
        Object user1 = request.getSession().getAttribute("user");//得到用户信息的toString()串
        if (user1 == null) {
            response.getWriter().write("<script language='javascript'>alert('你还没有登录，请登录')</script>");
            response.setHeader("refresh", "0,login.jsp");
        } else {
            String userjson = JSONObject.toJSONString(user1);//将toString()转为json串
            User user = JSON.parseObject(userjson, User.class);//将json串转为对象,方便获取对象中的数值
            String username = user.getUserName();//获取session user对象中的名字
            if (username.equals(userName1)) {
                Boolean aBoolean = deletePostService.deletePost(postid);
                if (aBoolean) {
                    getUserAndPostInformation getUserAndPostInformation = new getUserAndPostInformation();
                    List<PostandUser> userAndPostInformation = getUserAndPostInformation.getUserAndPostInformation(username);
                    int userId = postandUser.getPostUserid();
                    getReturnPostandUser getReturnPostandUser = new getReturnPostandUser();
                    List<ReturnPostandUser> ret = getReturnPostandUser.getReturnPostandUser(userId);
                    request.setAttribute("ret",ret);
                    if (userAndPostInformation.size() == 0) {  //如果当前用户的帖子被删除的没有了
                        request.setAttribute("user", findall);

                        request.getRequestDispatcher("userInPost.jsp").forward(request, response);
                    } else {
                        request.setAttribute("user", userAndPostInformation);
                        request.getRequestDispatcher("userInPost.jsp").forward(request, response);
                    }
                }
            }else {
                response.getWriter().write("<script language='javascript'>alert('你无法删除别人的帖子')</script>");
//            response.sendRedirect("userInPostServlet");
                response.setHeader("refresh", "0;userInPostServlet?" + userName1);
            }
        }
    }
}
