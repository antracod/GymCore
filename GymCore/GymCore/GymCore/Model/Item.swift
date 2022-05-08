//
//  Data.swift
//  GymCore
//
//  Created by Teodor Radu on 07.05.2022.
//

import Foundation
import RealmSwift

class Item: Object{
    @objc dynamic var title : String = ""
    @objc dynamic var checked : Bool = false
    

}
