[![Tests](https://github.com/sentryco/GAMigration/actions/workflows/Tests.yml/badge.svg)](https://github.com/sentryco/GAMigration/actions/workflows/Tests.yml)

# GAMigration

> Google authenticator migration

## Description:
Allows you to extract two-factor authentication secret keys from Google Authenticator export QR codes

## Prerequisites

- Swift 5.0 or later
- iOS 17 or macOS 14 or later

## Problem
- Acquire the accurate proto3 schema utilized by Google Authenticator for compatibility.
- Develop a dedicated Proto3Parser class tailored to interpret this unique schema.
- Incorporate comprehensive error management to address potential parsing exceptions and atypical cases.

## Solution
- A ProtoBuf wrapper to extract data from strings efficiently
- Capability to export data in the widely-used OTP format
- Robust error handling ensured by extensive unit testing

## Features
- Efficient parsing and decryption of Google Authenticator migration payloads.
- Extensive support for a variety of OTP types and cryptographic algorithms.
- Thorough error handling to gracefully manage a wide range of potential edge cases.
- Rigorous unit testing to validate functionality and ensure the integrity of the solution.

## Installation
To integrate GAMigration into your Xcode project using Swift Package Manager, specify it in your `Package.swift` file:

```swift
.package(url: "https://github.com/sentryco/GAMigration", branch: "main")
```

> [!NOTE]
> Google Authenticator uses a specific format for exporting OTP accounts via QR codes. The QR code contains a URL with the following structure: otpauth-migration://offline?data=<base64-encoded-proto3-message>

## Usage Example

```swift
let stringFromGoogleAuthApp = "otpauth-migration://offline?data=CjEKCkhlbGxvId6tvu8SGEV4YW1wbGU6YWxpY2VAZ29vZ2xlLmNvbRoHRXhhbXBsZTAC"
if let decrypted = try? GAExtractor.parseMigrationURI(input: stringFromGoogleAuthApp), let firstOTP = decrypted.first {
    print("Type: \(firstOTP.type)") // output: type: .totp
    print("Algorithm: \(firstOTP.algorithm)") // output: algorithm: .unspecified
    print("Name: \(firstOTP.name)") // output: name: "Example:alice@google.com"
    print("Secret: \(firstOTP.secret)") // output: secret: "JBSWY3DPEHPK3PXP"
    print("Issuer: \(firstOTP.issuer)") // output: issuer: "Example"
    print("Counter: \(firstOTP.counter)") // output: counter: 0
    print("Digits Raw Value: \(firstOTP.digitsRawValue)") // output: digitsRawValue: 0
} else {
    print("An error occurred or no OTPs were found.")
}
```

> [!IMPORTANT]
> Implement proper error handling in the calling code to handle edge cases

## Dependencies:

The following dependencies are used in the package:

- SwiftProtobuf: A plugin and runtime library for using protobuf with Swift.
  - Repository: [https://github.com/apple/swift-protobuf.git](https://github.com/apple/swift-protobuf.git)
  - Version: 1.20.1 or later

- Base32: A Base32 encoding and decoding library.
  - Repository: [https://github.com/norio-nomura/Base32](https://github.com/norio-nomura/Base32)
  - Version: 0.9.0 or later

These dependencies are managed by the Swift Package Manager (SPM) and are defined in the `Package.swift` file of the project.

> [!NOTE]
> Use Swift's built-in URL and Data handling methods for parsing the initial parts of the QR code

## What Are Protocol Buffers?

Protocol buffers are Google’s language-neutral, platform-neutral, extensible mechanism for serializing structured data – think XML, but smaller, faster, and simpler. You define how you want your data to be structured once, then you can use special generated source code to easily write and read your structured data to and from a variety of data streams and using a variety of languages.

## Additional Considerations:
- Multiple QR codes: If there are many accounts, Google Authenticator may split them into multiple QR codes. You'll need to handle this by processing each QR code separately
- Security: Ensure that you handle the extracted secret keys securely, as they are sensitive information
- Compatibility: This method specifically works with Google Authenticator's export format. Other authenticator apps may use different formats

> [!IMPORTANT]
> Ensure that you're following security best practices when dealing with sensitive authentication data.

## References:
- JS: https://github.com/krissrex/google-authenticator-exporter
- Export code: https://github.com/krissrex/google-authenticator-exporter/blob/master/src/index.js
- Testcode: https://github.com/krissrex/google-authenticator-exporter/blob/master/test-assets/test-qr-codes.json
- Protobuf: https://protobuf.dev
- Export format: https://github.com/Zwyx/google-authenticator-export-format
- OTP Migration: https://github.com/qistoph/otp_export/blob/master/OtpMigration.proto
- Has instructions regarding how to export via terminal: https://zwyx.dev/blog/google-authenticator-export-format
- Android: https://alexbakker.me/post/parsing-google-auth-export-qr-code.html
- Broser extractor: https://git.coolaj86.com/coolaj86/browser-authenticator.js
- Multiple export formats from various apps: https://github.com/scito/extract_otp_secrets

## Discussions: 
- https://www.reddit.com/r/PrivacyGuides/comments/107det6/export_google_authenticator_otp_to_alternative/
- https://stackoverflow.com/questions/34520928/how-to-generate-a-qr-code-for-google-authenticator-that-correctly-shows-issuer-d
- https://zwyx.dev/blog/google-authenticator-export-format
- https://secrets.app/support/import-google-authenticator/
- https://www.reddit.com/r/Bitwarden/comments/vhkj90/how_to_switch_from_google_authenticator_to_a/
- https://github.com/Bubka/2FAuth/issues/74
- https://github.com/google/google-authenticator/wiki/Key-Uri-Format
- https://stackoverflow.com/questions/73096833/how-long-is-a-google-authenticator-export-valid-and-can-it-be-used-imported-mult
- https://discussions.apple.com/thread/255767275
- https://support.google.com/accounts/thread/104921269/import-export-authenticator-accounts-on-ios-devices?hl=en
- https://fsw.teamdynamix.com/TDClient/2031/Portal/KB/ArticleDet?ID=162941
- https://swiftpackageindex.com/svyatoynick/GAuthSwiftParser
- https://help.roboform.com/hc/en-us/articles/21974113261197-How-to-Import-TOTP-QR-Codes-from-Google-Authenticator-into-RoboForm-iOS
- https://www.freecodecamp.org/news/how-to-implement-two-factor-authentication-in-your-flask-app/
- https://github.com/beemdevelopment/Aegis/pull/406/files

## Todo:
- try base64 and proto3
