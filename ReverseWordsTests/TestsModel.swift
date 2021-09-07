//
//  TestsModel.swift
//  ReverseWordsTests
//
//  Created by Jevgenijs Jefrosinins on 07/09/2021.
//

import Foundation

struct TestsModel {
    
    let stringInput_1 = "Reverse words"
    let expectedOutput_1 = "esreveR sdrow"
    
    let stringInput_2 = "Test string"
    let expectedOutput_2 = "tseT gnirts"
    
    let stringInput_3 = "May the force be with you"
    let expectedOutput_3 = "yaM eht ecrof eb htiw uoy"
    
    let stringInput_4 = """
        Blackbird singing in the dead of night Take these broken wings and learn to fly All your life You were only waiting for this moment to arise
        """
    let expectedOutput_4 = """
        dribkcalB gnignis ni eht daed fo thgin ekaT eseht nekorb sgniw dna nrael ot ylf llA ruoy efil uoY erew ylno gnitiaw rof siht tnemom ot esira
        """
}
