import Foundation
import SwiftProtobuf
/**
 * This extension provides conformance to `SwiftProtobuf.Message` and related protocols, enabling
 * `MigrationPayload` to be serialized and deserialized using the SwiftProtobuf runtime.
 */
extension MigrationPayload: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
   /**
    * The name of the message as defined in the protobuf specification.
    */
   static let protoMessageName: String = "MigrationPayload"
   /**
    * A mapping from the field numbers in the protobuf specification to their respective names, used for encoding and decoding.
    */
   static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
      1: .standard(proto: "otp_parameters"),
      2: .same(proto: "version"),
      3: .standard(proto: "batch_size"),
      4: .standard(proto: "batch_index"),
      5: .standard(proto: "batch_id"),
   ]
   /**
    * Decodes an instance of `MigrationPayload` from the protobuf representation.
    * The inline closures are used to reduce stack space allocation for each case branch when optimizations are disabled.
    * - Parameter decoder: The decoder instance to decode the message fields from.
    */
   mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
      while let fieldNumber = try decoder.nextFieldNumber() {
         switch fieldNumber {
         case 1: try { try decoder.decodeRepeatedMessageField(value: &self.otpParameters) }()
         case 2: try { try decoder.decodeSingularInt32Field(value: &self.version) }()
         case 3: try { try decoder.decodeSingularInt32Field(value: &self.batchSize) }()
         case 4: try { try decoder.decodeSingularInt32Field(value: &self.batchIndex) }()
         case 5: try { try decoder.decodeSingularInt32Field(value: &self.batchID) }()
         default: break
         }
      }
   }
   /**
    * Traverses the fields of the payload, visiting non-default fields.
    * This method is used to encode the message into a binary form by visiting each field with the provided visitor.
    * Fields with default values are not visited to optimize the encoded size.
    * - Parameter visitor: The visitor to use for traversing the fields.
    */
   func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
      if !self.otpParameters.isEmpty {
         try visitor.visitRepeatedMessageField(value: self.otpParameters, fieldNumber: 1)
      }

      // Iterate over the fields and visit them if they are non-default.
      let fields: [(value: Int32, fieldNumber: Int)] = [
          (self.version, 2),
          (self.batchSize, 3),
          (self.batchIndex, 4),
          (self.batchID, 5)
      ]

      for (value, fieldNumber) in fields {
          try visitIfNonDefault(&visitor, value: value, fieldNumber: fieldNumber)
      }

      try unknownFields.traverse(visitor: &visitor)
   }
   /**
    * Helper function to conditionally visit a field if it has a non-default value.
    * This is used to avoid encoding default values into the protobuf message, reducing the message size.
    * - Parameters:
    *   - visitor: The visitor that will encode the field if it has a non-default value.
    *   - value: The value of the field to check against its default value.
    *   - fieldNumber: The field number as specified in the protobuf definition.
    */
   private func visitIfNonDefault<V: SwiftProtobuf.Visitor>(
      _ visitor: inout V,
      value: Int32,
      fieldNumber: Int
   ) throws {
      if value != 0 {
         try visitor.visitSingularInt32Field(value: value, fieldNumber: fieldNumber)
      }
   }
   /**
    * Compares two `MigrationPayload` instances for equality.
    * Two instances are considered equal if all their corresponding fields are equal.
    * - Parameters:
    *   - lhs: The left-hand side `MigrationPayload` instance to compare.
    *   - rhs: The right-hand side `MigrationPayload` instance to compare.
    * - Returns: A Boolean value indicating whether the two instances are equal.
    */
   static func ==(lhs: MigrationPayload, rhs: MigrationPayload) -> Bool {
      return lhs.otpParameters == rhs.otpParameters &&
      lhs.version == rhs.version &&
      lhs.batchSize == rhs.batchSize &&
      lhs.batchIndex == rhs.batchIndex &&
      lhs.batchID == rhs.batchID &&
      lhs.unknownFields == rhs.unknownFields
   }
}
/**
 * Conformance to `SwiftProtobuf.Message` and related protocols for `MigrationPayload.OtpParameters`.
 * This extension provides the necessary functionality to encode and decode `OtpParameters` for protobuf.
 */
