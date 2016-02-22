//
//  JSONParserTests.swift
//  JsonParsing
//
//  Created by abdelrahman mohamed on 2/22/16.
//  Copyright © 2016 Abdulrhman dev. All rights reserved.
//

import XCTest
@testable import JsonParsing

class JSONParserTests: XCTestCase {
    
   
    func test_parseDictionary() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let path = bundle.pathForResource("search-response", ofType:
            "json")
        let data = NSData(contentsOfFile: path!)
        
        let parser = JSONParser()
        let results = parser.parseDictionary(data)
        
        let items = results!["items"] as! [[String: AnyObject]]
        let repoDict = items[0]
        let repo = parser.parseRepo(repoDict)
        XCTAssertEqual("Alamofire", repo!.name)
    }
}
