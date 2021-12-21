import 'dart:math';

import 'package:hex/hex.dart';

class Encryption {
  static String encry(String src, String key, bool encrypt) {
    int keyLen;
    int keyPos;
    int offset;
    int srcPos;
    int srcAsc;
    int tmpsrcAsc;
    int range;
    String dest = "";

    keyLen = key.length;
    if (keyLen == 0) {
      key = "Tom Lee";
    }

    keyPos = -1;
    srcPos = 0;
    srcAsc = 0;
    range = 256;
    // Encryption
    if (encrypt == true) {
      Random r1 = Random();
      offset = r1.nextInt(range);
      if (offset >= 16) {
        dest = HEX.encode([offset]).toUpperCase();
      } else {
        dest = HEX.encode([offset]).toUpperCase();
      }

      for (srcPos = 0; srcPos < src.length; srcPos++) {
        srcAsc = (src.codeUnitAt(srcPos) + offset) % 255; // % =
        // mod
        if (keyPos < keyLen - 1) {
          keyPos = keyPos + 1;
        } else {
          keyPos = 0;
        }
        srcAsc = srcAsc ^ (key.codeUnitAt(keyPos));
        // ^ = XOR
        if (srcAsc >= 16) {
          dest = dest + HEX.encode([srcAsc]).toUpperCase();
        } else {
          dest = dest + HEX.encode([srcAsc]).toUpperCase();
        }
        offset = srcAsc;
      }
    } else {
      // Decryption
      if (src == null || src.length == 2) {
        return "";
      }
      offset = _hexToInt(src.substring(0, 2)); // Hexadecimal to decimal
      srcPos = 2;
      do {
        srcAsc = _hexToInt(src.substring(srcPos, srcPos + 2));
        if (keyPos < keyLen - 1) {
          keyPos = keyPos + 1;
        } else {
          keyPos = 0;
        }
        if (dest.contains("rafa")) {
          dest;
        }
        tmpsrcAsc = srcAsc ^ key.codeUnitAt(keyPos); // Ascii
        if (tmpsrcAsc <= offset) {
          tmpsrcAsc = 255 + tmpsrcAsc - offset;
        } else {
          tmpsrcAsc = tmpsrcAsc - offset;
        }
        dest = dest + String.fromCharCode(tmpsrcAsc);
        offset = srcAsc;
        srcPos = srcPos + 2;
      } while (srcPos < src.length - 1);
    }
    return dest;
  }

  // Hexadecimal's string to decimal int
  static int _hexToInt(String hexStr) {
    int result = 0;
    String singleHex = hexStr;
    for (int i = 0; i < singleHex.length; i++) {
      int temp1 = singleHex[i].codeUnitAt(0); // Ascii
      if (temp1 >= 97) {
        // a...f
        result = result * 16 + temp1 - 87;
      } else {
        // A...F
        if (temp1 >= 65) {
          result = result * 16 + temp1 - 55;
        } else {
          // 0...10
          result = result * 16 + temp1 - 48;
        }
      }
    }

    return result;
  }
}
