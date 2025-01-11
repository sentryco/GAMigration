import Foundation
import SwiftProtobuf
/**
 * Represents the payload for a migration operation, containing OTP parameters and metadata.
 * - Note: For information on using the generated types, please see the documentation: https://github.com/apple/swift-protobuf/
 */
struct MigrationPayload {
   /**
    * An array of `OtpParameters` representing the individual OTP entries in the migration payload.
    * - Note: SwiftProtobuf.Message conformance is added in an extension below. See the `Message` and `Message+*Additions` files in the SwiftProtobuf library for methods supported on all messages.
    */
   var otpParameters: [MigrationPayload.OtpParameters] = []
   /**
    * The version of the migration payload format.
    */
   var version: Int32 = 0
   /**
    * The size of the batch in which this payload is a part.
    */
   var batchSize: Int32 = 0
   /**
    * The index of this payload within its batch.
    */
   var batchIndex: Int32 = 0
   /**
    * A unique identifier for the batch this payload belongs to.
    */
   var batchID: Int32 = 0
   /**
    * Storage for unknown fields encountered during decoding, to preserve them for re-encoding.
    */
   var unknownFields = SwiftProtobuf.UnknownStorage()
}
/**
 * The following struct is used to ensure compatibility with the generated code from the `protoc` Swift plug-in.
 * If there is a version mismatch, the compiler will emit an error.
 */
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
   struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
   typealias Version = _2
}
/**
 * Conforms MigrationPayload to Sendable without compiler-enforced checks.
 * This should only be used if MigrationPayload is immutable or properly encapsulates its mutable state.
 * - Fixme: ⚠️️ the below might not be needed
 */
extension MigrationPayload: @unchecked Sendable {}
