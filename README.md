# Actionmap

<div style="text-align: center;">

Actionmap is an app that allows users to learn more about their representatives,
political events in their area as well as aggregate, share and view news items in their locality.

</div>

<!-- TODO: Update these for your repo! -->
![](https://github.com///actions/workflows//badge.svg)

[![All Specs](https://github.com/saasbook/hw-agile-iterations/actions/workflows/specs.yml/badge.svg)](https://github.com/saasbook/hw-agile-iterations/actions/workflows/specs.yml)

[![codecov](https://codecov.io/gh/saasbook/hw-agile-iterations/branch/master/graph/badge.svg?token=SGYCvQX4Us)](https://codecov.io/gh/saasbook/hw-agile-iterations)

[![Bluejay Dashboard](https://img.shields.io/badge/Bluejay-Dashboard_16-blue.svg)](http://dashboard.bluejay.governify.io/dashboard/script/dashboardLoader.js?dashboardURL=https://reporter.bluejay.governify.io/api/v4/dashboards/tpa-CS169-2023-GH-cs169_fa23-chips-10.5-16/main)

Frontend Features
Interactive Maps
The application leverages D3.js and TopoJSON to render interactive maps that provide geographic visualizations at the national, state, and county levels. Users can interact with these maps to view detailed information about different regions.

National Map View: Displays all states with capabilities to interact and navigate to state-specific views.
State Map View: Upon selecting a state, the map zooms to that state's boundaries and shows its counties.
County Interaction: Users can hover over or click on counties to fetch detailed data or navigate to related content.
Dynamic Event Handlers
Interactive elements on the maps respond to user inputs:

Hover effects provide additional information about the hovered region.
Click actions redirect the user to detailed pages or trigger further actions based on the region selected.
AJAX-based Dynamic Filtering
The application uses AJAX to dynamically update the selection options based on user input:

Filters for viewing events or news by state or county, updating available options as the user makes selections.
The interface adjusts in real-time, providing a responsive user experience for data filtering.
Styling and Responsiveness
The application uses SASS for styling, ensuring that the map and other UI components are responsive and visually appealing across different devices.

### Getting Setup Locally

Follow the [Getting Started Guide](./docs/01-getting-started.md) to get your localhost environment setup.
