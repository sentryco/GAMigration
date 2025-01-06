import Foundation
import SwiftProtobuf
/**
 * Extension of `MigrationPayload` to include OTP (One-Time Password) parameters.
 */
extension MigrationPayload {
   /**
    * A structure representing the parameters required for generating a one-time password (OTP).
    */
   struct OtpParameters {
      /**
       * The secret key used in the OTP generation algorithm.
       * - Note: SwiftProtobuf.Message conformance is added in an extension below. See the `Message` and `Message+*Additions` files in the SwiftProtobuf library for methods supported on all messages.
       */
      var secret: Data = Data()
      /**
       * The name associated with the OTP entry, typically used to identify the account or service.
       */
      var name: String = String()
      /**
       * The issuer of the OTP, often representing the service or organization.
       */
      var issuer: String = String()
      /**
       * The algorithm used for generating the OTP, as defined in `MigrationPayload.Algorithm`.
       */
      var algorithm: MigrationPayload.Algorithm = .algoInvalid
      /**
       * The number of digits for the OTP, determining its length.
       */
      var digits: Int32 = 0
      /**
       * The type of OTP being used, such as time-based or counter-based, as defined in `MigrationPayload.OtpType`.
       */
      var type: MigrationPayload.OtpType = .otpInvalid
      /**
       * The counter value used for generating the OTP, applicable for counter-based OTPs.
       */
      var counter: Int64 = 0
      /**
       * Storage for unknown fields encountered during decoding, to preserve them for re-encoding.
       */
      var unknownFields = SwiftProtobuf.UnknownStorage()
   }
}

/*
 Conforms MigrationPayload.OtpParameters to Sendable without compiler-enforced checks.
 OtpParameters should be designed to be safely shareable across concurrency domains.
 - Fixme: ⚠️️ the below might not be needed
*/
extension MigrationPayload.OtpParameters: @unchecked Sendable {}
