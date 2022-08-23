import 'package:event_bus/event_bus.dart';
// 创建EventBus
EventBus eventBus = EventBus();

// Event
class TabbatIndexEvent {
  int tabbatIndex;

  TabbatIndexEvent(this.tabbatIndex);
}

