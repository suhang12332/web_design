package dao;

import bean.PostandPlate;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import util.C3P0JDBCUtil;

import java.sql.SQLException;
import java.util.List;

public class PostandPlateImpl {
    //查询各个板块的发帖详情
    public List<PostandPlate> getPostandPlate(String platename) throws SQLException {
        String sql="select * from Post , Plate , User where Post.postPlatename=Plate.plateName and User.userId=Post.postUserid and plateName=?";
        QueryRunner queryRunner = new QueryRunner(C3P0JDBCUtil.getDataSource());
        List<PostandPlate> list = queryRunner.query(sql, new BeanListHandler<>(PostandPlate.class),platename);
        return list;
    }
}
