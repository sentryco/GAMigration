import Foundation
import SwiftProtobuf
/**
 * Extension of `MigrationPayload` to define the OTP (One-Time Password) types used in migration.
 */
extension MigrationPayload {
   /**
    * Enum representing the type of OTP (One-Time Password) used in the migration process.
    */
   enum OtpType: SwiftProtobuf.Enum {
      /**
       * Represents an invalid OTP type.
       */
      case otpInvalid
      /**
       * Represents a HOTP type (HMAC-based One-Time Password).
       */
      case otpHotp
      /**
       * Represents a TOTP type (Time-based One-Time Password).
       */
      case otpTotp
      /**
       * Unrecognized OTP type with associated raw value.
       */
      case UNRECOGNIZED(Int)
   }
}
/**
 * Provides initialization and raw value representation for `MigrationPayload.OtpType`.
 */
extension MigrationPayload.OtpType {
   /**
    * Represents the raw value type for the OTP type cases.
    */
   typealias RawValue = Int
   /**
    * Initializes the OTP type as invalid by default.
    */
   init() {
      self = .otpInvalid
   }
   /**
    * Initializes the OTP type with a raw value, falling back to `UNRECOGNIZED` for undefined values.
    * - Parameter rawValue: The raw integer value to initialize the OTP type case.
    */
   init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .otpInvalid
      case 1: self = .otpHotp
      case 2: self = .otpTotp
      default: self = .UNRECOGNIZED(rawValue)
      }
   }
   /**
    * The raw integer value associated with the OTP type case.
    */
   var rawValue: Int {
      switch self {
      case .otpInvalid: return 0
      case .otpHotp: return 1
      case .otpTotp: return 2
      case .UNRECOGNIZED(let i): return i
      }
   }
}
/**
 * Provides a collection of all cases of `MigrationPayload.OtpType`, excluding `UNRECOGNIZED`.
 */
extension MigrationPayload.OtpType: CaseIterable {
   /**
    * All valid cases of `MigrationPayload.OtpType`.
    * - Note: The compiler won't synthesize support with the UNRECOGNIZED case.
    */
   static var allCases: [MigrationPayload.OtpType] = [
      .otpInvalid,
      .otpHotp,
      .otpTotp,
   ]
}
/**
 * Provides protobuf name mappings for `MigrationPayload.OtpType`.
 */
extension MigrationPayload.OtpType: SwiftProtobuf._ProtoNameProviding {
   /**
    * The protobuf name map for the OTP type cases.
    */
   static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
      0: .same(proto: "OTP_INVALID"),
      1: .same(proto: "OTP_HOTP"),
      2: .same(proto: "OTP_TOTP"),
   ]
}
/*
 Conforms MigrationPayload.OtpType to Sendable without compiler-enforced checks.
 OtpType should be an enum or a similarly thread-safe type for this to be safe.
 - Fixme: ⚠️️ the below might not be needed
*/
extension MigrationPayload.OtpType: @unchecked Sendable {}
