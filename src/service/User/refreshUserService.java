package service.User;

import bean.User;
import dao.UserDaoImpl;

import java.sql.SQLException;

public class refreshUserService {
    public User refreshUser(String username){
        UserDaoImpl userDao = new UserDaoImpl();
        User user = null;
        try {
            user = userDao.refreshUser(username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
