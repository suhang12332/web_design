package dao;

import org.apache.commons.dbutils.QueryRunner;
import org.junit.Test;
import util.C3P0JDBCUtil;

import java.sql.SQLException;

public class test {
    @Test
    public void delete() throws SQLException {
        String sql = "delete from ReturnPost where returnPostid=34";
        QueryRunner queryRunner = new QueryRunner(C3P0JDBCUtil.getDataSource());
        int num = queryRunner.update(sql);
        System.out.println(num);
    }
}
