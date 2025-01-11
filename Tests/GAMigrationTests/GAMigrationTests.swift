import XCTest
@testable import GAMigration
/**
 * - Fixme: ⚠️️ more testcode here: https://github.com/krissrex/google-authenticator-exporter/blob/master/test-assets/test-qr-codes.json
 * - Fixme: ⚠️️ add more tests from: https://github.com/google/google-authenticator/wiki/Key-Uri-Format
 */
final class GAuthDecryptTests: XCTestCase {
   /**
    * This test case verifies that the GAExtractor correctly throws an error when provided with an incorrect header in the input URI.
    * The input URI is expected to start with "otpauth-migration://offline?data=".
    * If the header is incorrect, the GAExtractor should throw a GAError.incorrectInput error.
    * maybe use: otpauth://offline?data=INVALIDDATA ?
    */
   func testParsingIncorrectHeader() {
      XCTAssertThrowsError(try GAExtractor.parseMigrationURI(input: "otp://offline?data=CjEKCkhlbGxvId6tvu8SGEV4YW1wbGU6YWxpY2VAZ29vZ2xlLmNvbRoHRXhhbXBsZTAC")) { error in
         XCTAssertEqual(error as? GAError, .incorrectInput)
      }
   }
   /**
    * Tests that an incorrect header in the input URI results in the appropriate error.
    * This test ensures that the GAExtractor correctly identifies and rejects URIs with headers
    * that do not match the expected format for Google Authenticator migration URIs.
    */
   func testParsingIncorrectData() {
      XCTAssertThrowsError(try GAExtractor.parseMigrationURI(input: "otpauth-migration://offline?data=CjEKCkhlbGxvId6t8SGEV4YW1wbGU6YWxpY2VA")) { error in
         XCTAssertEqual(error as? GAError, .incorrectInput)
      }
   }
   /**
    * This test case verifies that the GAExtractor can correctly parse and extract data from a valid input string.
    * maybe use: "otpauth-migration://offline?data=NEW_TEST_INPUT"
    */
   func testParsingCorrect() {
      XCTAssertNoThrow(try GAExtractor.parseMigrationURI(input: "otpauth-migration://offline?data=CjEKCkhlbGxvId6tvu8SGEV4YW1wbGU6YWxpY2VAZ29vZ2xlLmNvbRoHRXhhbXBsZTAC"))
   }
   /**
    * This test case is reserved for future use.
    */
   func testGAuthDecryptSingleAccount() {
      let input = "otpauth-migration://offline?data=CjEKCkhlbGxvId6tvu8SGEV4YW1wbGU6c2FtQG9wZW5haS5jb20aB0V4YW1wbGUwAg"
      
      do {
         let gauth = try GAExtractor.parseMigrationURI(input: input)
         XCTAssertEqual(gauth.count, 1, "Expected exactly one account to be decrypted")
         XCTAssertEqual(gauth.first?.name, "Example:sam@openai.com", "Decrypted account name does not match")
      } catch {
         XCTFail("Decryption failed with error: \(error)")
      }
   }
   /**
    * Tests the functionality of the GAExtractor to ensure it throws an error when provided with an incorrect input.
    */
   func testGAuthMultipleDecrypt() {
      let input = "otpauth-migration://offline?data=CiMKC5OYSRBRJMThkOSJEg5Tb21lIGNvZGUgd2l0aCABKAEwAgoZCgqHIGPETdC5oJg5EgV0ZXN0MSABKAEwAgoZCgqHIGPETdC5oJg5EgV0ZXN0MiABKAEwAhABGAEgAA%3D%3D"
      do {
         let gauth = try GAExtractor.parseMigrationURI(input: input)
         XCTAssertEqual(gauth.count, 3, "Expected three accounts to be decrypted")
         
         let names = gauth.map { $0.name }
         
         XCTAssertTrue(names.contains("Some code with"), "Decrypted accounts should contain 'Some code with'")
         XCTAssertTrue(names.contains("test1"), "Decrypted accounts should contain 'test1'")
         XCTAssertTrue(names.contains("test2"), "Decrypted accounts should contain 'test2'")
      } catch {
         XCTFail("Decryption failed with error: \(error)")
      }
   }
   /**
    * Tests that the GAExtractor throws an error when attempting to decrypt data that is not in the correct format.
    * This test case ensures that the GAExtractor identifies and rejects data that does not conform to the expected
    * structure of a Google Authenticator migration URI payload, thus throwing a decryption error.
    */
   func testIncorrectGAuthDecrypt() {
      let input = "otpauth-migration://offline?data=cmFuZG9tdGV4dGhlcmVlbmNvZGVk"
      
      XCTAssertThrowsError(try GAExtractor.parseMigrationURI(input: input)) { error in
         XCTAssertEqual(error as? GAError, .cannotDecrypt, "Expected .cannotDecrypt error type")
      }
   }
}
