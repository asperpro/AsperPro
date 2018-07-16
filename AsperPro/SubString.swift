//
//  SubString.swift
//  AsperPro
//
//  Created by didarkam on 7/14/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation

extension String {
    
    func chopPrefix(_ count: Int = 1) -> String {
        return substring(from: index(startIndex, offsetBy: count))
    }
    
    func chopSuffix(_ count: Int = 1) -> String {
        return substring(to: index(endIndex, offsetBy: -count))
    }
    
}
