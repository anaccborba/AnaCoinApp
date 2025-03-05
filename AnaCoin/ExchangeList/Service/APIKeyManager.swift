//
//  APIKeyManager.swift
//  AnaCoin
//
//  Created by Ana Carolina Camargo Borba on 05/03/25.
//

import Foundation

final class APIKeyManager {
    
    init() {}
    
    private func getValue(forKey key: String) -> String {
        return Bundle.main.object(forInfoDictionaryKey: key) as? String ?? "Key Not Found"
    }
    
    var apiKey: String {
        return getValue(forKey: "API_KEY")
    }
}
