//
//  String+Extension.swift
//  AnaCoin
//
//  Created by Ana Carolina Camargo Borba on 03/03/25.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
    
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZ"
        
        if let date = dateFormatter.date(from: self) {
            dateFormatter.locale = Locale(identifier: "pt_BR")
            dateFormatter.dateStyle = .short
            return dateFormatter.string(from: date)
        }
        return LocalizedStrings.invalidDate
    }
}
