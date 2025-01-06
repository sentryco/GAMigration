import Foundation
import SwiftProtobuf
import Base32

/**
 * Extension to initialize `GAOtp` with raw integer values for type and algorithm.
 */
extension GAOtp {
   /**
    * Initializes a `GAOtp` instance with the provided parameters.
    * - Parameters:
    *   - typeRawInt: The raw integer value representing the OTP type.
    *   - algorithmRawInt: The raw integer value representing the hashing algorithm used for OTP generation.
    *   - name: A string representing the name or label of the OTP account.
    *   - secret: The shared secret key as `Data`, which will be base32 encoded.
    *   - issuer: A string representing the provider or service this OTP account is associated with.
    *   - counter: The initial counter value required for HOTP type OTPs.
    *   - digitsRawValue: The number of digits for the OTP, typically 6 or 8.
    */
   public init(typeRawInt: Int, algorithmRawInt: Int, name: String, secret: Data, issuer: String, counter: Int64, digitsRawValue: Int) {
      self.type = OTP_Type(rawValue: typeRawInt) ?? .unspecified
      self.algorithm = Algorithm_Type(rawValue: algorithmRawInt) ?? .unspecified
      self.name = name
      self.secret = base32Encode(secret)
      self.issuer = issuer
      self.counter = counter
      self.digitsRawValue = digitsRawValue
   }
}
