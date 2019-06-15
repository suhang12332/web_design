package service.Plate;

import bean.PostandPlate;
import dao.PostandPlateImpl;

import java.sql.SQLException;
import java.util.List;

public class getPostandPlate {
    public List<PostandPlate> getPostandPlate(String name) {
        PostandPlateImpl postandPlate = new PostandPlateImpl();
        List<PostandPlate> postandPlate1 = null;
        try {
            postandPlate1 = postandPlate.getPostandPlate(name);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return postandPlate1;
    }
}
