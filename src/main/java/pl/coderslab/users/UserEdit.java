package pl.coderslab.users;

import org.mindrot.jbcrypt.BCrypt;
import pl.coderslab.entity.User;
import pl.coderslab.entity.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserEdit", value = "/user/edit")
public class UserEdit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        int userId = Integer.parseInt(id);

        UserDao userDao = new UserDao();
        User user = userDao.read(userId);

        String name = user.getUserName();
        String email = user.getEmail();
        String password = user.getPassword();

        request.setAttribute("id", userId);
        request.setAttribute("name", name);
        request.setAttribute("email", email);
        request.setAttribute("password", password);

        getServletContext().getRequestDispatcher("/users/edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");

        String id = request.getParameter("id");
        String userName = request.getParameter("userName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        int userId = Integer.parseInt(id);

        UserDao userDao = new UserDao();
        User user = userDao.read(userId);
        String hashPassword = user.getPassword();

        System.out.println(password);
        System.out.println(hashPassword);

        if (BCrypt.checkpw(password, hashPassword)) {
            System.out.println(("Hasło jest poprawne"));
        } else {
            System.out.println("Hasło jest niepoprawne");
        }

        if (!userName.equals(user.getUserName())) {
            user.setUserName(userName);
        }
        if (!email.equals(user.getEmail())) {
            user.setEmail(email);
        }
        if (!password.isEmpty()) {
            user.setPassword(password);
        }

        userDao.update(user);

        response.sendRedirect("/user/list");
    }
}