package service.Post;

import bean.PostandUser;
import dao.PostDaoImpl;

import java.sql.SQLException;
import java.util.List;

public class getAllPostService {
    public List<PostandUser> getAllPost(int start){
        PostDaoImpl postDao=new PostDaoImpl();
        List<PostandUser> postandUsers = null;
        try {
            postandUsers= postDao.FindAll(start);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return postandUsers;
    }
    public List<PostandUser> getAllPost(){
        PostDaoImpl postDao=new PostDaoImpl();
        List<PostandUser> postandUsers = null;
        try {
            postandUsers= postDao.FindAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return postandUsers;
    }
}
