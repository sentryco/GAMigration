import Foundation
import SwiftProtobuf
import Base32
/**
 * A structure representing a Google Authenticator One-Time Password (OTP) configuration.
 *
 * This structure encapsulates all the parameters required to define an OTP account, including
 * the type of OTP (HOTP or TOTP), algorithm used, account name, secret key, issuer, counter, and number of digits.
 */
public struct GAOtp: Hashable, Codable {
   /**
    * Specifies the OTP type; valid values are hotp for counter-based and totp for time-based one-time passwords.
    */
    public let type: OTP_Type
   /**
    * Specifies the algorithm used for OTP generation. The default is SHA1, but other supported values include SHA256 and SHA512.
    */
    public let algorithm: Algorithm_Type
   /**
    * The account name associated with the OTP. This is typically the user's email address or username.
    */
    public let name: String
   /**
    * The shared secret key, encoded in Base32 according to RFC 3548. Padding is not required and should be omitted.
    */
    public let secret: String
   /**
    * A string value indicating the provider or service this account is associated with, URL-encoded according to RFC 3986. If both the issuer parameter and issuer label prefix are present, they should be equal.
    */
    public let issuer: String
   /**
    * Required if the OTP type is hotp. It defines the initial counter value.
    */
    public let counter: Int64
   /**
    * Determines the number of digits in the OTP. The default value is 6, but it can also be set to 8.
    */
    public let digitsRawValue: Int
}