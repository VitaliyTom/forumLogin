package servlets.login;

/*import com.tomashevichVitaliy.DAO.DAO;
import com.tomashevichVitaliy.DAO.SerializableDAO;
import com.tomashevichVitaliy.user.User;*/

import DAO.SerializableDAO;
import user.User;
import DAO.DAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/jsploginservlet")
public class JspLoginServlet extends HttpServlet {

    private static final String LOGIN_NAME_PARAM = "txt_login_name";
    private static final String PASSWD_NAME_PARAM = "txt_passwd_name";
    DAO dao = new SerializableDAO();
    List<User> getUse = new ArrayList<>();


    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String message = " ";       //message success or failure
        String loginNam = " ";
        String passwdNam = " ";

        String loginName = request.getParameter(LOGIN_NAME_PARAM);
        String passwdName = request.getParameter(PASSWD_NAME_PARAM);
        User userLogining = new User(loginName, passwdName);        //the user who entered the data
        User userCheck = new User(loginNam, passwdNam);             //user data from the database

        for (User us : dao.getUsers()) {        //all users from the database
            getUse.add(us);
        }
        for (User usName : getUse) {
            if (userLogining.getLoginName().equals(usName.getLoginName())) {        //check if there is such a login in the database
                userCheck.setLoginName(usName.getLoginName());                      //Yes, write down the login for further verification
                userCheck.setPasswdName(usName.getPasswdName());                    //and password
            }
        }
        if (dao.getUsers().size() == 0 || !userCheck.getLoginName().equals(userLogining.getLoginName())     //if the database is empty
                || !userCheck.getPasswdName().equals(userLogining.getPasswdName())) {       //or the login or password does not match

            message = "Неверный логин или пароль";
        } else {
           // message = "You are logged in as an account";
            request.setAttribute("n", loginName);
            request.getServletContext().getRequestDispatcher("/pages/forum/start.jsp").forward(request, response);
                return;
        }
        request.setAttribute("m", message);
        request.setAttribute("login", loginName);
        request.getServletContext().getRequestDispatcher("/pages/login/jsplogin.jsp").forward(request, response);

    }
}
