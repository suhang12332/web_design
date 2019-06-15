package dao;
import Dao.imp.PostDao;
import bean.Post;
import bean.PostandUser;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import util.C3P0JDBCUtil;
import util.dateNow;
import java.sql.SQLException;
import java.util.List;
@SuppressWarnings("all")
public class PostDaoImpl implements PostDao {
    //将发帖存入数据库
    public Integer postInformation(String platename,Integer userid,String posttitle,String postcontent) throws SQLException {
        QueryRunner runner = new QueryRunner(C3P0JDBCUtil.getDataSource());
        String sql="insert into Post(postId,postPlatename,postUserid,postReplycount,postTitle,postContent,PostTime)values(?,?,?,?,?,?,?)";
        Object[] params = {null, platename, userid,null,posttitle,postcontent,dateNow.getDateNow()}; //写帖子的时候没有回复数
        int update = runner.update(sql, params);
        return update;
    }
    //查询某一个板块的总的帖子数量
    public Object platePostCount(String platename) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(C3P0JDBCUtil.getDataSource());
        String sql="select count(*) from Post where postPlatename=?";
        Object query = queryRunner.query(sql, new ScalarHandler(), platename);
        return query;
    }
    //将所得数据存到Plate表中
    public Integer insertPlateCount(String platename) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(C3P0JDBCUtil.getDataSource());
        String sql = "update Plate set platePostcount=? where plateName=?";
        int num = queryRunner.update(sql, new Object[]{platePostCount(platename), platename});
        return num;
    }
    //跟查询所有的帖子以及用户(连接查询)
    public List<PostandUser> FindAll(int start) throws SQLException {
         String sql = "select * from Post,User where User.userId=Post.postUserid order by postTime desc limit ?,10";
        QueryRunner runner = new QueryRunner(C3P0JDBCUtil.getDataSource());  //创建runner对象
        List<PostandUser> list = runner.query(sql, new BeanListHandler<>(PostandUser.class),start);
       return  list;
    }
    public List<PostandUser> FindAll() throws SQLException {
        String sql = "select * from Post,User where User.userId=Post.postUserid order by postTime";
        QueryRunner runner = new QueryRunner(C3P0JDBCUtil.getDataSource());  //创建runner对象
        List<PostandUser> list = runner.query(sql, new BeanListHandler<>(PostandUser.class));
        return  list;
    }
    //查询当前用户的发帖信息
    public List<PostandUser> getPostandUser(int id) throws SQLException {
        String sql="select * from User,Post where User.userId=Post.postUserid and User.userId=? order by postTime desc;";
        QueryRunner queryRunner = new QueryRunner(C3P0JDBCUtil.getDataSource());
        List<PostandUser> list = queryRunner.query(sql, new BeanListHandler<>(PostandUser.class),id);
        return list;
    }
    //根据用户名称查找当前用户的发帖子信息
    public List<PostandUser> getPostandUserByName(String name) throws SQLException {
        String sql="select * from User,Post where User.userId=Post.postUserid and User.userName=? order by postTime desc;";
        QueryRunner queryRunner = new QueryRunner(C3P0JDBCUtil.getDataSource());
        List<PostandUser> list = queryRunner.query(sql, new BeanListHandler<>(PostandUser.class),name);
        return list;
    }
    //根据帖子id查找帖子的全部信息
    public Post getPostbyId(int id) throws SQLException {
        String sql = "select * from Post , Plate where postPlatename=plateName and postId=?";
        QueryRunner queryRunner = new QueryRunner(C3P0JDBCUtil.getDataSource());
        Post post = queryRunner.query(sql, new BeanHandler<>(Post.class), id);
        return post;
    }
    //根据贴子的id删除指定的帖子的回复
    public Boolean deleteReturnpost(int id) throws SQLException {
        String sql = "delete from ReturnPost where returnPostid=?";
        QueryRunner queryRunner = new QueryRunner(C3P0JDBCUtil.getDataSource());
        int num = queryRunner.update(sql, id);
        if (num > 0) {
            return true;
        }else {
            return false;
        }
    }
    //根据贴子的id删除指定帖子
    public Boolean deletePost(int id) throws SQLException {
        String sql = "delete from Post where postId=?";
        QueryRunner queryRunner = new QueryRunner(C3P0JDBCUtil.getDataSource());
        int num = queryRunner.update(sql, id);
        if (num > 0) {
            return true;
        } else {
            return false;
        }
    }
    //首字查询
    public List search(String c) throws SQLException {
        String sql = "select * from Post,User where User.userId=Post.postUserid and postTitle like ? order by postTime desc ";
        QueryRunner queryRunner = new QueryRunner(C3P0JDBCUtil.getDataSource());
        List<PostandUser> list = queryRunner.query(sql, new BeanListHandler<>(PostandUser.class),c+"%"+"%");
        return  list;
    }
    //中字查询
    public List searchMid(String c) throws SQLException {
        String sql = "select * from Post,User where User.userId=Post.postUserid and postTitle like  ? order by postTime desc ";
        QueryRunner queryRunner = new QueryRunner(C3P0JDBCUtil.getDataSource());
        List<PostandUser> list = queryRunner.query(sql, new BeanListHandler<>(PostandUser.class),"%"+c+"%");
        return  list;
    }
    //尾字查询
    public List searchTea(String c) throws SQLException {
        String sql = "select * from Post,User where User.userId=Post.postUserid and postTitle like  ? order by postTime desc ";
        QueryRunner queryRunner = new QueryRunner(C3P0JDBCUtil.getDataSource());
        List<PostandUser> list = queryRunner.query(sql, new BeanListHandler<>(PostandUser.class),"%"+"%"+c);
        return  list;
    }
    public PostandUser PostandUser(int id) throws SQLException {
        String sql = "select * from User,Post where Post.postUserid=User.userId and Post.postId=?;";
        QueryRunner queryRunner = new QueryRunner(C3P0JDBCUtil.getDataSource());
        PostandUser postandUser = queryRunner.query(sql, new BeanHandler<>(PostandUser.class), id);
        return postandUser;
    }
}