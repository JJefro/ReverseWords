//
//  TestsModel.swift
//  ReverseWordsTests
//
//  Created by Jevgenijs Jefrosinins on 07/09/2021.
//

// swiftlint:disable all

import Foundation

struct TestsModel {
    
    // Single words input and output examples
    let singleWordInput_1 = "Reverse"
    let expectedSingleWordOutput_1 = "esreveR"
    
    let singleWordInput_2 = "string"
    let expectedSingleWordOutput_2 = "gnirts"
    
    let singleWordInput_3 = "force"
    let expectedSingleWordOutput_3 = "ecrof"
    

    // Multi-words input and output examples
    let multiWordsInput_1 = "Blackbird singing"
    let expectedMultiWordsOutput_1 = "dribkcalB gnignis"
    
    let multiWordsInput_2 = "You were only waiting for this moment to arise"
    let expectedMultiWordsOutput_2 = "uoY erew ylno gnitiaw rof siht tnemom ot esira"
    
    let multiWordsInput_3 = "Take these broken wings and learn to fly"
    let expectedMultiWordsOutput_3 = "ekaT eseht nekorb sgniw dna nrael ot ylf"
    
}
