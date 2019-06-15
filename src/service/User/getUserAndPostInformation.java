package service.User;

import bean.PostandUser;
import bean.User;
import dao.PostDaoImpl;
import dao.UserDaoImpl;

import java.sql.SQLException;
import java.util.List;

public class getUserAndPostInformation {
    public List<PostandUser> getUserAndPostInformation(int id){
        PostDaoImpl postDao = new PostDaoImpl();
        List<PostandUser> list = null;
        try {
            list = postDao.getPostandUser(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<PostandUser> getUserAndPostInformation(String name){
        PostDaoImpl postDao = new PostDaoImpl();
        List<PostandUser> list = null;
        try {
            list = postDao.getPostandUserByName(name);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public User findall(String username) {
        UserDaoImpl userDao=new UserDaoImpl();
        User user=null;
        try {
            user = userDao.NameFindAll(username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
