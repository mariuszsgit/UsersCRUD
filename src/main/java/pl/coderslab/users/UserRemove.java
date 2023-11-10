package pl.coderslab.users;

import pl.coderslab.entity.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserRemove", value = "/user/remove")
public class UserRemove extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        int userID = 0;
        try {
            userID = Integer.parseInt(id);
        } catch (NumberFormatException e) {
            response.getWriter().println("Invalid ID");
        }

        // Todo: Verify if user has been removed?
        UserDao userDao = new UserDao();
        userDao.delete(userID);

        Cookie cookie = new Cookie("message", "removed");
        cookie.setMaxAge(5);
        response.addCookie(cookie);

        response.sendRedirect("/user/list");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}