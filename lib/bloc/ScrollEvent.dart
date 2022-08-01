abstract class ScrollEvent{}

class UpdateScrollEvent extends ScrollEvent{
  UpdateScrollEvent();
}
class FastLoadScrollEvent extends ScrollEvent{}

class ModifierScrollEvent extends ScrollEvent{
  final bool modifier;

  ModifierScrollEvent(this.modifier);
}