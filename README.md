# Actionmap

<div style="text-align: center;">

Actionmap is an app that allows users to learn more about their representatives,
political events in their area as well as aggregate, share and view news items in their locality.

</div>

<!DOCTYPE html>
<html>
<head>
    <title>Frontend Features</title>
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; }
        h1 { font-size: 24px; }
        h2 { font-size: 20px; margin-top: 20px; }
        p { margin-top: 10px; }
        .bold { font-weight: bold; }
    </style>
</head>
<body>
    <h1>Frontend Features</h1>

    <h2>Interactive Maps</h2>
    <p>The application leverages D3.js and TopoJSON to render interactive maps that provide geographic visualizations at the national, state, and county levels. Users can interact with these maps to view detailed information about different regions.</p>
    <ul>
        <li><span class="bold">National Map View:</span> Displays all states with capabilities to interact and navigate to state-specific views.</li>
        <li><span class="bold">State Map View:</span> Upon selecting a state, the map zooms to that state's boundaries and shows its counties.</li>
        <li><span class="bold">County Interaction:</span> Users can hover over or click on counties to fetch detailed data or navigate to related content.</li>
    </ul>

    <h2>Dynamic Event Handlers</h2>
    <p>Interactive elements on the maps respond to user inputs:</p>
    <ul>
        <li>Hover effects provide additional information about the hovered region.</li>
        <li>Click actions redirect the user to detailed pages or trigger further actions based on the region selected.</li>
    </ul>

    <h2>AJAX-based Dynamic Filtering</h2>
    <p>The application uses AJAX to dynamically update the selection options based on user input:</p>
    <ul>
        <li>Filters for viewing events or news by state or county, updating available options as the user makes selections.</li>
        <li>The interface adjusts in real-time, providing a responsive user experience for data filtering.</li>
    </ul>

    <h2>Styling and Responsiveness</h2>
    <p>The application uses SASS for styling, ensuring that the map and other UI components are responsive and visually appealing across different devices.</p>
</body>
</html>


<!-- TODO: Update these for your repo! -->
![](https://github.com///actions/workflows//badge.svg)

[![All Specs](https://github.com/saasbook/hw-agile-iterations/actions/workflows/specs.yml/badge.svg)](https://github.com/saasbook/hw-agile-iterations/actions/workflows/specs.yml)

[![codecov](https://codecov.io/gh/saasbook/hw-agile-iterations/branch/master/graph/badge.svg?token=SGYCvQX4Us)](https://codecov.io/gh/saasbook/hw-agile-iterations)

[![Bluejay Dashboard](https://img.shields.io/badge/Bluejay-Dashboard_16-blue.svg)](http://dashboard.bluejay.governify.io/dashboard/script/dashboardLoader.js?dashboardURL=https://reporter.bluejay.governify.io/api/v4/dashboards/tpa-CS169-2023-GH-cs169_fa23-chips-10.5-16/main)

### Getting Setup Locally

Follow the [Getting Started Guide](./docs/01-getting-started.md) to get your localhost environment setup.
