/*
 * Project Software Development
 * Karel de Grote-Hogeschool
 * 2006-2007
 *
 */

package be.kdg.yahtzee.servlets.profile;

import be.kdg.yahtzee.remoteObjects.YahtzeeController;
import be.kdg.yahtzee.remoteObjects.users.User;
import be.kdg.yahtzee.servlets.YahtzeeServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ShowProfileServlet extends YahtzeeServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("user");

        YahtzeeController yahtzeeController = findYahtzeeController();

        User user = yahtzeeController.findUser(userName);

        request.setAttribute("userName", user.getUsername());
        request.setAttribute("firstName", user.getFirstname());
        request.setAttribute("surName", user.getSurname());
        request.setAttribute("city", user.getAddress().getCity());
        request.setAttribute("country", user.getAddress().getCountry());
        request.setAttribute("highestScore", yahtzeeController.getHighestScore(user));

        forward("/faces/profile/profile.jsp", request, response);
    }
}
