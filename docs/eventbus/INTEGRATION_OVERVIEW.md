# Event Bus Integration Overview

The EventBus is now connected to:
- SDK (Python + JS)
- Telemetry (Python + JS)
- Orchestrator (Python + JS)
- Future ZK-Light Trigger Engine
- Future BHBR/BHT Web3 handshake

## Example (Python)
```python
from eventbus.python.event_bus import EventBus
from telemetry.python.telemetry import Telemetry

bus = EventBus()
telemetry = Telemetry()

bus.register("sdk_call", lambda data: telemetry.log("sdk_call", data))
bus.emit("sdk_call", {"method": "hash", "input": "hello"})
Example (JS)import { EventBus } from "./eventbus/js/eventBus.js";
import { Telemetry } from "./telemetry/js/telemetry.js";

const bus = new EventBus();
const telemetry = new Telemetry();

bus.register("sync", (data) => telemetry.log("sync", data));
bus.emit("sync", { status: "client_ready" });EODOC

echo “✔ Integration docs added”

###############################################

5. Connect EventBus to SDK clients

###############################################

Python SDK

cat > src/sdk/python/hooks.py << ‘EOPY’
from eventbus.python.event_bus import EventBus
from telemetry.python.telemetry import Telemetry

bus = EventBus()
telemetry = Telemetry()

def emit_sdk_event(name, metadata=None):
bus.emit(name, metadata)
telemetry.log(name, metadata)
EOPY

JS SDK

cat > src/sdk/js/hooks.js << ‘EOJS’
import { EventBus } from “../../eventbus/js/eventBus.js”;
import { Telemetry } from “../../telemetry/js/telemetry.js”;

export const bus = new EventBus();
export const telemetry = new Telemetry();

export function emitSdkEvent(name, metadata = {}) {
bus.emit(name, metadata);
telemetry.log(name, metadata);
}
EOJS

echo “✔ EventBus <-> SDK connection established”

###############################################

6. Git commit + push

###############################################
git add src/eventbus docs/eventbus src/sdk
git commit -m “SCRIPT 35 — Event Bus Layer + Cross-Module Integration”
git push

echo “🎯 SCRIPT 35 COMPLETE — EVENT BUS ONLINE”
