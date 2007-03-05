<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>

<f:view locale="#{language}">
    <f:loadBundle basename="bundles.resources" var="labels"/>
    <html>
    <head>
        <link href="../css/adminStyle.css" rel="stylesheet" type="text/css"/>
        <title>
            <h:outputText value="#{labels.scoreManTitle}"/>
        </title>
    </head>
    <body>
    <div id="adminSource">
        <table align="center">
            <tr>
                <td id="logout">
                    <a href="../logout/LogoutServlet" class="special">
                        <h:outputText value="#{labels.logout}"/>
                    </a>
                </td>
            </tr>
            <tr>
                <td><h1>
                    <h:outputText value="#{labels.scoreManTitle}"/>
                </h1></td>
            </tr>
            <tr>
                <td><a href="/admin/ShowHighscoresServlet?filter=top10">
                    <h:outputText value="#{labels.scoreManTop}"/>
                </a></td>
            </tr>
            <tr>
                <td><a href="/admin/ShowHighscoresServlet?filter=allScores">
                    <h:outputText value="#{labels.scoreManAll}"/>
                </a></td>
            </tr>
        </table>
        <a href="/faces/admin/administrator.jsp" class="special">
            <h:outputText value="#{labels.adminBack}"/>
        </a>
    </div>
    </body>
    </html>
</f:view>