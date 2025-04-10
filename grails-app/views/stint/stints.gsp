<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Stints del Gran Premio</title>
    <style>
    .driver-label {
        font-weight: bold;
        margin-top: 10px;
    }
    .stint-bar {
        display: flex;
        height: 20px;
        margin-bottom: 10px;
    }
    .stint-segment {
        height: 100%;
        border-right: 1px solid #ccc;
    }
    </style>
</head>
<body>

<h1>Stints del ${meetingName}</h1>

<g:if test="${noRace}">
    <p style="color: red;">No hay sesión de carrera para este Gran Premio.</p>
</g:if>

<div id="chart-container" style="margin-top: 20px;"></div>

<script>
    const driverMap = ${driverMap ? raw(driverMap as grails.converters.JSON) : '{}'};
    const meetingKey = ${meetingKey};

    async function loadStints() {
        try {
            const res = await fetch("${createLink(controller: 'stint', action: 'loadStints')}?meetingKey=" + meetingKey);
            if (!res.ok) throw new Error("No se pudo obtener los stints");
            const stints = await res.json();
            renderStintChart(stints);
        } catch (e) {
            console.error("Error al cargar los stints:", e);
        }
    }

    function renderStintChart(stints) {
        const container = document.getElementById("chart-container");
        container.innerHTML = "";

        const grouped = {};
        stints
            .filter(s => s && s.driver_number && s.compound && s.lap_start != null && s.lap_end != null)
            .forEach(s => {
                if (!grouped[s.driver_number]) grouped[s.driver_number] = [];
                grouped[s.driver_number].push(s);
            });

        Object.keys(grouped).forEach(driver => {
            const label = document.createElement("div");
            label.className = "driver-label";
            label.textContent = driverMap[driver] || "Piloto " + driver;
            container.appendChild(label);

            const bar = document.createElement("div");
            bar.className = "stint-bar";

            grouped[driver]
                .sort((a, b) => a.lap_start - b.lap_start)
                .forEach(stint => {
                    const seg = document.createElement("div");
                    const length = stint.lap_end - stint.lap_start + 1;
                    seg.className = "stint-segment";
                    seg.style.flex = length;
                    seg.style.backgroundColor = getColor(stint.compound);
                    bar.appendChild(seg);
                });

            container.appendChild(bar);
        });
    }

    function getColor(compound) {
        switch (compound.toUpperCase()) {
            case "SOFT": return "red";
            case "MEDIUM": return "yellow";
            case "HARD": return "white";
            default: return "gray";
        }
    }

    loadStints();
</script>

</body>
</html>
