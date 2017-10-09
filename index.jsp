<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 07.10.2017
  Time: 21:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$WorkSheet$</title>
    <style>
      table, th, td {
        border: 3px solid black;
        padding: 5px;
        text-align: center;
      }
      table {
        border-spacing: 5px;
      }
    </style>
  </head>
  <body>
  <% String name = (String)session.getAttribute("name");%>
  <% String surname = (String)session.getAttribute("surname");%>
  <%Integer age = (Integer) session.getAttribute("age");%>

  <% if (age==null || age.equals("") ){%>
  <form action="/worksheet" method="POST">
    <fieldset>
      <legend><h1 style="text-align:center;">Worksheet:</h1></legend>
      Name:<br>
      <input type="text" name="name">
      <br>
      Surname:<br>
      <input type="text" name="surname" >
      <br>
      Age:<br>
      <input type="text" name="age" >
      <br>
      <input type="reset" value="Reset">
      <br>
      <h1>Answer some questions:</h1>
      <br>
      <h3>According to Kant, any synthetic truth is derived from sense experience.</h3><br>
      <input type="radio" name="sense" value="true" checked> <h4>True</h4>
      <input type="radio" name="sense" value="false">  <h4>False</h4>
      <hr>
      <h3>Like Descartes, Locke took geometry as a model for philosophical knowledge.</h3><br>
      <input type="radio" name="model" value="true" checked>  <h4>True</h4>
      <input type="radio" name="model" value="false"> <h4>False</h4>
      <hr>
      <h3>Epistemological dualism involves primarily the mind and objects in the external world.</h3><br>
      <input type="radio" name="dualism" value="true" checked> <h4>True</h4>
      <input type="radio" name="dualism" value="false"> <h4>False</h4>
      <hr>
      <h1>Press submit to check statistics</h1>
      <input type="submit" value="Submit">
    </fieldset>
  </form>
  <br>

  <% }else {%>
  <h2><%=name%>  <%=surname%>  there is some statistics for you:</h2>
  <h3>In the questionnaire participated:</h3>
  <h2><%=session.getAttribute("ageToTwenty")%>  people under the age of 20 years.</h2>
  <h2><%=session.getAttribute("ageToFifty")%>  people in range of 20-50 years.</h2>
  <h2><%=session.getAttribute("ageAfterFifty")%>  people over the age of 50 years.</h2>
  <table style="width:100%">
    <caption><h2><b>Statistics</b></h2></caption>
    <tr>
      <th>First question</th>
      <th>Second question</th>
      <th>Third question </th>
    </tr>
    <tr>
      <td> True <%=session.getAttribute("a")%> times </td>
      <td>True <%=session.getAttribute("c")%> times </td>
      <td>True <%=session.getAttribute("e")%> times </td>
    </tr>
    <tr>
      <td>False <%=session.getAttribute("b")%> times </td>
      <td>False <%=session.getAttribute("d")%> times </td>
      <td>False <%=session.getAttribute("f")%> times </td>
    </tr>
    <br>
    <h4><i>Click this link to <a href="/worksheet?a=out"> exit </a></i></h4>
  <%}%>
  </table>
  </body>
</html>