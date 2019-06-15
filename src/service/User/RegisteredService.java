package service.User;

import dao.UserDaoImpl;

import java.sql.SQLException;

public class RegisteredService {
    UserDaoImpl userDao=new UserDaoImpl();   //实例化查询条件
    public Integer Registered(String username, String password, String sex, String qq, String email){
        Integer registered = null;
        try {
            registered = userDao.Registered(username,password,sex,qq,email);  //得到查询之后结果
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return registered;
    }
}
