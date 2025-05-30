import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.location_on_sharp, color: Colors.white),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your Location", style: TextStyle(fontSize: 8)),
                    Text(
                      "Wz-555 Naraina Village New Delhi 110028",
                      style: TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Icon(Icons.arrow_right_rounded, size: 35),
            ],
          ),
        ),
      ],
    );
  }
}
