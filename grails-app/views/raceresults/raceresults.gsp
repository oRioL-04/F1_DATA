<%--
  Created by IntelliJ IDEA.
  User: oriol
  Date: 9/4/25
  Time: 11:31
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>F1 Race Results</title>
    <style>
    body {
        background-color: #000000;
        color: #FFFFFF;
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 20px;
    }

    .container {
        max-width: 1200px;
        margin: 0 auto;
    }

    h1 {
        color: #FF0000;
        text-align: center;
        margin-bottom: 30px;
    }

    .search-panel {
        background-color: #333333;
        padding: 20px;
        border-radius: 5px;
        margin-bottom: 30px;
    }

    .search-panel h2 {
        color: #FF0000;
        margin-top: 0;
    }

    .form-group {
        margin-bottom: 15px;
    }

    label {
        color: #FF0000;
        display: block;
        margin-bottom: 5px;
    }

    input, select {
        background-color: #555555;
        color: #FFFFFF;
        border: 1px solid #777777;
        padding: 8px;
        width: 100%;
        border-radius: 3px;
    }

    .btn {
        background-color: #FF0000;
        color: #FFFFFF;
        border: none;
        padding: 10px 20px;
        border-radius: 3px;
        cursor: pointer;
        font-weight: bold;
        margin-right: 10px;
    }

    .btn:hover {
        background-color: #CC0000;
    }

    .results-panel {
        background-color: #333333;
        padding: 20px;
        border-radius: 5px;
    }

    .race-info {
        margin-bottom: 20px;
    }

    .race-info p {
        margin: 5px 0;
    }

    .race-info span.label {
        color: #FF0000;
        font-weight: bold;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th {
        background-color: #222222;
        color: #FF0000;
        padding: 10px;
        text-align: left;
    }

    td {
        padding: 10px;
        border-bottom: 1px solid #555555;
    }

    tr:hover {
        background-color: #444444;
    }

    .position-1 {
        background-color: #1a3a1a;
    }

    .position-2 {
        background-color: #2a2a3a;
    }

    .position-3 {
        background-color: #3a2a1a;
    }

    .error {
        color: #FF0000;
        font-weight: bold;
    }
    </style>
</head>
<body>
<div class="container">
    <h1>Formula 1 Race Results</h1>

    <div class="search-panel">
        <h2>Search Results</h2>
        <g:form controller="raceresults" action="showResults" method="GET">
            <div class="form-group">
                <label for="type">Search Type:</label>
                <select name="type" id="type" onchange="updateFormFields()" required>
                    <option value="last" ${params.type == 'last' ? 'selected' : ''}>Most Recent Race</option>
                    <option value="specific" ${params.type == 'specific' ? 'selected' : ''}>Specific Race</option>
                    <option value="driver" ${params.type == 'driver' ? 'selected' : ''}>Driver Results</option>
                </select>
            </div>

            <!-- Specific Race Fields -->
            <div id="specificFields" class="form-group" style="display:none;">
                <label for="specificYear">Year:</label>
                <input type="number" id="specificYear" name="specificYear"
                       min="1950" max="2025"
                       value="${params.specificYear}" required />
                <label for="roundNumber">Round:</label>
                <input type="number" id="roundNumber" name="roundNumber"
                       min="1" max="23"
                       value="${params.roundNumber}" required />
            </div>

            <!-- Driver Fields -->
            <div id="driverFields" class="form-group" style="display:none;">
                <label for="driverId">Driver ID:</label>
                <input type="text" id="driverId" name="driverId"
                       value="${params.driverId}" required />
                <label for="driverYear">Year:</label>
                <input type="number" id="driverYear" name="driverYear"
                       min="1950" max="2025"
                       value="${params.driverYear}" required />
            </div>

            <button type="submit" class="btn">Search</button>
        </g:form>
    </div>

    <div class="results-panel">
        <g:if test="${raceResults?.Races}">
            <g:each in="${raceResults.Races}" var="race">
                <div class="race-info">
                    <h2>${race.raceName}</h2>
                    <p>Season: ${race.season}, Round: ${race.round}</p>
                    <p>Circuit: ${race.Circuit.circuitName} (${race.Circuit.Location.locality}, ${race.Circuit.Location.country})</p>

                    <table>
                        <thead>
                        <tr>
                            <th>Pos</th>
                            <th>Driver</th>
                            <th>Constructor</th>
                            <th>Grid</th>
                            <th>Laps</th>
                            <th>Status</th>
                            <th>Time</th>
                            <th>Points</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${race.Results}" var="result">
                            <tr>
                                <td>${result.positionText}</td>
                                <td>${result.Driver.givenName} ${result.Driver.familyName}</td>
                                <td>${result.Constructor.name}</td>
                                <td>${result.grid == '0' ? 'Pit Lane' : result.grid}</td>
                                <td>${result.laps}</td>
                                <td>${result.status}</td>
                                <td>${result.Time?.time ?: '-'}</td>
                                <td>${result.points}</td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
            </g:each>
        </g:if>
        <g:else>
            <p>No race results found for the selected criteria.</p>
        </g:else>
    </div>
</div>

<script>
    function updateFormFields() {
        const type = document.getElementById('type').value;
        document.getElementById('specificFields').style.display = (type === 'specific') ? 'block' : 'none';
        document.getElementById('driverFields').style.display = (type === 'driver') ? 'block' : 'none';
    }

    document.addEventListener('DOMContentLoaded', () => {
        updateFormFields();
    });
</script>

</body>
</html>