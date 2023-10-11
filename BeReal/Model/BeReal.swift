//
//  BeReal.swift
//  BeReal
//
//  Created by Volkan Celik on 28/07/2023.
//

import SwiftUI

struct BeReal:Decodable{
    var username:String
    var frontImageUrl:String
    var backImageUrl:String
    var userId:String
    var user:User?
}
