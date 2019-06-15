package web.Post;

import bean.PostandUser;
import service.Post.searchService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/searchServlet")
public class searchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        String sea = request.getParameter("search");
        searchService searchService = new searchService();
        List<PostandUser> search = searchService.search(sea);
        if (search.size()==0) {
            List<PostandUser> search1 = searchService.searchMid(sea);
            if (search1.size()==0) {
                List<PostandUser> search2 = searchService.searchTea(sea);
                request.setAttribute("search", search2);
                request.getRequestDispatcher("searchResult.jsp").forward(request, response);
            }else {
                request.setAttribute("search", search1);
                request.getRequestDispatcher("searchResult.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("search", search);
            request.getRequestDispatcher("searchResult.jsp").forward(request, response);
        }
    }
}
