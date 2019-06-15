package service.ReturnPost;

import bean.ReturnPostandUser;
import dao.returnPostImpl;

import java.sql.SQLException;
import java.util.List;

public class getReturnPostandUser {
    public List<ReturnPostandUser> getReturnPostandUser(int id) {
        returnPostImpl returnPost = new returnPostImpl();
        List < ReturnPostandUser > returnPost1 = null;
        try {
            returnPost1 = returnPost.getReturnPost(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return returnPost1;
    }
}
