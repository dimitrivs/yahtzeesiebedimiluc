<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="userBean" class="be.kdg.yahtzee.beans.UserBean" scope="session"/>

<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>

<f:view locale="#{language}">

<f:loadBundle basename="bundles.resources" var="labels"/>
<html>
<head>
    <link href="../css/formStyle.css" rel="stylesheet" type="text/css"/>
    <title>
        <h:outputText value="#{labels.profileTitle}"/>
    </title>

    <script type="text/javascript">
        function checkForm() {
            var form = document.createUser;
            var message = "";
            if (!form.username.value) message += "* <h:outputText value="#{labels.registerUsernameError}"/>\n";
            if (!form.pw.value) message += "* <h:outputText value="#{labels.registerPasswordErrorFout}"/>\n";
            if (!form.pw2.value) message += "* <h:outputText value="#{labels.registerRepeatError}"/>\n";
            if (!form.mail.value) message += "<h:outputText value="#{labels.error}"/>\n";
            if (message != "") {
                var mes = "<h:outputText value="#{labels.error}"/>\n" + message;
                alert(mes);
                return false;
            } else {
                var illegalChars = /^[0-9a-zA-Z]+$/;
                var illegalNums = /[0-9]+$/;

                if (form.username.value.length < 4 ||
                    !form.username.value.match(illegalChars) ||
                    form.username.value == form.name.value) {
                    alert("<h:outputText value="#{labels.error}"/>");
                    return false;
                } else if (form.number.value && !form.number.value.match(illegalNums)) {
                    alert("<h:outputText value="#{labels.error}"/>");
                    return false;
                } else if (form.zip.value && (!form.zip.value.match(illegalNums) || form.zip.value.length != 4)) {
                    alert("<h:outputText value="#{labels.error}"/>");
                    return false;
                } else if (form.pw.value.length < 6 ||
                           !form.pw.value.match(illegalChars) ||
                           form.pw.value == form.name.value) {
                    alert("<h:outputText value="#{labels.error}"/>");
                    return false;
                } else if (form.pw.value != form.pw2.value) {
                    alert("<h:outputText value="#{labels.error}"/>");
                    return false;
                }
            }
            return true;
        }
    </script>
</head>

<body>
<div id="container">
<div id="profile">
<table>
<form name="changePassword" action="/profile/ConfirmChangePasswordServlet?orgUser=${userBean.username}"
      method="post">

    <tr>
        <td><img src="../images/logo.png" class="logo" alt="Yahtzee"/></td>
        <td><h1>
            <h:outputText value="#{labels.profile}"/>
        </h1></td>
    </tr>
    <tr>
        <td>
            <h:outputText value="#{labels.profileOldPw}"/>
        </td>
        <td><input type="password" name="orgPass" class="text"/></td>
    </tr>
    <tr>
        <td>
            <h:outputText value="#{labels.profileNewPw}"/>
        </td>
        <td><input type="password" name="pw" class="text"/></td>
    </tr>
    <tr>
        <td>
            <h:outputText value="#{labels.profileRePw}"/>
        </td>
        <td><input type="password" name="pw2" class="text"/></td>
    </tr>
    <tr>
        <td><input type="submit" value="<h:outputText value="#{labels.profilePw}"/>" class="btn"></td>
    </tr>
</form>
<tr>
    <td>&nbsp;</td>
</tr>
<!-- onsubmit="return checkForm()"-->
<form name="changeProfile" action="/profile/ConfirmChangeProfileServlet?user=${userBean.username}" method="post">

    <tr>
        <td>
            <h:outputText value="#{labels.mail}"/>
        </td>
        <td><input type="text" name="mail" class="text" value="${userBean.email}"/></td>
    </tr>
    <tr>
        <td>
            <h:outputText value="#{labels.surname}"/>
        </td>
        <td><input type="text" name="surname" value="${userBean.surname}" class="text"/></td>
    </tr>
    <tr>
        <td>
            <h:outputText value="#{labels.firstname}"/>
        </td>
        <td><input type="text" name="firstname" value="${userBean.firstname}" class="text"/></td>
    </tr>
    <tr>
        <td>
            <h:outputText value="#{labels.telephone}"/>
        </td>
        <td><input type="text" name="telephone" value="${userBean.telephone}" class="text"/></td>
    </tr>
    <tr>
        <td>
            <h:outputText value="#{labels.street}"/>
            +
            <h:outputText value="#{labels.number}"/>
        </td>
        <td>
            <input type="text" class="text" name="street" size="12" value="${userBean.street}"/>&nbsp;
            <input type="text" name="number" class="text" size="1" value="${userBean.number}"/>
        </td>
    </tr>
    <tr>
        <td>
            <h:outputText value="#{labels.zip}"/>
        </td>
        <td><input type="text" name="zip" value="${userBean.zip}" class="text"/></td>
    </tr>
    <tr>
        <td>
            <h:outputText value="#{labels.city}"/>
        </td>
        <td><input type="text" name="city" value="${userBean.city}" class="text"/></td>
    </tr>
    <tr>
        <td>
            <h:outputText value="#{labels.country}"/>
        </td>
        <td><input type="text" name="country" value="${userBean.country}" class="text"/></td>
    </tr>
    <tr>
        <td>
            <h:outputText value="#{labels.language}"/>
        </td>
        <td><select name="taal">
            <option>Nederlands</option>
            <option>Fran&ccedil;ais</option>
            <option>English</option>
            <option>Deutsch</option>
            <option>Espa&ntilde;ol</option>
        </select>
        </td>
    </tr>
    <td><input type="submit" value="<h:outputText value="#{labels.profileTitle}"/>" class="btn"></td>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <td colspan="2" align="center" height="40px"><a href="/faces/player/gameRoom.jsp" class="back">
        <h:outputText value="#{labels.gameroomButton}"/>
    </a></td>
    <tr>
        <td colspan="2" align="center">${message}</td>
    </tr>

</form>
</table>
</div>
</div>
</body>
</html>
</f:view>