//
//  ReverseWordsModel.swift
//  Reverse words
//
//  Created by Jevgenijs Jefrosinins on 09/09/2021.
//

import Foundation

struct ReverseWordsModel {
    
    var exceptionElements = String()
    var settings: ReverseWordsSettings = .defaultSettings
    
    func reverse(string: String) -> String {
        let words = string.components(separatedBy: " ")
        var result = String()
        
        for word in words {
            result.append("\(rearrangeWord(word)) ")
        }
        return result
    }
    
    private func rearrangeWord(_ word: String) -> String {
        
        var arrayOfCharacters = Array(word)
    
        var firstElementIndex = 0
        var secondElementIndex = arrayOfCharacters.count - 1
        
        while firstElementIndex < secondElementIndex {
            
            let firstElement = word[firstElementIndex]
            let secondElement = word[secondElementIndex]
            
            switch self {
            // If both elements are not exceptions
            case _ where !isException(element: firstElement) &&
                         !isException(element: secondElement):
                // Swap them
                arrayOfCharacters.swapAt(firstElementIndex, secondElementIndex)
                // Moving towards to the next index of first element in the word
                firstElementIndex += 1
                // Moving towards to the previous index of second element in the word
                secondElementIndex -= 1
            
            case _ where isException(element: firstElement):
                // If first element is exception - skip it
                firstElementIndex += 1
            default:
                // If second element is exception - skip it
                secondElementIndex -= 1
            }
        }
        return String(arrayOfCharacters)
    }
    
    private func isException(element: String.Element) -> Bool {
        switch settings {
        // If settings are not default
        case .customSettings, .extraSettings:
            if !exceptionElements.contains(element) {
                return false
            }
            return true
            // If settings are default
        default:
            if element.isLetter {
                return false
            }
            return true
        }
    }
}
