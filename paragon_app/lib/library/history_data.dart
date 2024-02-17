
class HistoryEvent {
  final String eventName;
  final String author;
  final DateTime dataEvent;
  final double price;
  
  // Dodaj konstruktor, który odbierze tylko datę bez godziny
  HistoryEvent({
    required this.eventName,
    required this.price,
    required this.author,
    required DateTime dataEvent,
  }) : dataEvent = DateTime(dataEvent.year, dataEvent.month, dataEvent.day);
}

class HistoryData {
  static final List<HistoryEvent> historia = [
    HistoryEvent(
      eventName: 'Wspólne jedzenie',
      price: 25.00,
      author: "Tomek Kowalski",
      dataEvent: DateTime.now(),
    ),
    HistoryEvent(
      eventName: 'Kino',
      price: 14.30,
      author: "Tomek Kowalski",
      dataEvent: DateTime.now(),
    ),
    HistoryEvent(
      eventName: 'Pizza',
      price: 50.00,
      author: "Tomek Kowalski",
      dataEvent: DateTime.now(),
    ),
    HistoryEvent(
      eventName: 'Za tamtą noc',
      price: 7.48,
      author: "Tomek Kowalski",
      dataEvent: DateTime.now(),
    ),
    HistoryEvent(
      eventName: 'Gierka',
      price: 73.39,
      author: "Tomek Kowalski",
      dataEvent: DateTime.now(),
    ),
    HistoryEvent(
      eventName: 'Kino',
      price: 15.50,
      author: "Tomek Kowalski",
      dataEvent: DateTime.now(),
    ),
    HistoryEvent(
      eventName: 'zoooo',
      price: 17.00,
      author: "Tomek Kowalski",
      dataEvent: DateTime.now(),
    ),
    HistoryEvent(
      eventName: 'Korki z matmy',
      price: 90.00,
      author: "Tomek Kowalski",
      dataEvent: DateTime.now(),
    ),
    HistoryEvent(
      eventName: 'Lody',
      price: 9.00,
      author: "Tomek Kowalski",
      dataEvent: DateTime.now(),
    ),
    HistoryEvent(
      eventName: 'Na składke - Piotrek',
      price: 30.00,
      author: "Tomek Kowalski",
      dataEvent: DateTime.now(),
    ),
    HistoryEvent(
      eventName: 'Pizza',
      price: 23.30,
      author: "Tomek Kowalski",
      dataEvent: DateTime.now(),
    ),
    HistoryEvent(
      eventName: 'Jedzonko',
      price: 20.21,
      author: "Tomek Kowalski",
      dataEvent: DateTime.now(),
    ),
    HistoryEvent(
      eventName: 'Jedzonko',
      price: 20.21,
      author: "Tomek Kowalski",
      dataEvent: DateTime.now(),
    ),
    HistoryEvent(
      eventName: 'Jedzonko',
      price: 20.21,
      author: "Tomek Kowalski",
      dataEvent: DateTime.now(),
    ),
    HistoryEvent(
      eventName: 'Jedzonko',
      price: 20.21,
      author: "Tomek Kowalski",
      dataEvent: DateTime.now(),
    ),
    HistoryEvent(
      eventName: 'testtttttttttt',
      price: 20.21,
      author: "Tomek Kowalski",
      dataEvent: DateTime.now(),
    ),
    
  ];
}