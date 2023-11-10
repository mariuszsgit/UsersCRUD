package pl.coderslab.users;

import pl.coderslab.entity.User;
import pl.coderslab.entity.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserList", value = "/user/list")
public class UserList extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");

        String message = "";
        Cookie[] cookies = request.getCookies();
        String cookieName = "message";
        for (Cookie c : cookies) {
            if (cookieName.equals(c.getName())) {
                c.setMaxAge(0);
                message = "Użytkownik został usunięty";
                response.addCookie(c);
            }
        }

        UserDao userDao = new UserDao();
        User[] users = userDao.findAll();

        request.setAttribute("users", users);
        request.setAttribute("message", message);
        getServletContext().getRequestDispatcher("/users/list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}