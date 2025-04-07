<%--
  Created by IntelliJ IDEA.
  User: oriol
  Date: 7/4/25
  Time: 10:22
--%>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>F1 Data</title>
</head>
<body>
<h1>F1 Drivers 2023</h1>
<ul>
    <g:each in="${drivers}" var="driver">
        <li>${driver.givenName} ${driver.familyName}</li>
    </g:each>
</ul>

<h1>Races 2023</h1>
<ul>
    <g:each in="${races}" var="race">
        <li>${race.raceName} - ${race.date}</li>
    </g:each>
</ul>
</body>
</html>
