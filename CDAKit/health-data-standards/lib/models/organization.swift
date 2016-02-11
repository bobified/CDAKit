//
//  organization.swift
//  CDAKit
//
//  Created by Eric Whitley on 11/30/15.
//  Copyright © 2015 Eric Whitley. All rights reserved.
//

import Foundation
import Mustache

public class HDSOrganization: HDSJSONInstantiable, CustomStringConvertible, Equatable, Hashable {
  
  public var name: String?
  
  public var addresses: [HDSAddress] = [HDSAddress]()
  public var telecoms: [HDSTelecom] = [HDSTelecom]()

  //embeds_many :addresses, as: :locatable
  //embeds_many :telecoms, as: :contactable
  
  public init() {
  }
  
  required public init(event: [String:Any?]) {
    initFromEventList(event)
  }
  
  private func initFromEventList(event: [String:Any?]) {
    for (key, value) in event {
      HDSUtility.setProperty(self, property: key, value: value)
    }
  }
  
  public var description: String {
    return "HDSOrganization => name: \(name), addresses: \(addresses), telecoms: \(telecoms)"
  }
  
}

extension HDSOrganization {
  public var hashValue: Int {
    
    var hv: Int
    
    hv = "\(name)".hashValue
    
    if addresses.count > 0 {
      hv = hv ^ "\(addresses)".hashValue
    }
    if telecoms.count > 0 {
      hv = hv ^ "\(telecoms)".hashValue
    }
    
    return hv
  }
}

public func == (lhs: HDSOrganization, rhs: HDSOrganization) -> Bool {
  return lhs.hashValue == rhs.hashValue && HDSCommonUtility.classNameAsString(lhs) == HDSCommonUtility.classNameAsString(rhs)
}


extension HDSOrganization: MustacheBoxable {
  var boxedValues: [String:MustacheBox] {
    return [
      "name" :  Box(name),
      "addresses": Box(addresses),
      "telecoms" : Box(telecoms)
    ]
  }
  
  public var mustacheBox: MustacheBox {
    return Box(boxedValues)
  }
}