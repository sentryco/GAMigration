import Foundation
import SwiftProtobuf
import Base32
/**
 * - Fixme: ⚠️️ add doc
 */
public struct GAOtp: Hashable, Codable {
   /**
    * - Fixme: ⚠️️ add doc
    * Specifies the OTP type; valid values are hotp for counter-based and totp for time-based one-time passwords.
    */
    public let type: OTP_Type
   /**
    * - Fixme: ⚠️️ add doc
    * Specifies the algorithm used for OTP generation. The default is SHA1, but other supported values include SHA256 and SHA512.
    */
    public let algorithm: Algorithm_Type
   /**
    * - Fixme: ⚠️️ add doc
    */
    public let name: String
   /**
    * - Fixme: ⚠️️ add doc
    * The shared secret key, encoded in Base32 according to RFC 3548. Padding is not required and should be omitted.
    */
    public let secret: String
   /**
    * - Fixme: ⚠️️ add doc
    * A string value indicating the provider or service this account is associated with, URL-encoded according to RFC 3986. If both the issuer parameter and issuer label prefix are present, they should be equal.
    */
    public let issuer: String
   /**
    * - Fixme: ⚠️️ add doc
    * Required if the OTP type is hotp. It defines the initial counter value.
    */
    public let counter: Int64
   /**
    * - Fixme: ⚠️️ add doc
    * Determines the number of digits in the OTP. The default value is 6, but it can also be set to 8.
    */
    public let digitsRawValue: Int
}
 