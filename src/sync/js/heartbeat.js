import { EventBus } from "../../eventbus/js/eventBus.js";
import { Telemetry } from "../../telemetry/js/telemetry.js";

export class Heartbeat {
  constructor(interval = 5000) {
    this.interval = interval;
    this.bus = new EventBus();
    this.telemetry = new Telemetry();
    this.timer = null;
  }

  start() {
    this.timer = setInterval(() => {
      const pulse = {
        timestamp: Date.now(),
        pulse: "alive"
      };
      this.bus.emit("heartbeat", pulse);
      this.telemetry.log("heartbeat", pulse);
    }, this.interval);
  }

  stop() {
    clearInterval(this.timer);
  }
}
