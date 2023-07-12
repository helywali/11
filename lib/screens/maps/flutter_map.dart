import 'package:cleopatra/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapController _mapController = MapController();
  LocationData? _currentLocation;
  int _selectedMarkerIndex = 0;
  List<LatLng> _markerLocations = [
    LatLng(31.212330, 29.883490),
    LatLng(36.742520, 3.098200),
    LatLng(31.2407678, 29.9630699),
  ];
  List<Color> _polylineColors = [Colors.blue, Colors.green, Colors.red];
  @override
  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  void _getLocation() async {
    Location location = Location();

    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    PermissionStatus permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        return;
      }
    }

    _currentLocation = await location.getLocation();
    _mapController.move(
        LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
        13.0);
    setState(() {});
  }

  void _onMarkerSelected(int index) {
    setState(() {
      _selectedMarkerIndex = index;
    });
  }

  List<LatLng> _getPoints() {
    List<LatLng> points = [_getCurrentLocation()];
    points.add(_markerLocations[_selectedMarkerIndex]);
    return points;
  }

  LatLng _getCurrentLocation() {
    if (_currentLocation != null) {
      return LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!);
    } else {
      return LatLng(0.0, 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    var markers = <Marker>[
      if (_currentLocation != null)
        Marker(
          width: 80.0,
          height: 80.0,
          point: _getCurrentLocation(),
          builder: (ctx) => Container(
            child: const Icon(
              Icons.location_on,
              color: Colors.red,
            ),
          ),
        ),
      for (int i = 0; i < _markerLocations.length; i++)
        Marker(
          width: 80.0,
          height: 80.0,
          point: _markerLocations[i],
          builder: (ctx) => Container(
            child: GestureDetector(
              onTap: () => _onMarkerSelected(i),
              child: const Icon(
                Icons.location_on,
                color: Colors.blue,
              ),
            ),
          ),
        ),
    ];

    var points = _getPoints();

    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                center: _getCurrentLocation(),
                zoom: 13.0,
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate:
                      "https://api.mapbox.com/styles/v1/helywaly/cljxmrpix003601o8aj9qacxh/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaGVseXdhbHkiLCJhIjoiY2xqeGxmc2pvMDA0azNwcHhtZWgwZXlyciJ9.EQSNaH4Ro9gahBIAWErEKA",
                  additionalOptions: {
                    'accessToken':
                        'pk.eyJ1IjoiaGVseXdhbHkiLCJhIjoiY2xqeGxmc2pvMDA0azNwcHhtZWgwZXlyciJ9.EQSNaH4Ro9gahBIAWErEKA',
                    'id': 'mapbox.satellite',
                  },
                  attributionBuilder: (_) {
                    return Text('© OpenStreetMap contributors');
                  },
                ),
                MarkerLayerOptions(markers: markers),
                PolylineLayerOptions(
                  polylines: [
                    Polyline(
                      points: points,
                      strokeWidth: 3.0,
                      color: _polylineColors[_selectedMarkerIndex],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 10),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 236, 118, 114), //<-- SEE HERE
              borderRadius: BorderRadius.circular(20),
            ),
            child: DropdownButton(
              iconEnabledColor: Colors.black,
              
              value: _selectedMarkerIndex,
              onChanged: (value) => _onMarkerSelected(value as int),
              items: [
                for (int i = 0; i < _markerLocations.length; i++)
                  DropdownMenuItem(
                    value: i,
                    child: Text(
                      'Place ${i + 1}',
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
