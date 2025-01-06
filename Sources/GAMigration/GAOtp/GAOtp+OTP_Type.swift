import Foundation
import SwiftProtobuf
import Base32
/**
 * Extension of `GAOtp` to define the OTP (One-Time Password) types.
 */
extension GAOtp {
   /**
    * Enum representing the type of OTP (One-Time Password) being used.
    * - `unspecified`: The OTP type is not specified.
    * - `hotp`: HMAC-based One-Time Password algorithm as defined in RFC 4226.
    * - `totp`: Time-based One-Time Password algorithm as defined in RFC 6238.
    */
   public enum OTP_Type: Int, Codable {
      case unspecified //= 0
      case hotp //= 1
      case totp //= 2
   }
}
