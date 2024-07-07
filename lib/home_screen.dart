import 'package:flutter/material.dart';
import 'package:noviindus_task3/bus_details.dart';
import 'package:noviindus_task3/driver_list_screen.dart';
import 'package:noviindus_task3/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus List'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DriversListScreen()));
              },
              icon: const Icon(Icons.person_outline))
        ],
      ),
      body: homeProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : homeProvider.busList == null
              ? const Center(child: Text('Failed to load bus list'))
              : ListView.builder(
                  itemCount: homeProvider.busList?.length ?? 0,
                  itemBuilder: (context, index) {
                    final bus = homeProvider.busList?[index];
                    return ListTile(
                      title: Text(bus!.name ?? 'No Name'),
                      subtitle: Text(bus!.type ?? 'No Type'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BusDetails(
                                      driverName: bus.driverName ?? '',
                                      drivingLicence: bus.driverLicenseNo ?? '',
                                      isTwoIntoTwo: false,
                                    )));
                      },
                    );
                  },
                ),
    );
  }
}
