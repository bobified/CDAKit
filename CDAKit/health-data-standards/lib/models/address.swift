//
//  address.swift
//  CDAKit
//
//  Created by Eric Whitley on 11/30/15.
//  Copyright © 2015 Eric Whitley. All rights reserved.
//

import Foundation

public class HDSAddress: NSObject, HDSJSONInstantiable {
  
  var record: HDSRecord?
  
  public var street: [String] = [String]()
  public var city: String?
  public var state: String?
  public var zip: String?
  public var country: String?
  public var use: String?
  
  
  public override init(){
    super.init()
  }
  
  public init(street:[String] = [], city: String?, state: String?, zip: String?, country: String?, use: String?) {
    super.init()
    self.street = street
    self.city = city
    self.state = state
    self.zip = zip
    self.country = country
    self.use = use
  }
  
  required public init(event: [String:Any?]) {
    super.init()
    initFromEventList(event)
  }
  
  private func initFromEventList(event: [String:Any?]) {
    for (key, value) in event {
      HDSUtility.setProperty(self, property: key, value: value)
    }
  }

  override public var description: String {
    return "HDSAddress => street: \(street), city: \(city), state: \(state), zip: \(zip), country: \(country), use: \(use)"
  }
  
}