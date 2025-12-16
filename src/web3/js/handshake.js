import crypto from "crypto";

export class BitcoinHandshake {
  static createHandshakePayload(message = "neurotoken-handshake") {
    const hash = crypto.createHash("sha256")
      .update(message)
      .digest("hex");

    return {
      version: "1.0",
      algorithm: "sha256",
      payload: hash,
      timestamp: Date.now()
    };
  }
}
