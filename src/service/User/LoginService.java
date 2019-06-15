package service.User;

import bean.User;
import dao.UserDaoImpl;

import java.sql.SQLException;

public class LoginService {
    User user=null;
    String password;
    String username;
    public LoginService(String username,String password) {
        this.password = password;
        this.username = username;
    }
    public User LoginService() {
        UserDaoImpl userDao=new UserDaoImpl();
        try {
            user = userDao.NameFindAll(username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
    public Boolean Login(){
        if (user != null&&user.getUserPassword().equals(password)) {
            return true;
        }else {
            return false;
        }
    }
}
