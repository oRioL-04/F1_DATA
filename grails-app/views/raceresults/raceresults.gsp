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
        <g:form controller="raceresults" action="showResults" method="GET" onsubmit="return cleanForm()">
            <div class="form-group">
                <label for="type">Search Type:</label>
                <select name="type" id="type" onchange="updateFormFields()" required>
                    <option value="last" ${params.type == 'last' ? 'selected' : ''}>Most Recent Race</option>
                    <option value="specific" ${params.type == 'specific' ? 'selected' : ''}>Specific Race</option>
                    <option value="driver" ${params.type == 'driver' ? 'selected' : ''}>Driver Results</option>
                    <option value="position" ${params.type == 'position' ? 'selected' : ''}>Finishing Position</option>
                </select>
            </div>

            <!-- Specific Race Fields -->
            <div id="specificFields" class="form-group" style="display:none;">
                <label for="specificYear">Year (required):</label>
                <input type="number" id="specificYear"
                       min="1950" max="${new Date().getYear() + 1900}"
                       value="${params.specificYear}" placeholder="Ej: 2023" required />
                <label for="specificRound">Round (required):</label>
                <input type="number" id="specificRound"
                       min="1" max="25"
                       value="${params.specificRound}" placeholder="Ej: 5" required />
            </div>

            <!-- Driver Fields -->
            <div id="driverFields" class="form-group" style="display:none;">
                <label for="driverId">Driver ID (required):</label>
                <input type="text" id="driverId"
                       value="${params.driverId}" placeholder="Ej: alonso" required />

                <label for="driverYear">Year (required if constructor is not specified):</label>
                <input type="number" id="driverYear"
                       min="1950" max="${new Date().getYear() + 1900}"
                       value="${params.driverYear}" placeholder="Ej: 2023" />

                <label for="constructorId">Constructor ID (required if year is not specified):</label>
                <input type="text" name="constructorId" id="constructorId"
                       placeholder="Ej: mercedes, ferrari" />
            </div>

            <!-- Position Fields -->
            <div id="positionFields" class="form-group" style="display:none;">
                <label for="positionYear">Year (required):</label>
                <input type="number" id="positionYear"
                       min="1950" max="${new Date().getYear() + 1900}"
                       value="${params.positionYear}" placeholder="Ej: 2023" required />
                <label for="finishPosition">Position (required):</label>
                <input type="number" id="finishPosition"
                       min="1" max="30"
                       value="${params.finishPosition}" placeholder="Ej: 1" required />
            </div>

            <button type="submit" class="btn">Search</button>
            <g:if test="${flash.error}"><div class="error">${flash.error}</div></g:if>
        </g:form>
    </div>
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

<script>
    const fieldsByType = {
        last: [],
        specific: ['specificYear','specificRound'],
        driver: ['driverId','driverYear'],
        position: ['positionYear','finishPosition']
    };
    const nameMapping = {
        specificYear: 'year',
        specificRound: 'round',
        driverId: 'driverId',
        driverYear: 'year',
        positionYear: 'year',
        finishPosition: 'position'
    };

    function updateFormFields() {
        const type = document.getElementById('type').value;
        Object.values(fieldsByType).flat().forEach(id => {
            const el = document.getElementById(id);
            if (el) {
                el.parentElement.style.display = 'none';
                el.removeAttribute('name');
                el.removeAttribute('required');
            }
        });
        fieldsByType[type].forEach(id => {
            const el = document.getElementById(id);
            if (el) {
                el.parentElement.style.display = 'block';
                el.setAttribute('name', nameMapping[id]);
                // re-add required if originally required
                if (['specificYear','specificRound','driverId','positionYear','finishPosition'].includes(id)) {
                    el.setAttribute('required', 'required');
                }
            }
        });
    }

    function cleanForm() {
        const type = document.getElementById('type').value;

        if (type === 'driver') {
            const year = document.getElementById('driverYear').value.trim();
            const constructor = document.getElementById('constructorId').value.trim();

            if ((year && constructor) || (!year && !constructor)) {
                alert("Error: You must specify either Year or Constructor, not both.");
                return false;
            }
        }

        return true;
    }


    document.addEventListener('DOMContentLoaded', () => {
        const type = "${params.type ?: 'last'}";
        document.getElementById('type').value = type;
        updateFormFields();
    });
</script>
</body>
</html>