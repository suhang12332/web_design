package dao;

import Dao.imp.UserDao;
import bean.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import util.C3P0JDBCUtil;
import util.dateNow;

import java.sql.SQLException;
import java.util.List;
public class UserDaoImpl implements UserDao {
    //查询所有
    @Override
    public List<User> FindAll() throws SQLException {
        String sql = "select * from User";
        QueryRunner runner = new QueryRunner(C3P0JDBCUtil.getDataSource());  //创建runner对象
        List list = runner.query(sql, new BeanListHandler<>(User.class));
        return list;
    }
    //查询单个一行
    @Override
    public User NameFindAll(String name) throws SQLException {
        QueryRunner runner = new QueryRunner(C3P0JDBCUtil.getDataSource());
        String sql = "select * from User where userName=?";
        User user = runner.query(sql, new BeanHandler<>(User.class), name);
        return user;
    }
    //找回密码
    public User findPassword(String username,String qq,String email) throws SQLException {
        QueryRunner runner = new QueryRunner(C3P0JDBCUtil.getDataSource());
        String sql = "select * from User where userName=? and userQQ=? and userEmail=?";
        User user = runner.query(sql, new BeanHandler<>(User.class), username,qq,email);
        return user;
    }
    //插入用户信息
    public Integer Registered(String name, String password, String sex, String qq, String email) throws SQLException {
        QueryRunner runner = new QueryRunner(C3P0JDBCUtil.getDataSource());
        String sql="insert into User(userId,userName,userPassword,userEmail,userQQ,userBirthday,userSex,userImg,userSate,userDate)values(?,?,?,?,?,?,?,?,?,?)";
        Object[] params = {null,name, password, email,qq,null,sex,null,null,dateNow.getDateNow()};
        int update = runner.update(sql, params);
        return update;
    }
    //完善用户信息根据登录的用户信息，更新该用户的其他数据
    public Boolean userInformation(String birthday,String usersate,String userimg,String username) throws SQLException {
        QueryRunner runner = new QueryRunner(C3P0JDBCUtil.getDataSource());
        String sql = "update User set userBirthday=?,userSate=?,userImg=? where userName=?";
        int num = runner.update(sql, new Object[]{birthday, usersate, userimg,username});
        if (num > 0) {
            return true;
        }else {
            return false;
        }
    }
    //刷新用户的所有信息
    public User refreshUser(String username)throws SQLException {
        QueryRunner runner = new QueryRunner(C3P0JDBCUtil.getDataSource());
        String sql = "select * from User where userName=?";
        User user = runner.query(sql, new BeanHandler<>(User.class),username);
        return user;
    }
}
