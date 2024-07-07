import 'package:book_my_seat/book_my_seat.dart';
import 'package:flutter/material.dart';

class BusDetails extends StatefulWidget {
  final String driverName;
  final String drivingLicence;
  final bool isTwoIntoTwo;

  const BusDetails({
    super.key,
    required this.driverName,
    required this.drivingLicence,
    required this.isTwoIntoTwo,
  });

  @override
  State<BusDetails> createState() => _BusDetailsState();
}

class _BusDetailsState extends State<BusDetails> {
  Set<SeatNumber> selectedSeats = {};
  final twoIntoTwo = [
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
  ];

  final oneIntoThree = [
    [
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.driverName),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: SizedBox(
              width: double.infinity,
              height: 500,
              child: SeatLayoutWidget(
                onSeatStateChanged: (rowI, colI, seatState) {
                  if (seatState == SeatState.selected) {
                    selectedSeats.add(SeatNumber(rowI: rowI, colI: colI));
                  } else {
                    selectedSeats.remove(SeatNumber(rowI: rowI, colI: colI));
                  }
                },
                stateModel:  SeatLayoutStateModel(
                  rows: 10,
                  cols: 5,
                  seatSvgSize: 45,
                  pathSelectedSeat: 'assets/images/seat_selected.svg',
                  pathDisabledSeat: 'assets/images/seat.svg',
                  pathSoldSeat: 'assets/images/seat.svg',
                  pathUnSelectedSeat: 'assets/images/seat.svg',
                  currentSeatsState: widget.isTwoIntoTwo ? twoIntoTwo : oneIntoThree,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SeatNumber {
  final int rowI;
  final int colI;

  const SeatNumber({required this.rowI, required this.colI});

  @override
  bool operator ==(Object other) {
    return rowI == (other as SeatNumber).rowI && colI == other.colI;
  }

  @override
  int get hashCode => rowI.hashCode;

  @override
  String toString() {
    return '[$rowI][$colI]';
  }
}
