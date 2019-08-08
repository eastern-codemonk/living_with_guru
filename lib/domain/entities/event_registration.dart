
class EventRegistration {

  /// The [User]'s unique ID that registered.
  final String uid;

  /// The [Event] unique ID in which the [User] registered.
  final String eventId;

  /// The Unix timestamp of the registration.
  final String timestamp;

  EventRegistration(this.uid, this.eventId, this.timestamp);

  EventRegistration.fromJson(Map<String, dynamic> map)
      : uid = map['uid'],
        eventId = map['eventId'],
        timestamp = map['timestamp'];

  /// Convert [this] to a Json `Map<String, dynamic>`. Complex structures keep their initial
  /// types.
  Map<String, dynamic> toJson() => {
        'uid': uid,
        'eventId': eventId,
        'timestamp': timestamp,
      };

  /// Convert [this] to a Json `Map<String, String>`. All complex structures
  /// are also converted to `String`.
  Map<String, String> toJson2() => {
        'uid': uid,
        'eventId': eventId,
        'timestamp': timestamp,
      };
}