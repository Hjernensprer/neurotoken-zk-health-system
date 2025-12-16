export class EventBus {
  constructor() {
    this.handlers = {};
    this.events = [];
  }

  register(eventName, handler) {
    if (!this.handlers[eventName]) this.handlers[eventName] = [];
    this.handlers[eventName].push(handler);
  }

  emit(eventName, payload = null) {
    const entry = {
      timestamp: Date.now(),
      event: eventName,
      payload
    };
    this.events.push(entry);

    (this.handlers[eventName] || []).forEach(fn => fn(payload));
    return entry;
  }

  listEvents() {
    return this.events;
  }
}
