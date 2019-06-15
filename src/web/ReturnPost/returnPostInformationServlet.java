package web.ReturnPost;

import bean.Post;
import bean.User;
import bean.userPostandReturnPost;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import service.Post.getPostService;
import service.ReturnPost.getPostandReturnPost;
import service.ReturnPost.insertReturnpost;
import util.MyUTF;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;
import java.io.IOException;
import java.util.List;
@SuppressWarnings("all")
@WebServlet("/returnPostInformationServlet")
public class returnPostInformationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        String returnContent = MyUTF.getNewString(request.getParameter("returnContent"));
        int returnpostid = Integer.parseInt(request.getQueryString());  //获取当前需要回帖的帖子id
        getPostService getPostService = new getPostService();  //实例化查询帖子的service方法
        Post postInformation = getPostService.getPostInformation(returnpostid);  //通过id查找当前贴子的全部信息
        request.getSession().setAttribute("id",returnpostid);
        String postPlatename = postInformation.getPostPlatename(); //得到当前的帖子的所属板块名称
        insertReturnpost insertReturnpost = new insertReturnpost();  //实例化插入回帖信息的service方法
        Object user1 = request.getSession().getAttribute("user");//得到用户信息的toString()串
        String userjson = JSONObject.toJSONString(user1);//将toString()转为json串
        User user = JSON.parseObject(userjson, User.class);//将json串转为对象,方便获取对象中的数值
        int userId = user.getUserId();
        Boolean aBoolean = insertReturnpost.inserReturnpost(returnpostid, postPlatename, returnContent, userId);
        if (aBoolean) {
            //回帖成功之后需要动态的更新回复内容 将更新之后回复内容再一次查找
            response.sendRedirect("postInformationServlet?"+returnpostid);

        } else {
            response.getWriter().write("<script language='javascript'>alert('回帖错误，请稍后再试')</script>");
            response.setHeader("refresh","0;index.jsp");
        }
    }
}
