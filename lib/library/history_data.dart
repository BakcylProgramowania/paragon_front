
class HistoryEvent {
  final String eventName;
  final double price;
  HistoryEvent({
    required this.eventName,
    required this.price,
  });
}

class HistoryData {
  static final List<HistoryEvent> historia = [
    HistoryEvent(
      eventName: 'Wspólne jedzenie',
      price: 25.00,
    ),
    HistoryEvent(
      eventName: 'Kino',
      price: 14.30,
    ),
    HistoryEvent(
      eventName: 'Pizza',
      price: 50.00,
    ),
    HistoryEvent(
      eventName: 'Za tamtą noc',
      price: 7.48,
    ),
    HistoryEvent(
      eventName: 'Gierka',
      price: 73.39,
    ),
    HistoryEvent(
      eventName: 'Kino',
      price: 15.50,
    ),
    HistoryEvent(
      eventName: 'zoooo',
      price: 17.00,
    ),
    HistoryEvent(
      eventName: 'Korki z matmy',
      price: 90.00,
    ),
    HistoryEvent(
      eventName: 'Lody',
      price: 9.00,
    ),
    HistoryEvent(
      eventName: 'Na składke - Piotrek',
      price: 30.00,
    ),
    HistoryEvent(
      eventName: 'Pizza',
      price: 23.30,
    ),
    HistoryEvent(
      eventName: 'Jedzonko',
      price: 20.21,
    ),
    HistoryEvent(
      eventName: 'Jedzonko',
      price: 20.21,
    ),
    HistoryEvent(
      eventName: 'Jedzonko',
      price: 20.21,
    ),
    HistoryEvent(
      eventName: 'Jedzonko',
      price: 20.21,
    ),
    HistoryEvent(
      eventName: 'testtttttttttt',
      price: 20.21,
    ),
    
  ];
}