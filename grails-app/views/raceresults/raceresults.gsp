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
        <g:form action="showResults">
            <div class="form-group">
                <label for="type">Search Type:</label>
                <select name="type" id="type" onchange="updateFormFields()">
                    <option value="last">Most Recent Race</option>
                    <option value="specific">Specific Race</option>
                    <option value="driver">Driver Results</option>
                    <option value="position">Finishing Position</option>
                </select>
            </div>

            <div id="specificFields" style="display:none;">
                <div class="form-group">
                    <label for="specificYear">Year:</label>
                    <input type="number" name="year" id="specificYear" min="1950" max="${new Date().getYear() + 1900}"
                           placeholder="Ej: 2023" required />
                </div>
                <div class="form-group">
                    <label for="round">Round:</label>
                    <input type="number" name="round" id="round" min="1" max="25"
                           placeholder="Ej: 5" required />
                </div>
            </div>

            <div id="driverFields" style="display:none;">
                <div class="form-group">
                    <label for="driverId">Driver ID (e.g., alonso):</label>
                    <input type="text" name="driverId" id="driverId"
                           placeholder="Ej: alonso, hamilton" required />
                </div>
                <div class="form-group">
                    <label for="specificYear">Year (optional):</label>
                    <input type="number" name="year" id="driverYear" min="1950"
                           max="${new Date().getYear() + 1900}" placeholder="Ej: 2023" />
                </div>
                <div class="form-group">
                    <label for="constructorId">Constructor ID (optional, e.g., renault):</label>
                    <input type="text" name="constructorId" id="constructorId"
                           placeholder="Ej: mercedes, ferrari" />
                </div>
            </div>

            <div id="positionFields" style="display:none;">
                <div class="form-group">
                    <label for="specificYear">Year:</label>
                    <input type="number" name="year" id="positionYear" min="1950"
                           max="${new Date().getYear() + 1900}" placeholder="Ej: 2023" required />
                </div>
                <div class="form-group">
                    <label for="position">Position:</label>
                    <input type="number" name="position" id="position" min="1" max="30"
                           placeholder="Ej: 1 para ganadores" required/>
                </div>
            </div>

            <button type="submit" class="btn">Search</button>

            <g:if test="${flash.error}">
                <div class="error">${flash.error}</div>
            </g:if>

        </g:form>
    </div>

    <div class="results-panel">
        <g:if test="${raceResults}">
            <div class="race-info">
                <h2>${raceResults.raceName}</h2>
                <p><span class="label">Season:</span> ${raceResults.season}</p>
                <p><span class="label">Round:</span> ${raceResults.round}</p>
                <p><span class="label">Date:</span> ${raceResults.date}</p>
                <p><span class="label">Circuit:</span> ${raceResults.Circuit.circuitName} (${raceResults.Circuit.Location.locality}, ${raceResults.Circuit.Location.country})</p>
            </div>

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
                <g:each in="${raceResults.Results}" var="result">
                    <tr class="position-${result.position}">
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
        </g:if>
        <g:else>
            <p class="error">No race results found for the specified criteria.</p>
        </g:else>
    </div>
</div>

<script>
    function updateFormFields() {
        const type = document.getElementById('type').value;

        // Hide all field groups first
        document.getElementById('specificFields').style.display = 'none';
        document.getElementById('driverFields').style.display = 'none';
        document.getElementById('positionFields').style.display = 'none';

        // Show the relevant field group
        if (type === 'specific') {
            document.getElementById('specificFields').style.display = 'block';
        } else if (type === 'driver') {
            document.getElementById('driverFields').style.display = 'block';
        } else if (type === 'position') {
            document.getElementById('positionFields').style.display = 'block';
        }
    }

    // Initialize form fields based on current selection
    document.addEventListener('DOMContentLoaded', function() {
        const type = "${params.type ?: 'last'}";
        document.getElementById('type').value = type;
        updateFormFields();

        // Set previous values if they exist
        <g:if test="${params.year}">
        if(type === 'specific'){
            document.getElementById('specificYear').value = "${params.year}";
        } else if(type === 'driver'){
            document.getElementById('driverYear').value = "${params.year}";
        } else if(type === 'position'){
            document.getElementById('positionYear').value = "${params.year}";
        }
        </g:if>
        <g:if test="${params.round}">
        document.getElementById('round').value = "${params.round}";
        </g:if>
        <g:if test="${params.driverId}">
        document.getElementById('driverId').value = "${params.driverId}";
        </g:if>
        <g:if test="${params.constructorId}">
        document.getElementById('constructorId').value = "${params.constructorId}";
        </g:if>
        <g:if test="${params.position}">
        document.getElementById('position').value = "${params.position}";
        </g:if>
    });
</script>
</body>
</html>