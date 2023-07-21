//
//  Double+Extension.swift
//  Dashboard People Counter
//
//  Created by Rainer Regan on 21/07/23.
//

import Foundation

extension Double {
    func toFormattedString() -> String {
        return String(format: "%.1f", self)
    }
}
