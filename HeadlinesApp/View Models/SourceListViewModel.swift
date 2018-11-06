//
//  SourceListViewModel.swift
//  HeadlinesApp
//
//  Created by federico mazzini on 31/10/2018.
//  Copyright © 2018 Mohammad Azam. All rights reserved.
//

import Foundation

class SourceListViewModel {
    
    private var webservice: Webservice
    private (set) var sourcesViewModel: [SourceViewModel] = [SourceViewModel]()
    private var completion: () -> () = { }
    
    init(webservice: Webservice, completion: @escaping () -> ()) {
        self.webservice = webservice
        self.completion = completion
        populateSources()
    }
    
    func populateSources() {
        self.webservice.loadSources { sources in
            self.sourcesViewModel = sources.compactMap(SourceViewModel.init)
            self.completion()
        }
    }
    
    func sourceAt(index: Int) -> SourceViewModel {
        return self.sourcesViewModel[index]
    }
}

class SourceViewModel {
    var id :String
    var name :String
    var description :String
    
    init(source: Source) {
        self.id = source.id
        self.name = source.name
        self.description = source.description
    }
    
    init(id :String, name :String, description :String) {
        self.id = id
        self.name = name
        self.description = description
    }
}
