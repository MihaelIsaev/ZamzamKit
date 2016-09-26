//
//  NSURLComponentsExtension.swift
//  ZamzamKit
//
//  Created by Basem Emara on 2/17/16.
//  Copyright © 2016 Zamzam. All rights reserved.
//

import Foundation

public extension URLComponents {
    
    /**
     Add, update, or remove a query string parameter from the URL
     
     - parameter url:   the URL
     - parameter key:   the key of the query string parameter
     - parameter value: the value to replace the query string parameter, nil will remove item
     
     - returns: the URL with the mutated query string
     */
    public func addOrUpdateQueryStringParameter(_ key: String, value: String?) -> String {
        if var queryItems: [URLQueryItem] = (self.queryItems ?? []) {
            for (index, item) in queryItems.enumerated() {
                // Match query string key and update
                if item.name.lowercased() == key.lowercased() {
                    if let v = value {
                        queryItems[index] = URLQueryItem(name: key, value: v)
                    } else {
                        queryItems.remove(at: index)
                    }
                    self.queryItems = queryItems.count > 0
                        ? queryItems : nil
                    return self.string!
                }
            }
            
            // Key doesn't exist if reaches here
            if let v = value {
                // Add key to URL query string
                queryItems.append(URLQueryItem(name: key, value: v))
                self.queryItems = queryItems
                return self.string!
            }
        }
        
        return self.string ?? ""
    }
    
    /**
     Add, update, or remove a query string parameters from the URL
     
     - parameter url:   the URL
     - parameter values: the dictionary of query string parameters to replace
     
     - returns: the URL with the mutated query string
     */
    public func addOrUpdateQueryStringParameter(_ values: [String: String?]) -> String {
        var newUrl = self.string ?? ""
        
        for item in values {
            newUrl = self.addOrUpdateQueryStringParameter(item.0, value: item.1)
        }
        
        return newUrl
    }
    
    /**
     Removes a query string parameter from the URL
     
     - parameter url:   the URL
     - parameter key:   the key of the query string parameter
     
     - returns: the URL with the mutated query string
     */
    public func removeQueryStringParameter(_ key: String) -> String {
        return self.addOrUpdateQueryStringParameter(key, value: nil)
    }
    
}
