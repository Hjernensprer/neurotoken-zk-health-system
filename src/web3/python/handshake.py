import time
import hashlib

class BitcoinHandshake:
    @staticmethod
    def create_handshake_payload(message="neurotoken-handshake"):
        hashed = hashlib.sha256(message.encode()).hexdigest()
        return {
            "version": "1.0",
            "algorithm": "sha256",
            "payload": hashed,
            "timestamp": time.time()
        }
