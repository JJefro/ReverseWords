//
//  ReverseWordsService.swift
//  Reverse words
//
//  Created by Jevgenijs Jefrosinins on 09/09/2021.
//

import Foundation

struct ReverseWordsService {
    
    func reverse(string: String) -> String {
        return String(string.split(separator: " ").map { $0.reversed()}.joined(separator: " "))
    }
}
