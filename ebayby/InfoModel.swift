//
//  InfoModel.swift
//  ebayby
//
//  Created by user175571 on 1/16/21.
//

import Foundation
import SwiftUI

struct InfoModel{
    
    struct BabyBase{
        var NameOfCeleb: String
        var ImageOfCeleb: UIImage
        var BasePrice: Float
        var Description: String
        var id = UUID()
    }
    struct Article{
        var Title: String
        var Image: UIImage
        var Subtitle: String
        var Description: String
        var id = UUID()
    }
    struct Accessory{
        var ImageOfAccessory: UIImage
        var Name: String
        var Price: Float
        var Description: String
        var id = UUID()
    }
    struct Baby{
        var Base: BabyBase
        var IQ: Int
        var EyeColor: EyeColor
        var SkinColor: SkinColor
        var Height: Float
        var Thiccnes: Float
        var Traits: [String]
        var TotalPrice: Float
        var ProjectedIncome: Float
        var id = UUID()
    }
    struct Order{
        var OrderedBaby: Baby
        var Financing: Financing
        var Status: Status
        var AdditionalAccessories: [Accessory]
        var id = UUID()
    }
    struct User{
        var name: String
        var SocialCredit: Float
        var Location: String
        var Bio: String
        var ProfilePicture: UIImage
        var BabiesInCart: [Baby]
        var BabiesOrdered: [Order]
        var id = UUID()
    }
    
    enum EyeColor: String {
        case blue = "blue", black = "black", gold = "gold", brown = "brown", green = "green", purple = "purple", ordering = "ordering"
        var description: String {
            return self.rawValue
        }
    }
    
    enum SkinColor: String {
        case white, brown, tan, black, red, blue, ordering
    }
    
    enum Financing: String {
        case loan, credit, debit, cash, ordering
    }
    
    enum Status: String {
        case paid, none, partiallyPaid, ordering, delivery
    }
    
}
