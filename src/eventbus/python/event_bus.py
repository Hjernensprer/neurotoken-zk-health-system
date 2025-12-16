import time

class EventBus:
    """
    Lightweight, public-safe event bus for:
    - Orchestrator
    - SDK
    - Telemetry
    - Future ZK-light triggers
    - BHBR/BHT Web3 handshake (stub)
    """

    def __init__(self):
        self.handlers = {}
        self.events = []

    def register(self, event_name, handler):
        if event_name not in self.handlers:
            self.handlers[event_name] = []
        self.handlers[event_name].append(handler)
    
    def emit(self, event_name, payload=None):
        entry = {
            "timestamp": time.time(),
            "event": event_name,
            "payload": payload
        }
        self.events.append(entry)

        for handler in self.handlers.get(event_name, []):
            handler(payload)

        return entry

    def list_events(self):
        return self.events
