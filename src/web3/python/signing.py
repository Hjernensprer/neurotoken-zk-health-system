import hashlib

class DeterministicSigner:
    @staticmethod
    def sign(message: str):
        hashed = hashlib.sha256(message.encode()).hexdigest()
        return {
            "message": message,
            "signature": hashed,
            "algorithm": "sha256",
            "deterministic": True
        }
