//
//  String+md5.swift
//  Banktest
//
//  Created by Raul Bautista on 5/2/22.
//

import Foundation
import CommonCrypto

public extension Strin {
    func md5() -> String {
        let context = UnsafeMutablePointer<CC_MD5_CTX>.allocate(capacity: 1)
        var digest = Array<UInt8>(repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5_Init(context)
        CC_MD5_Update(context, self, CC_LONG(lengthOfBytes(using: String.Encoding.utf8)))
        CC_MD5_Final(&digest, context)
        context.deallocate()
        var haxString = ""
        for byte in digest {
            haxString += String(format: "%02x", byte)
        }
        return haxString
    }
    
    
}
