package service.Post;

import bean.Post;
import bean.PostandUser;
import dao.PostDaoImpl;

import java.sql.SQLException;

public class deletePostService {
    public Boolean deletePost(int id) {
        PostDaoImpl postDao = new PostDaoImpl();
        Boolean aBoolean = null;
        Boolean aBoolean1 = null;
        try{
            aBoolean = postDao.deleteReturnpost(id);  //删除回复的内容
            aBoolean1 = postDao.deletePost(id);  //删除帖子
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (aBoolean1) {
            return true;
        } else {
            return false;
        }
    }
    public PostandUser postandUser(int id) {
        PostDaoImpl postDao = new PostDaoImpl();
        PostandUser postandUser = null;
        try {
            postandUser = postDao.PostandUser(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return postandUser;

    }
}
