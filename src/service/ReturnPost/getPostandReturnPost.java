package service.ReturnPost;

import bean.PostandUser;
import bean.userPostandReturnPost;
import dao.PostDaoImpl;
import dao.PostandPlateImpl;
import dao.userPostandReturnPostDaoImpl;

import java.sql.SQLException;
import java.util.List;

public class getPostandReturnPost {
    public List<userPostandReturnPost> getPostadnReturnPost(int id) {
        userPostandReturnPostDaoImpl userPostandReturnPostDao = new userPostandReturnPostDaoImpl();
        List<userPostandReturnPost> userPostandReturnPosts = null;
        try {
            userPostandReturnPosts = userPostandReturnPostDao.getUserPostandReturn(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userPostandReturnPosts;
    }
    public  PostandUser getPostandUser(int id){
        userPostandReturnPostDaoImpl userPostandReturnPostDao = new userPostandReturnPostDaoImpl();
        PostandUser postandUser = null;
        try {
            postandUser = userPostandReturnPostDao.getPostandUser(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return postandUser;
    }

}
