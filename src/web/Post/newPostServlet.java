package web.Post;

import bean.PostandUser;
import bean.User;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import dao.PostDaoImpl;
import dao.UserDaoImpl;
import service.Post.getAllPostService;
import service.Post.getPlatePostCount;
import service.Post.newPostService;
import util.MyUTF;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@SuppressWarnings("all")
@WebServlet("/newPostServlet")
public class newPostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        String platename = MyUTF.getNewString(request.getParameter("platename"));
        String posttitle = MyUTF.getNewString(request.getParameter("posttitle"));
        String postcontent = MyUTF.getNewString(request.getParameter("postcontent"));
        Object user1 = request.getSession().getAttribute("user");//得到用户信息的toString()串
        String userjson = JSONObject.toJSONString(user1);//将toString()转为json串
        User user = JSON.parseObject(userjson, User.class);//将json串转为对象,方便获取对象中的数值
        Integer userId = user.getUserId();
        newPostService newPostService = new newPostService();
        Integer postInformation = newPostService.getPostInformation(platename, userId, posttitle, postcontent);
        if(postInformation!=null){
            response.getWriter().write("<script language='javascript'>alert('发布成功')</script>");
            getAllPostService getAllPostService = new getAllPostService();
            List<PostandUser> allPost = getAllPostService.getAllPost(0);
            List<PostandUser> allPost1 = getAllPostService.getAllPost();  //得到帖子的总数方便判断条数
            request.setAttribute("allPost",allPost);
            request.setAttribute("allPost1", allPost1);
            request.setAttribute("start",0);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }else {
            response.getWriter().write("<script language='javascript'>alert('发布失败，请重新发布功')</script>");
        }
    }
}
