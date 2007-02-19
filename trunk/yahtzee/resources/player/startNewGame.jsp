<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>

<f:view locale="#{language}">

    <f:loadBundle basename="bundles.resources" var="labels"/>

    <html>
    <head>
        <link href="../css/formStyle.css" rel="stylesheet" type="text/css" />
        <title><h:outputText value="#{labels.newGameTitle}"/></title></head>
    <body>
    <div id="newGame">
        <form action="/faces/game/NewGameServlet" method="post">
            <table>
                <tr>
                    <td colspan="2"><img src="../images/logo.png" class="logo" alt="Yahtzee"/></td>
                </tr>
                <tr>
                    <td colspan="2"><h1><h:outputText value="#{labels.newGameStart}"/></h1></td>
                </tr>
                <tr>
                    <td><h:outputText value="#{labels.newGameName}"/></td>
                    <td><input type="text" name = "gameName" class="text"/></td>
                </tr>
                <tr>
                    <td><h:outputText value="#{labels.newGameNumber}"/></td>
                    <td><select name="maxPlayer">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                    </select>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td><input type="submit" value="<h:outputText value="#{labels.newGameButton}"/>" class="btn"/></td>
                </tr>
                <tr><td colspan="2">${error}</td></tr>
            </table>
        </form>
    </div>
    </body>
    </html>
</f:view>