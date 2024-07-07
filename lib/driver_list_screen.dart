import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_driver_screen.dart';
import 'driver_provider.dart';

class DriversListScreen extends StatefulWidget {
  const DriversListScreen({super.key});

  @override
  State<DriversListScreen> createState() => _DriversListScreenState();
}

class _DriversListScreenState extends State<DriversListScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DriversProvider>(context, listen: false).fetchDrivers();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Drivers List'),
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>  const DriverFormScreen()));
        }, icon: const Icon(Icons.add))],
      ),
      body: Consumer<DriversProvider>(
        builder: (context, driversProvider, child) {
          if (driversProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (driversProvider.errorMessage != null) {
            return Center(
                child: Text('Error: ${driversProvider.errorMessage}'));
          } else if (driversProvider.drivers == null ||
              driversProvider.drivers!.isEmpty) {
            return const Center(child: Text('No drivers found'));
          } else {
            return ListView.builder(
              itemCount: driversProvider.drivers!.length,
              itemBuilder: (context, index) {
                final driver = driversProvider.drivers![index];
                return ListTile(
                  title: Text(driver.name ?? 'Unknown'),
                  subtitle: Text('Mobile: ${driver.mobile ?? 'Unknown'}'),
                  trailing: IconButton(
                      onPressed: () async {
                        await driversProvider.deleteDriver(context: _scaffoldKey.currentContext, id: driver.id.toString());                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                );
              },
            );
          }
        },
      ),
    );
  }
}
