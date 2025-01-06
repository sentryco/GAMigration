import Foundation
import SwiftProtobuf
import Base32
/**
 * Extension of `GAOtp` to define the algorithm types used for OTP generation.
 */
extension GAOtp {
   /**
    * Enum representing the algorithm used for generating one-time passwords (OTPs).
    * It supports various hashing algorithms as specified in the OTP standards.
    */
   public enum Algorithm_Type: Int, Codable {
      /**
       * The algorithm type is not specified.
       */
      case unspecified
      /**
       * The SHA-1 hashing algorithm, as defined in RFC 4226.
       */
      case sha1
      /**
       * The SHA-256 hashing algorithm, providing a longer hash value.
       */
      case sha256
      /**
       * The SHA-512 hashing algorithm, providing the longest hash value.
       */
      case sha512
      /**
       * The MD5 hashing algorithm, which is not recommended due to security vulnerabilities.
       */
      case md5
   }
}
