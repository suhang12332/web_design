package service.ReturnPost;

import dao.returnPostImpl;

import java.sql.SQLException;

public class insertReturnpost {
    public Boolean inserReturnpost(int returnpostid, String returnPlatename, String returnContent, int returnUserid){
        returnPostImpl returnPost = new returnPostImpl();
        Boolean insert = null;
        try {
            insert=returnPost.insertReplay(returnpostid, returnPlatename, returnContent, returnUserid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return insert;
    }
}
