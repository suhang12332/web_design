package service.Post;

import bean.Post;
import dao.PostDaoImpl;

import java.sql.SQLException;

public class getPostService {
    public Post getPostInformation(int id) {
        PostDaoImpl postDao = new PostDaoImpl();
        Post postinformation = null;
        try {
            postinformation = postDao.getPostbyId(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return postinformation;
    }
}
