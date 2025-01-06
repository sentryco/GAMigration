import Foundation
import SwiftProtobuf
/**
 * Extension of `MigrationPayload` to define the algorithm types used for OTP generation.
 */
extension MigrationPayload {
   /**
    * Enum representing the algorithm used for generating one-time passwords (OTPs).
    * It supports various hashing algorithms as specified in the OTP standards.
    */
   enum Algorithm: SwiftProtobuf.Enum {
      /** 
       * Invalid algorithm
       * The default case representing an invalid or unspecified algorithm.
       *  - Fixme: ⚠️️ rename to invalid
       */
      case algoInvalid // = 0
      /**
       * SHA-1 algorithm
       * The SHA-1 hashing algorithm, as defined in RFC 4226.
       * - Fixme: ⚠️️  rename to sha1
       */
      case algoSha1 // = 1
      /** 
       * Unrecognized algorithm with associated raw value
       * An algorithm that is not recognized by the system, holding its raw value for potential future use or error handling.
       * - Fixme: ⚠️️ rename to unrecognized
       */
      case UNRECOGNIZED(Int)
   }
}
/**
 * Provides initialization and raw value representation for `MigrationPayload.Algorithm`.
 */
extension MigrationPayload.Algorithm {
   /**
    * Represents the raw value type for the algorithm cases.
    */
   typealias RawValue = Int
   
   /**
    * Initializes the algorithm as invalid by default.
    */
   init() {
      self = .algoInvalid
   }
   
   /**
    * Initializes the algorithm with a raw value, falling back to `UNRECOGNIZED` for undefined values.
    * - Parameter rawValue: The raw integer value to initialize the algorithm case.
    */
   init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .algoInvalid
      case 1: self = .algoSha1
      default: self = .UNRECOGNIZED(rawValue)
      }
   }
   
   /**
    * The raw integer value associated with the algorithm case.
    */
   var rawValue: Int {
      switch self {
      case .algoInvalid: return 0
      case .algoSha1: return 1
      case .UNRECOGNIZED(let i): return i
      }
   }
}

/**
 * Provides a collection of all cases of `MigrationPayload.Algorithm`, excluding `UNRECOGNIZED`.
 */
extension MigrationPayload.Algorithm: CaseIterable {
   /**
    * All valid cases of `MigrationPayload.Algorithm`.
    * - Note: The compiler won't synthesize support with the UNRECOGNIZED case.
    */
   static var allCases: [MigrationPayload.Algorithm] = [
      .algoInvalid,
      .algoSha1,
   ]
}

/**
 * Provides protobuf name mappings for `MigrationPayload.Algorithm`.
 */
extension MigrationPayload.Algorithm: SwiftProtobuf._ProtoNameProviding {
   /**
    * The protobuf name map for the algorithm cases.
    */
   static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
      0: .same(proto: "ALGO_INVALID"),
      1: .same(proto: "ALGO_SHA1"),
   ]
}

/**
 * Conforms MigrationPayload.Algorithm to Sendable without compiler-enforced checks.
 * Ensure that Algorithm is safe to use across different threads.
 * - Fixme: ⚠️️ the below might not be needed
 */
extension MigrationPayload.Algorithm: @unchecked Sendable {}
