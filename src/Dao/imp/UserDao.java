package Dao.imp;
import bean.User;
import jdk.jfr.Registered;

import java.sql.SQLException;
import java.util.List;
public interface UserDao{
    List<User> FindAll() throws SQLException;
    User NameFindAll(String sql) throws SQLException;
    Integer Registered(String name, String passwprd, String sex, String qq, String email) throws SQLException;
}
