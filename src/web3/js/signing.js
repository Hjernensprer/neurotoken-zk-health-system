import crypto from "crypto";

export class DeterministicSigner {
  static sign(message) {
    const hash = crypto.createHash("sha256")
      .update(message)
      .digest("hex");

    return {
      message,
      signature: hash,
      algorithm: "sha256",
      deterministic: true
    };
  }
}
