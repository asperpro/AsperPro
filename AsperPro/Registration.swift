//
//  Registration.swift
//  AsperPro
//
//  Created by didarkam on 7/10/18.
//  Copyright © 2018 migroup. All rights reserved.
//

import Foundation




struct RegisterSingleton {
    
    
    
    static var sharedInstance = RegisterSingleton()
    
    var selectedServicesIds = [Int]()
    var selectedExtraOptionsIds = [Int]()
    
    var selectedCarBrandsIds = [Int]()
    
    
    
    mutating func addSelectedServiceWithId(id: Int) {
        selectedServicesIds.append(id)
        print("service with id \(id) is added" )
        print("count is \(selectedServicesIds.count))")
    }
    
    mutating func removeDeselectedServiceWithId(id: Int) {
        if let index = selectedServicesIds.index(of: id) {
            selectedServicesIds.remove(at: index)
            print("service with id \(id) is removed" )
            print("count is \(selectedServicesIds.count))")
        }
    }
    
    mutating func addSelectedExtraOptionWithId(id: Int) {
        selectedExtraOptionsIds.append(id)
        print("extra with id \(id) is added" )
        print("count is \(selectedExtraOptionsIds.count))")
    }
    
    mutating func removeDeselectedExtraOptionWithId(id: Int) {
        if let index = selectedExtraOptionsIds.index(of: id) {
            selectedExtraOptionsIds.remove(at: index)
            print("extra with id \(id) is removed" )
            print("count is \(selectedExtraOptionsIds.count))")
        }
    }
    
}


