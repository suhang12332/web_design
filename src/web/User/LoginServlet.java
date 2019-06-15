package web.User;
import bean.PostandUser;
import bean.User;
import service.Post.getAllPostService;
import service.Post.getPlatePostCount;
import service.User.LoginService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
@SuppressWarnings("all")
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
//        UserDaoImpl userDao = new UserDaoImpl();  //创建UserDao对象
//        List<User> list = userDao.findAll();  //执行查找操作将返回的list复制给list
//        for (int i = 0; i < list.size(); i++) {
//            System.out.println(list.get(i).toString());
//        }
//        User user = null;//查询User
        /*通过查寻全部匹配用户名和密码(耗时长)
        String sql="select * from User";
        List<User> list = null;

        try {
            list  = userDao.findAll();  //通过获取的页面的username查找数据库中的password 与页面中的password对比
        } catch (SQLException e) {
            e.printStackTrace();
        }
        int i=0;
        boolean q=false;
        while(i<list.size()&q==false) {
            if(list.get(i).getUser_password().equals(password)&&list.get(i).getUser_name().equals(username)&&list!=null){
                q=true;
            }
            i++;
        }
        if(q){
            System.out.println("登录成功");
        }else {
            System.out.println("登录失败");
        }*/
        //使用条件查询,根据用户提供的用户名查询密码
//        User user = null;
//        try {
//            user = userDao.NameFindPassword(username);
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        if (user != null && user.getUser_password().equals(password)) {
//            System.out.println("登陆成功");
//        }else{
//            System.out.println("登录失败");
//        }
        //方便判断用户是否已经登录
        LoginService loginService = new LoginService(username,password);  //实例化servicec层的登录检测类,并且传入数据
        User user = loginService.LoginService();  //传入username 查找密码
        Boolean login = loginService.Login();  //判断密码是否匹配
        if (login) {
            HttpSession session = request.getSession(); //获取session 存入当前user对象
            session.setAttribute("user",user);
            getAllPostService getAllPostService = new getAllPostService();
            List<PostandUser> allPost = getAllPostService.getAllPost(0);
            List<PostandUser> allPost1 = getAllPostService.getAllPost();  //获取总条数
            request.setAttribute("allPost",allPost);
            request.setAttribute("start",0);
            request.setAttribute("allPost1", allPost1);
            request.getRequestDispatcher("index.jsp").forward(request, response);  //转发所有的帖子信息
            getPlatePostCount getPlatePostCount = new getPlatePostCount();  //发帖成功之后要动态更新各个帖子的总数信息
            Object java = getPlatePostCount.getPlatePostCount("Java");//总计java板块的帖子数量
            Object mysql = getPlatePostCount.getPlatePostCount("Mysql");
            Object htmlCss = getPlatePostCount.getPlatePostCount("HtmlCss");
        }else {
            response.getWriter().write("<script language='javascript'>alert('用户名或这密码错误')</script>");
            response.setHeader("refresh","0;login.jsp");
        }
    }
}
