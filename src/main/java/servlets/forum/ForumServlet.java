package servlets.forum;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.io.IOException;
import java.util.*;


@WebServlet(urlPatterns = "/forumurl")
public class ForumServlet extends HttpServlet {
    private Map<String, List<Message>> chatMap = new HashMap<>();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String nick = req.getParameter("nick-param");
        if ("".equals(nick) || nick == null) {
            req.getServletContext().getRequestDispatcher("/pages/login/login.jsp").forward(req, resp);        }
        String theme = req.getParameter("theme-param");
        if ("".equals(theme) || theme == null) {
            theme = "notheme";
        }

        printMessages(req, resp, theme, nick);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();


        Date d = new Date();           // время что так, что ниже в меседж записывается в дебагере видно,
        String date = d.toString();    // но на экране в джсп нулевачка :(

        // String date = String.valueOf(new Date());


        String nick = (String) session.getAttribute("nick-session-param");

        //todo нормальная проверка
        if ("".equals(nick) || nick == null ) {
                    nick= req.getParameter("nick-param");
            if ("".equals(nick) || nick == null) {
                String relog = "relogin";
                req.setAttribute("relogin", relog);
                req.getServletContext().getRequestDispatcher("/pages/login/jsplogin.jsp").forward(req, resp);
                    return;
            }
            session.setAttribute("nick-session-param", nick);
        }



        String theme = req.getParameter("theme-param");                                                     //theme
        if ("".equals(theme) || theme == null) {
            theme = "notheme";
        }


        String text = req.getParameter("text-param");




        if (!(text == null || text.equals(""))) {
            // типПеременной названиеПеременной = значениеПеременной
            // условие ? елси да : если нет
            //(chatMap.containsKey(theme)) ? chatMap.get(theme) : new ArrayList<>()

            List<Message> messages = (chatMap.containsKey(theme)) ? chatMap.get(theme) : new ArrayList<Message>();

            messages.add(new Message(nick, text, date));
            chatMap.put(theme, messages);

            printMessages(req, resp, theme, nick);

        }


           }

    private void printMessages(HttpServletRequest req, HttpServletResponse resp, String theme, String nick) throws ServletException, IOException {

        if (chatMap.containsKey(theme)) {

            req.setAttribute("m", chatMap.get(theme));
        }
        req.setAttribute("n", nick);
        req.setAttribute("th", theme);
        req.getServletContext().getRequestDispatcher("/pages/forum/forum.jsp").forward(req, resp);
    }

}