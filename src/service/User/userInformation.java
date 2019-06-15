package service.User;

import bean.User;
import dao.UserDaoImpl;

import java.sql.SQLException;

public class userInformation {
    UserDaoImpl userDao = new UserDaoImpl();
    public Boolean getUserInformation(String birthday, String usersate, String userimg,String username) {
        Boolean num=null;
        try {
            num=userDao.userInformation(birthday, usersate, userimg, username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(num){
            return true;
        }else {
            return false;
        }
    }
}