extension MigrationPayload.OtpParameters: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
   /**
    * The protobuf message name for `OtpParameters`.
    */
   static let protoMessageName: String = MigrationPayload.protoMessageName + ".OtpParameters"
   /**
    * The protobuf name map for `OtpParameters` fields.
    */
   static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
      1: .same(proto: "secret"),
      2: .same(proto: "name"),
      3: .same(proto: "issuer"),
      4: .same(proto: "algorithm"),
      5: .same(proto: "digits"),
      6: .same(proto: "type"),
      7: .same(proto: "counter"),
   ]
   /**
    * Decodes an instance of `OtpParameters` from the protobuf representation.
    * - Parameter decoder: The decoder instance to decode the fields of `OtpParameters`.
    */
   mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
      while let fieldNumber = try decoder.nextFieldNumber() {
         // The use of inline closures is to circumvent an issue where the compiler
         // allocates stack space for every case branch when no optimizations are
         // enabled. https://github.com/apple/swift-protobuf/issues/1034
         switch fieldNumber {
         case 1: try { try decoder.decodeSingularBytesField(value: &self.secret) }()
         case 2: try { try decoder.decodeSingularStringField(value: &self.name) }()
         case 3: try { try decoder.decodeSingularStringField(value: &self.issuer) }()
         case 4: try { try decoder.decodeSingularEnumField(value: &self.algorithm) }()
         case 5: try { try decoder.decodeSingularInt32Field(value: &self.digits) }()
         case 6: try { try decoder.decodeSingularEnumField(value: &self.type) }()
         case 7: try { try decoder.decodeSingularInt64Field(value: &self.counter) }()
         default: break
         }
      }
   }
   /**
    * Traverses the fields of `OtpParameters`, visiting each field with the provided visitor.
    * - Parameter visitor: The visitor to use for traversing the fields.
    */
   func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
      if !self.secret.isEmpty {
         try visitor.visitSingularBytesField(value: self.secret, fieldNumber: 1)
      }
      if !self.name.isEmpty {
         try visitor.visitSingularStringField(value: self.name, fieldNumber: 2)
      }
      if !self.issuer.isEmpty {
         try visitor.visitSingularStringField(value: self.issuer, fieldNumber: 3)
      }
      if self.algorithm != .algoInvalid {
         try visitor.visitSingularEnumField(value: self.algorithm, fieldNumber: 4)
      }
      if self.digits != 0 {
         try visitor.visitSingularInt32Field(value: self.digits, fieldNumber: 5)
      }
      if self.type != .otpInvalid {
         try visitor.visitSingularEnumField(value: self.type, fieldNumber: 6)
      }
      if self.counter != 0 {
         try visitor.visitSingularInt64Field(value: self.counter, fieldNumber: 7)
      }
      try unknownFields.traverse(visitor: &visitor)
   }
   /**
    * Compares two instances of `OtpParameters` for equality.
    * - Parameters:
    *   - lhs: The left-hand side instance of `OtpParameters`.
    *   - rhs: The right-hand side instance of `OtpParameters`.
    * - Returns: A Boolean value indicating whether the two instances are equal.
    */
   static func ==(lhs: MigrationPayload.OtpParameters, rhs: MigrationPayload.OtpParameters) -> Bool {
      return lhs.secret == rhs.secret &&
            lhs.name == rhs.name &&
            lhs.issuer == rhs.issuer &&
            lhs.algorithm == rhs.algorithm &&
            lhs.digits == rhs.digits &&
            lhs.type == rhs.type &&
            lhs.counter == rhs.counter &&
            lhs.unknownFields == rhs.unknownFields
   }
}
