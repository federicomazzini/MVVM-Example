//
//  HeadlineListViewModel.swift
//  HeadlinesApp
//
//  Created by federico mazzini on 31/10/2018.
//  Copyright © 2018 Mohammad Azam. All rights reserved.
//

import Foundation

class HeadlineListViewModel {
    private (set) var headlineViewModels: [HeadLineViewModel] = [HeadLineViewModel]()
    
    init(sourceViewModel: SourceViewModel, completion: @escaping () -> ()) {
        let source = Source(sourceViewModel: sourceViewModel)
        
        Webservice().loadHeadLineForSource(source: source) { headlines in
            self.headlineViewModels = headlines.compactMap(HeadLineViewModel.init)
            
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func sourceAt(index: Int) -> HeadLineViewModel {
        return self.headlineViewModels[index]
    }
}

class HeadLineViewModel {
    
    var title :String!
    var description :String!
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
    
    init(headline: Headline) {
        self.title = headline.title
        self.description = headline.description
    }
}
