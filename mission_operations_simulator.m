%% Satellite Mission Operations Simulator
% Version 0.1
% Simulates spacecraft communication opportunities with multiple
% ground stations.

clear;
clc;

%% Spacecraft State

spacecraftAltitude = 500;   % km above Earth
minimumElevation = 10;      % degrees


%% Ground Station Network

stationNames = ["San Diego", "Colorado Springs", "Houston"];

stationLatitudes = [32.7157, 38.8339, 29.7604];
stationLongitudes = [-117.1611, -104.8214, -95.3698];

%% Spacecraft Position

spacecraftLatitude = 35.0;
spacecraftLongitude = -110.0;

%% Distance to Ground Stations

earthRadius = 6371;   % km

distances = zeros(1, length(stationNames));

for i = 1:length(stationNames)

    lat1 = deg2rad(spacecraftLatitude);
    lon1 = deg2rad(spacecraftLongitude);

    lat2 = deg2rad(stationLatitudes(i));
    lon2 = deg2rad(stationLongitudes(i));

    deltaLat = lat2 - lat1;
    deltaLon = lon2 - lon1;

    a = sin(deltaLat/2)^2 + ...
        cos(lat1) * cos(lat2) * sin(deltaLon/2)^2;

    centralAngle = 2 * atan2(sqrt(a), sqrt(1-a));

    distances(i) = earthRadius * centralAngle;

end