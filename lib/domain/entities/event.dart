// Shady Boukhary


import 'package:living_with_guru/domain/util/constants.dart';

/// An HHH event. The event could either be a regular event of a race, in which case
/// it has more functionality.
class Event {
  /// The official name of the event.
  final String name;

  /// The description of the event. This can be multi-line and include information
  /// such as start and end dates - as well as price for entry.
  final String description;

  /// The location at which the event will be held. This also includes the start time.
  final String location;

  /// The unique ID of the event.
  final String id;

  /// The link to the image of the event.
  final String imageUrl;

  // The fee for attendin the event.
  final int fee; 

  // The type of this event.
  final EventType eventType;

  // Default
  Event(this.name, this.description, this.location, this.id,
          this.imageUrl, this.eventType, this.fee);

  /// From an [Event]
  Event.fromEvent(Event event)
      : name = event.name,
        description = event.description,
        location = event.location,
        id = event.id,
        imageUrl = event.imageUrl,
        eventType = event.eventType,
        fee = event.fee;

  /// From a [map]
  Event.fromJson(Map<String, dynamic> map)
      : name = map['name'],
        description = map['description'],
        location = map['location'],
        id = map['id'],
        imageUrl = map['imageUrl'],
        eventType = map['eventType'],
        fee = map['fee'];

  /// Convert [this] to a Json `Map<String, dynamic>`. Complex structures keep their initial
  /// types.
  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'location': location,
        'id': id,
        'imageUrl': imageUrl,
        'eventType': eventType.toString(),
        'fee' : fee,
      };

  /// Convert [this] to a Json `Map<String, String>`. All complex structures
  /// are also converted to `String`.
  Map<String, String> toJson2() => {
        'name': name,
        'description': description,
        'location': location,
        'id': id,
        'imageUrl': imageUrl,
        'eventType': eventType.toString(),
        'fee' : fee.toString(),
      };
}
