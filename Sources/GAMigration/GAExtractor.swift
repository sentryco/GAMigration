import SwiftProtobuf
import Foundation
/**
 * A utility class responsible for extracting Google Authenticator OTP (One-Time Password) configurations
 * from a migration URI.
 */
public class GAExtractor {
   /**
    * Extracts and decodes a list of `GAOtp` instances from a Google Authenticator migration URI.
    * - Parameter input: The migration URI containing encoded OTP configurations.
    * - Returns: An array of `GAOtp` instances representing the extracted OTP configurations.
    */
    public static func parseMigrationURI(input: String) throws -> [GAOtp] { //
        let data = try decodeMigrationUriToData(input: input)
        return try decodeDataToGAOtpArray(data: data)
    }
}
/**
 * Private helper
 */
extension GAExtractor {
   /**
    * Converts a Google Authenticator migration URI into a `Data` object containing the encoded OTP configurations.
    * This method extracts the base64-encoded payload from the URI's query parameter and decodes it into `Data`.
    * - Parameter input: The migration URI string to be processed.
    * - Returns: A `Data` object representing the decoded base64 payload from the URI.
    * - Throws: `GAError.incorrectInput` if the URI is not properly formatted or the payload cannot be decoded.
    */
   private static func decodeMigrationUriToData(input: String) throws -> Data {
      guard input.starts(with: "otpauth-migration://"),
            let url = URL(string: input),
            let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
            let queryItems = components.queryItems else {
         throw GAError.incorrectInput
      }
      guard let encodedData = queryItems.first?.value?
         .replacingOccurrences(of: " ", with: "+"),
            let decodedData = Data(base64Encoded: encodedData) else {
         throw GAError.incorrectInput
      }
      return decodedData
   }
   /**
    * Decodes the given data into a `MigrationPayload` and maps it to an array of `GAOtp` instances.
    * This function is responsible for interpreting the raw bytes of the migration payload and converting
    * them into a structured format that represents the OTP configurations.
    * - Parameter data: The raw data representing the encoded migration payload.
    * - Returns: An array of `GAOtp` instances extracted from the migration payload.
    */
   private static func decodeDataToGAOtpArray(data: Data) throws -> [GAOtp] {
      do {
         let migrationPayload = try MigrationPayload(serializedBytes: data) // ⚠️️ was serializedData, but deprecated
         return migrationPayload.otpParameters.map {
            GAOtp(
               typeRawInt: $0.type.rawValue,
               algorithmRawInt: $0.algorithm.rawValue,
               name: $0.name,
               secret: $0.secret,
               issuer: $0.issuer,
               counter: $0.counter,
               digitsRawValue: Int($0.digits)
            )
         }
      } catch {
         print("Error: Cannot decrypt data in MigrationPayload")
         throw GAError.cannotDecrypt
      }
   }
}
