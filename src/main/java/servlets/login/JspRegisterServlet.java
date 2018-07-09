package servlets.login;



import DAO.DAO;
import DAO.SerializableDAO;
import user.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@WebServlet(urlPatterns = "/jspregisterservlet")
public class JspRegisterServlet extends HttpServlet {

    private static final String LOGIN_NAME_PARAM = "txt_login_name";
    private static final String PASSWD_NAME_PARAM = "txt_passwd_name";
    DAO dao = new SerializableDAO();
    List<User> getUse = new ArrayList<>();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String loginName = request.getParameter(LOGIN_NAME_PARAM);
        String passwdName = request.getParameter(PASSWD_NAME_PARAM);
        String message = " ";                   //message success or failure
        String loginNam = " ";
        String passwdNam = " ";

        User user = new User(loginName, passwdName);        //the user who entered the data
        User userCheck = new User(loginNam, passwdNam);     //user data from the database
//        System.out.println(userCheck.getLoginName());    // test

        for (User us : dao.getUsers()) {        //all users from the database
            getUse.add(us);
        }
        for (User usName : getUse) {
            if (user.getLoginName().equals(usName.getLoginName())) {        //check if there is such a login in the database
                userCheck.setLoginName(usName.getLoginName());              //Yes, write down the login for further verification
                userCheck.setPasswdName(usName.getPasswdName());            //and password
//              System.out.println(userCheck.getLoginName());   // test
            }
        }

        if (dao.getUsers().size() == 0 || !userCheck.getLoginName().equals(user.getLoginName())) {      //if the database is empty or there is no such login

            dao.addUsers(user);     //add user
            message = "You have successfully registered!";

        } else {
            message = " A User with that name already exists, Try again!";

        }
        request.setAttribute("m", message);
        request.setAttribute("login", loginName);
        request.getServletContext().getRequestDispatcher("/pages/login/jspregister.jsp").forward(request, response);
    }
}
