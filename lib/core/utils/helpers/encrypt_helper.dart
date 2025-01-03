import 'dart:convert';
import 'package:encrypt/encrypt.dart' as encrypt;

class EncryptionHelper {
  late final encrypt.Key key;
  late final encrypt.Encrypter encrypter;

  // Constructor with fixed key for AES-256 encryption
  EncryptionHelper() {
    const keyString =
        'caf68c02d88d15e493aaa3a580384b39'; // 32 characters for AES-256
    key = encrypt.Key.fromUtf8(keyString);
    encrypter = encrypt.Encrypter(
        encrypt.AES(key, mode: encrypt.AESMode.cbc)); // Using CBC mode
  }

  String encryptJson(String plainText) {
    final iv = encrypt.IV
        .fromLength(16); // Generate a new random IV for each encryption
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    // Return both IV and encrypted data together
    return '${iv.base64}:${encrypted.base64}';
  }

  String decryptJson(String encryptedText) {
    try {
      // Split the input to get the IV and the encrypted text
      final parts = encryptedText.split(':');
      if (parts.length != 2) {
        throw Exception('Invalid encrypted text format');
      }
      final iv = encrypt.IV.fromBase64(parts[0]);
      final encryptedData = parts[1];

      final decrypted = encrypter.decrypt64(encryptedData, iv: iv);
      return decrypted;
    } catch (e) {
      return "Decryption failed";
    }
  }

  String encryptString(String data) {
    data = base64Encode(utf8.encode(data));

    return data;
  }

  String decryptString(String data) {
    data = utf8.decode(base64Decode(data));

    return data;
  }
}
