//
//  JSONParser.swift
//  JsonParsing
//
//  Created by abdelrahman mohamed on 2/22/16.
//  Copyright © 2016 Abdulrhman dev. All rights reserved.
//

import Foundation

class JSONParser{
    typealias JSONDictionary = [String: AnyObject]
    
    func parseDictionary(data: NSData?) -> [String: AnyObject]?
    {
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
    
    func parseRepo(dict: JSONDictionary) -> Repository?
    {
        guard let id = dict["id"] as? Int else {
            print("couldn't parse id")
            return nil
        }
        guard let name = dict["name"] as? String else {
            print("couldn't parse name for id: \(id)")
            return nil
        }
        guard let description = dict["description"] as? String
            else {
            print("couldn't parse description for id: \(id), name: \(name)")
            return nil
        }
        let homepage = dict["homepage"] as? String
        return Repository(id: id, name: name, description:
            description, homePage: homepage)
    }
    
    func parseSearchResponse(json: JSONDictionary) -> [Repository]?
    {
        guard let items = json["items"] as? [JSONDictionary] else
        {
            print("Error: couldn't find items in JSON")
            return nil
        }
        let repos = items.flatMap{parseRepo($0)}
        return repos
    }
}

struct Repository {
    let id: Int
    let name: String
    let description: String
    let homePage: String?
}