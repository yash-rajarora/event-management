import 'package:flutter/material.dart';


class EventGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Event> events = [
      Event(
        name: 'Event A',
        date: 'September 15, 2023',
        image: 'assets/images/event.jpg',
      ),
      Event(
        name: 'Event B',
        date: 'October 10, 2023',
        image: 'assets/images/event.jpg',
      ),
      Event(
        name: 'Event A',
        date: 'September 15, 2023',
        image: 'assets/images/event.jpg',
      ),
      Event(
        name: 'Event B',
        date: 'October 10, 2023',
        image: 'assets/images/event.jpg',
      ),
      Event(
        name: 'Event A',
        date: 'September 15, 2023',
        image: 'assets/images/event.jpg',
      ),
      Event(
        name: 'Event B',
        date: 'October 10, 2023',
        image: 'assets/images/event.jpg',
      ),

    ];

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.75, // Adjust this value for aspect ratio
      ),
      itemCount: events.length,
      itemBuilder: (context, index) {
        return EventCard(event: events[index]);
      },
    );
  }
}

class Event {
  final String name;
  final String date;
  final String image;

  Event({
    required this.name,
    required this.date,
    required this.image,
  });
}

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              event.image,
              height: 360,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text('Date: ${event.date}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}