package dao;

import bean.PostandUser;
import bean.User;
import bean.userPostandReturnPost;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.junit.Test;
import util.C3P0JDBCUtil;

import java.sql.SQLException;
import java.util.List;

public class userPostandReturnPostDaoImpl {
    @Test
    //根据帖子id查询所有的发帖回帖以及用户信息
    public List<userPostandReturnPost> getUserPostandReturn(int id) throws SQLException {
        String sql = "select * from User u,Post p,ReturnPost r where r.returnPostid=p.postId and r.returnUserid=u.userId and postId=?;";
        QueryRunner runner = new QueryRunner(C3P0JDBCUtil.getDataSource());  //创建runner对象
        List<userPostandReturnPost> list = runner.query(sql, new BeanListHandler<>(userPostandReturnPost.class),id);
        return  list;
    }
    //按照帖子id查询帖子和该发改帖子的用户信息
    public PostandUser getPostandUser(int id) throws SQLException {
        String sql="select * from User,Post where User.userId=Post.postUserid and Post.postId=? order by postTime desc;";
        QueryRunner queryRunner = new QueryRunner(C3P0JDBCUtil.getDataSource());
        PostandUser list = queryRunner.query(sql, new BeanHandler<>(PostandUser.class),id);
        return list;
    }
    //根据用户id查询该用户的发帖信息
    public PostandUser getPostandUserbyUserid(int id)throws SQLException {
        String sql="select * from Post p, User u where u.userId=p.postUserid and postUserid=? order by postTime desc;";
        QueryRunner queryRunner = new QueryRunner(C3P0JDBCUtil.getDataSource());
        PostandUser list = queryRunner.query(sql, new BeanHandler<>(PostandUser.class),id);
        return list;
    }
}
