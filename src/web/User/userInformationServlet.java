package web.User;

import bean.PostandUser;
import bean.User;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import dao.UserDaoImpl;
import service.Post.getAllPostService;
import service.User.refreshUserService;
import service.User.userInformation;
import util.MyUTF;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
@SuppressWarnings("all")
@WebServlet("/userInformationServlet")
public class userInformationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String userimg = request.getParameter("userimg");
        String usersate = MyUTF.getNewString(request.getParameter("usersate"));
        String birthday = request.getParameter("birthday");
        //将未完善信息之前的用户信息找出来，得到用户名，按用户名条件查询数据库,以此来更新该用户的信息
        Object user1 = request.getSession().getAttribute("user");//得到用户信息的toString()串
        String userjson = JSONObject.toJSONString(user1);//将toString()转为json串
        User user = JSON.parseObject(userjson, User.class);//将json串转为对象,方便获取对象中的数值
        String username = user.getUserName();//获取user对象中的名字
        userInformation userInformation = new userInformation(); //实例化service层的userInformation类
        Boolean userInformation1 = userInformation.getUserInformation(birthday, usersate, userimg,username); //完善信息
        if(userInformation1){
            response.getWriter().write("<script language='javascript'>alert('完善信息成功')</script>");
            refreshUserService refreshUserService = new refreshUserService();
            User user2 = refreshUserService.refreshUser(username);
            //将修改之后的用户信息重新查找，返回user对象,然后存入到session中,实时更新操作
            request.getSession().setAttribute("user",user2);
            //用户信息的完善，将会改变数据库内容，影响到帖子的内容，需要更新帖子的信息
            getAllPostService getAllPostService = new getAllPostService();
            List<PostandUser> allPost = getAllPostService.getAllPost(0);
            List<PostandUser> allPost1 = getAllPostService.getAllPost();
            request.setAttribute("allPost",allPost);
            request.setAttribute("allPost1", allPost1);
            request.setAttribute("start",0);
            request.getRequestDispatcher("index.jsp").forward(request, response);  //转发所有的帖子信息
        }else {
            response.getWriter().write("<script language='javascript'>alert('发生了一点意外，请重新再试一次')</script>");
            response.setHeader("refresh","0;userinformation.jsp");
        }
    }
}
