package web.Plate;

import bean.PostandPlate;
import dao.PostandPlateImpl;
import service.Plate.getPostandPlate;
import service.ReturnPost.getPostandReturnPost;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@SuppressWarnings("all")
@WebServlet("/PlateInformationServlet")
public class PlateInformationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paltename = request.getQueryString();
        getPostandPlate getPostandPlate = new getPostandPlate();
        List<PostandPlate> postandPlate = null;
        if (paltename.equals("Java")) {
            postandPlate = getPostandPlate.getPostandPlate(paltename);
        } else if (paltename.equals("Mysql")) {
            postandPlate = getPostandPlate.getPostandPlate(paltename);
        } else if (paltename.equals("HtmlCss")) {
            postandPlate = getPostandPlate.getPostandPlate(paltename);
        }
        request.setAttribute("PostandPlate",postandPlate);
        request.getRequestDispatcher("PlateInformation.jsp").forward(request, response);
    }
}
