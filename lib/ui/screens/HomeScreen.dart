import 'package:datfuel/utils/size_calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../utils/colors.dart';
import '../components/custom_button.dart';
import '../components/location_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleMapController? _controller;
  LocationData? _currentLocation;

  @override
  void initState() {
    super.initState();
    print(">>>>>>>>>>hi");

    _getCurrentLocation();
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  Future<void> _getCurrentLocation() async {
    final location = Location();
    try {
      final currentLocation = await location.getLocation();
      print(">>>>>>>>>>hi2");
      setState(() {
        _currentLocation = currentLocation;
      });
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  void _orderFuel(BuildContext context) {
    locationBottomSheet(context);
  }

  @override
  Widget build(BuildContext context) {
    final initialCameraPosition = _currentLocation != null
        ? CameraPosition(
            target: LatLng(
                _currentLocation!.latitude!, _currentLocation!.longitude!),
            zoom: 15,
          )
        : CameraPosition(
            target: LatLng(0, 0),
            zoom: 11,
          );

    return Scaffold(

      body: Stack(children: [
        GoogleMap(
          initialCameraPosition: initialCameraPosition,
          onMapCreated: _onMapCreated,
          markers: _currentLocation != null
              ? <Marker>[
                  Marker(
                    markerId: MarkerId('currentLocation'),
                    position: LatLng(_currentLocation!.latitude!,
                        _currentLocation!.longitude!),
                    infoWindow: InfoWindow(title: 'Your Location'),
                  )
                ].toSet()
              : Set<Marker>(),
        ),
        Positioned(
          left: AppConstants.screenWidth(context) * 0.4,
          bottom: AppConstants.screenHeight(context) * 0.15,
          child: GestureDetector(
            onTap: () {
              // locationBottomSheet(context);
              _orderFuel(context);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: AppColors.datBlue, width: 4)),
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  SvgPicture.asset("assets/fuelpump.fill.svg"),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Order Fuel",
                    style: GoogleFonts.roboto(
                        fontSize: 15, color: AppColors.white),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
