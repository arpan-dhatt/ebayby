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
    }
    struct Article{
        var Title: String
        var Image: UIImage
        var Subtitle: String
        var Description: String
    }
    struct Accessory{
        var ImageOfAccessory: UIImage
        var Name: String
        var Price: Float
        var Description: String
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
    }
    struct Order{
        var OrderedBaby: Baby
        var Financing: Financing
        var Status: Status
        var AdditionalAccessories: [Accessory]
    }
    struct User{
        var name: String
        var SocialCredit: Float
        var Location: String
        var Bio: String
        var ProfilePicture: UIImage
        var BabiesInCart: [Baby]
        var BabiesOrdered: [Order]
    }
    
    enum EyeColor{
        case blue, black, white, brown, green
    }
    
    enum SkinColor {
        case white, brown, tan, black, red, blue
    }
    
    enum Financing {
        case loan, credit, debit, cash
    }
    
    enum Status {
        case paid, none, partiallyPaid
    }
    
    
    
    
}
