//
//  Webservice.swift
//  HeadlinesApp
//
//  Created by federico mazzini on 30/10/2018.
//  Copyright © 2018 Mohammad Azam. All rights reserved.
//

import Foundation

class Webservice {
    
    func loadSources(completion: @escaping ([Source]) -> ()) {
        
        var sources = [Source]()
        
        let sourceURL = URL(string :"https://newsapi.org/v2/sources?apiKey=94938aa1843d488da0ea93186de04acf")!
        
        URLSession.shared.dataTask(with: sourceURL) { data, _, _ in
            
            if let data = data {
                
                let json = try! JSONSerialization.jsonObject(with: data, options: [])
                let dictionary = json as! [String:Any]
                let sourcesDictionary = dictionary["sources"] as! [[String:Any]]
                
                sources = sourcesDictionary.compactMap(Source.init)
                
                DispatchQueue.main.async {
                    completion(sources)
                }
            }
            
            }.resume()
    }
    
    func loadHeadLineForSource(source: Source, completion: @escaping ([Headline]) -> ()) {
        
        var headlines = [Headline]()
        
        // get the headlines by source
        let url = URL(string :"https://newsapi.org/v2/top-headlines?sources=\(source.id)&apiKey=94938aa1843d488da0ea93186de04acf")!
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            if let data = data {
                
                let json = try! JSONSerialization.jsonObject(with: data, options: [])
                let dictionary = json as! [String:Any]
                let headlineDictionaries = dictionary["articles"] as! [[String:Any]]
                
                headlines = headlineDictionaries.compactMap(Headline.init)
                
                completion(headlines)
            }
            
        }.resume()
    }
    
}
