package service.User;

import bean.User;
import dao.UserDaoImpl;

import java.sql.SQLException;

public class FindPasswordService {
    public User getPassword(String username, String qq, String email) {
        UserDaoImpl userDao = new UserDaoImpl();
        User password=null;
        try {
            password = userDao.findPassword(username, qq, email);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return password;
    }
}
