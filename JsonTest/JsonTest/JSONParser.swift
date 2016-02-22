//
//  JSONParser.swift
//  JsonTest
//
//  Created by abdelrahman mohamed on 2/22/16.
//  Copyright © 2016 Abdulrhman dev. All rights reserved.
//

import Foundation

class JSONParser{
    func parseDictionary(data: NSData?) -> [String: AnyObject]? {
        do{
            if let data = data,
                json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as?
                    [String: AnyObject]
            {
                return json
            }
        } catch {
            print("couldn't parse JSON")
        }
        return nil
    }
}