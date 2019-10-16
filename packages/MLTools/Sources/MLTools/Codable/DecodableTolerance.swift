//
//  DecodableTolerance.swift
//  
//
//  Created by Jose Luis Sagredo on 15/10/2019.
//

import Foundation

/// Extension to implement the decode functionality with a minimum of Tolerance
public extension KeyedDecodingContainer {
    /// Struct to decodable
    private struct EmptyDecodable: Decodable {}
    
    /// Decode Array Tolerance
    ///
    /// - Parameters:
    ///     - type: the array data type to instance
    ///     - key: string asociated to property that will be instance
    ///     - min: min value required on array
    /// - Returns: array decoded
    ///
    func decodeArrayTolerance<T:Codable>(_ type: T.Type, forKey key: KeyedDecodingContainer<K>.Key, min:Int = 0) throws -> [T] {
        var items = [T]()
        var data = try self.nestedUnkeyedContainer(forKey: key)
        while !data.isAtEnd {
            if let block = try? data.decode(type) {
                items.append(block)
                continue
            }
            if min < 0 {
                throw DecodingError.dataCorruptedError(
                    forKey: key,
                    in: self,
                    debugDescription: "Decoding error was detected in \(key.stringValue)"
                )
            }
            _ = try? data.decode(EmptyDecodable.self)
        }
        
        if min > 0 {
            if min > items.count  {
                throw DecodingError.dataCorruptedError(
                    forKey: key,
                    in: self,
                    debugDescription: String(
                        format: "Total of %i items decoding, but the minimum required in %@ is %i",
                        items.count,
                        key.stringValue,
                        min
                    )
                )
            }
        }
        
        return items
    }
}
