import Foundation
/**
 * An enumeration that defines the possible errors that can occur during the Google Authenticator migration process.
 * - Fixme: ⚠️️ add .unsupportedFeature
 */
public enum GAError: Error {
   /**
    * Indicates that the input provided to the migration process is incorrect or malformed.
    */
    case incorrectInput
   /**
    * Indicates that the decryption of the input data failed, possibly due to incorrect or corrupted data.
    */
    case cannotDecrypt
}
