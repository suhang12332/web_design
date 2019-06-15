package service.Post;

import bean.PostandUser;

import dao.PostDaoImpl;

import java.sql.SQLException;
import java.util.List;

public class searchService {
    public List<PostandUser> search(String c) {
        PostDaoImpl postDao = new PostDaoImpl();
        List search = null;
        try {
            search = postDao.search(c);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return search;
    }
    public List<PostandUser> searchMid(String c) {
        PostDaoImpl postDao = new PostDaoImpl();
        List search = null;
        try {
            search = postDao.searchMid(c);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return search;
    }
    public List<PostandUser> searchTea(String c) {
        PostDaoImpl postDao = new PostDaoImpl();
        List search = null;
        try {
            search = postDao.searchTea(c);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return search;
    }
}
