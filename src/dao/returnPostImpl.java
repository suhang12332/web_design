package dao;
import bean.PostandUser;
import bean.ReturnPost;
import bean.ReturnPostandUser;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import util.C3P0JDBCUtil;
import util.dateNow;
import java.sql.SQLException;
import java.util.List;

@SuppressWarnings("all")
public class returnPostImpl {
    //插入回帖信息
    public Boolean insertReplay(int postid, String returnPlatename, String returnContent, int returnUserid) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(C3P0JDBCUtil.getDataSource());
        String sql = "insert into ReturnPost(returnId,returnPostid,returnPlatename,returnContent,returnUserid,returnTime)values(?,?,?,?,?,?);";
        Object [] params={null,postid,returnPlatename,returnContent,returnUserid,dateNow.getDateNow()};
        int insert = queryRunner.update(sql, params);
//        System.out.println(insert);
        if (insert > 0) {
            return true;
        }else {
            return false;
        }
    }
    //根据用户id查找该用户的回帖信息
    public List<ReturnPostandUser> getReturnPost(int id) throws SQLException {
        String sql="select * from User,ReturnPost,Post where User.userid=ReturnPost.returnUserid and User.userId=? and ReturnPost.returnPostid=Post.postId order by ReturnTime desc;";
        QueryRunner queryRunner = new QueryRunner(C3P0JDBCUtil.getDataSource());
        List<ReturnPostandUser> list = queryRunner.query(sql, new BeanListHandler<>(ReturnPostandUser.class),id);
        return list;
    }
}
