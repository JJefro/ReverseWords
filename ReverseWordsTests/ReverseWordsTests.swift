//
//  ReverseWordsTests.swift
//  ReverseWordsTests
//
//  Created by Jevgenijs Jefrosinins on 03/09/2021.
//

import XCTest
@testable import Reverse_words

class ReverseWordsTests: XCTestCase {

    var sut: ReverseWordsService!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ReverseWordsService()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let strExample1 = "Reverse words"
        let expectedOutput1 = "esreveR sdrow"
        
        let strExample2 = "Test string"
        let expectedOutput2 = "tseT gnirts"
        
        let strExample3 = "May the force be with you"
        let expectedOutput3 = "yaM eht ecrof eb htiw uoy"
        
        let strExample4 = """
            Blackbird singing in the dead of night Take these broken wings and learn to fly All your life You were only waiting for this moment to arise
            """
        let expectedOutput4 = """
            dribkcalB gnignis ni eht daed fo thgin ekaT eseht nekorb sgniw dna nrael ot ylf llA ruoy efil uoY erew ylno gnitiaw rof siht tnemom ot esira
            """
        
        
        let result1 = sut.reverse(string: strExample1)
        let result2 = sut.reverse(string: strExample2)
        let result3 = sut.reverse(string: strExample3)
        let result4 = sut.reverse(string: strExample4)
        
        XCTAssertEqual(expectedOutput1, result1)
        XCTAssertEqual(expectedOutput2, result2)
        XCTAssertEqual(expectedOutput3, result3)
        XCTAssertEqual(expectedOutput4, result4)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
