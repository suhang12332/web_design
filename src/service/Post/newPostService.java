package service.Post;

import dao.PostDaoImpl;

import java.sql.SQLException;

public class newPostService {
    Integer integer = null;
    PostDaoImpl postDao = null;
    public Integer getPostInformation(String platename, Integer userid, String posttitle, String postcontent) {
        postDao = new PostDaoImpl();
        try {
            integer = postDao.postInformation(platename, userid, posttitle, postcontent);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return integer;
    }
}