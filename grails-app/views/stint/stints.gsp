<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <style>
    .stint-content {
        display: flex;
        flex-direction: column;
        align-items: center;
        min-height: calc(100vh - 150px);
        padding: 20px;
        margin-top: 20px;
    }

    .stint-container {
        width: 90%;
        max-width: 1200px;
        background: #656060;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        margin: auto;
    }

    .stint-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        table-layout: fixed;
    }

    .stint-table th, .stint-table td {
        padding: 10px;
        border: 1px solid #645f5f;
    }

    .stint-table th {
        background-color: #615e5e;
        text-align: center;
    }

    .stint-title {
        color: #b3aeae;
        margin-bottom: 20px;
        text-align: center;
    }

    .stint-table th:first-child,
    .stint-table td:first-child {
        width: 20%;
        min-width: 100px;
        text-align: left;
        padding-left: 15px;
    }

    .stint-table th:last-child,
    .stint-table td:last-child {
        width: 80%;
    }

    .stint-bar {
        display: flex;
        width: 100%;
        height: 30px;
        background-color: #ffffff;
        overflow: hidden;
    }

    .stint-segment {
        height: 100%;
        flex-grow: 1;
        border-right: 1px solid rgba(0,0,0,0.1);
    }

    .soft { background-color: #d32f2f; }
    .medium { background-color: #fbc02d; }
    .hard { background-color: #ffffff; border: 1px solid #ccc; }
    .intermediate { background-color: #388e3c; }
    .wet { background-color: #1976d2; }
    </style>
</head>
<body>

<div class="stint-content">
    <div class="stint-container">
        <h1 class="stint-title">
            STINTS - ${meetingName }
        </h1>



        <table class="stint-table">
            <thead>
            <tr>
                <th>Piloto</th>
                <th>Stints</th>
            </tr>
            </thead>
            <tbody>
            <g:each var="entry" in="${groupedStints}">
                <tr>
                    <td>${driverMap[entry.key]}</td>
                    <td>
                        <div class="stint-bar">
                            <g:set var="totalLaps" value="${entry.value.sum { it.laps }}" />
                            <g:each var="stint" in="${entry.value}">
                                <div class="stint-segment ${stint.compound?.toLowerCase() ?: 'hard'}"
                                     style="flex: ${stint.laps / totalLaps};"
                                     title="${stint.compound}: Laps ${stint.lap_start} to ${stint.lap_start + stint.laps - 1}"></div>
                            </g:each>
                        </div>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
