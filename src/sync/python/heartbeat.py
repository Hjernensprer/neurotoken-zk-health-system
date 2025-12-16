import time
import threading
from eventbus.python.event_bus import EventBus
from telemetry.python.telemetry import Telemetry

class Heartbeat:
    def __init__(self, interval=5):
        self.interval = interval
        self.running = False
        self.bus = EventBus()
        self.telemetry = Telemetry()

    def start(self):
        self.running = True
        threading.Thread(target=self._loop, daemon=True).start()

    def _loop(self):
        while self.running:
            payload = {"timestamp": time.time(), "pulse": "alive"}
            self.bus.emit("heartbeat", payload)
            self.telemetry.log("heartbeat", payload)
            time.sleep(self.interval)

    def stop(self):
        self.running = False
