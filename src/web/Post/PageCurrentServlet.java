package web.Post;

import bean.PostandUser;
import service.Post.getAllPostService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/PageCurrentServlet")
public class PageCurrentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String queryString = request.getQueryString();
        char c = queryString.charAt(queryString.length() - 1);//取得最后一位状态码0是向上翻页 1是向下翻页
        String[] split = queryString.split("&");  //分割出状态码的前面几位
        int start = Integer.parseInt(split[0]); //显示当前查询下标
        getAllPostService getAllPostService = new getAllPostService();  //实例化service查询方法
        List<PostandUser> allPost1 = getAllPostService.getAllPost();
        request.setAttribute("allPost1", allPost1);
        if (c == '1') {  //如果当前状态码为1 表示向下翻页
            List<PostandUser> allPost = getAllPostService.getAllPost(start+10); //条数增加10
            request.setAttribute("allPost", allPost); //转发数据
            request.setAttribute("start",start+10); //转发本页的最后条数
            request.getRequestDispatcher("index.jsp?").forward(request, response);
        } else {
            if (start == 0) {  //如果开始下标为0 则只能显示一页,
                List<PostandUser> allPost = getAllPostService.getAllPost(0);
                request.setAttribute("allPost", allPost);
                request.setAttribute("start", 0);
                request.getRequestDispatcher("index.jsp?10").forward(request, response);
            }else {
                List<PostandUser> allPost = getAllPostService.getAllPost(start-10);
                request.setAttribute("allPost", allPost);
                request.setAttribute("start", start-10);
                request.getRequestDispatcher("index.jsp?"+start).forward(request, response);
            }
        }
    }
}
