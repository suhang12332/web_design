package web.Post;
import bean.PostandUser;
import bean.userPostandReturnPost;
import dao.PostDaoImpl;
import service.ReturnPost.getPostandReturnPost;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;
import java.io.IOException;
import java.util.List;
@SuppressWarnings("all")
@WebServlet("/postInformationServlet")
public class postInformationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getQueryString());
        getPostandReturnPost getPostandReturnPost = new getPostandReturnPost();
        List<userPostandReturnPost> postadnReturnPost = getPostandReturnPost.getPostadnReturnPost(id);

        if(postadnReturnPost.size()==0){
            PostandUser postandUser = getPostandReturnPost.getPostandUser(id); //若当前回帖为0，为避免查询结果为空，所以此处查询用户和帖子，用来显示贴子内容
            request.setAttribute("postandReturnpost",postandUser);
            request.getRequestDispatcher("postInformation.jsp").forward(request,response);
        }else {
            PostandUser postanduserbyUserid = getPostandReturnPost.getPostandUser(id); //根据帖子id检索当前帖子的信息
            request.getServletContext().setAttribute("postandUser",postanduserbyUserid);
            request.setAttribute("postandReturnpost",postadnReturnPost);
            request.getRequestDispatcher("postInformation.jsp").forward(request, response);
        }
    }
}
