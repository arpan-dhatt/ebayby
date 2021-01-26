//
//  ViewModel.swift
//  ebayby
//
//  Created by user175571 on 1/16/21.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var model: InfoModel = InfoModel()
    
    //Constants
    let PrimaryColor = Color.init(red: 66/255, green: 165/255, blue: 245/255)
    let SecondaryColor = Color.init(red: 126/255, green: 87/255, blue: 194/255)
    let TertiaryColor = Color.init(red: 77/255, green: 182/255, blue: 172/255)
    
    //BabyBase Infortion
    @Published var AllBases: Array<InfoModel.BabyBase>  = [
        .init(NameOfCeleb: "Vivek", ImageOfCeleb: UIImage(named: "divine")!, BasePrice: 50, Description:"Perfection Taken Physical Form"),
        .init(NameOfCeleb: "Isabel", ImageOfCeleb: UIImage(named: "hispanic")!, BasePrice: 10, Description:"Consists of Largely Hispanic Geneology"),
        .init(NameOfCeleb: "Megamind", ImageOfCeleb: UIImage(named: "megamind")!, BasePrice: 40, Description:"The Brain is Strong in This One"),
        .init(NameOfCeleb: "Nandu", ImageOfCeleb: UIImage(named: "indian")!, BasePrice: 5, Description:"Consists of Largely Indian Geneology"),
        .init(NameOfCeleb: "Hubert", ImageOfCeleb: UIImage(named: "japaneseboy")!, BasePrice: 5, Description:"Consists of Largely Japanese Geneology"),
        .init(NameOfCeleb: "Emma", ImageOfCeleb: UIImage(named: "japanesegirl")!, BasePrice: 5, Description:"Consists of Largely Japanese Geneology")
    ]
    @Published var DealBases: Array<InfoModel.BabyBase>  = [
        .init(NameOfCeleb: "Hubert", ImageOfCeleb: UIImage(named: "japaneseboy")!, BasePrice: 5, Description:"Consists of Largely Japanese Geneology"),
        .init(NameOfCeleb: "Emma", ImageOfCeleb: UIImage(named: "japanesegirl")!, BasePrice: 5, Description:"Consists of Largely Japanese Geneology"),
        .init(NameOfCeleb: "Vivek", ImageOfCeleb: UIImage(named: "divine")!, BasePrice: 50, Description:"Perfection Taken Physical Form"),
        .init(NameOfCeleb: "Isabel", ImageOfCeleb: UIImage(named: "hispanic")!, BasePrice: 10, Description:"Consists of Largely Hispanic Geneology"),
        .init(NameOfCeleb: "Megamind", ImageOfCeleb: UIImage(named: "megamind")!, BasePrice: 40, Description:"The Brain is Strong in This One"),
        .init(NameOfCeleb: "Nandu", ImageOfCeleb: UIImage(named: "indian")!, BasePrice: 5, Description:"Consists of Largely Indian Geneology"),
    ]
    @Published var PricyBases: Array<InfoModel.BabyBase>  = [
        .init(NameOfCeleb: "Kim", ImageOfCeleb: UIImage(named: "jong")!, BasePrice: 100, Description:"Descendent of God"),
        .init(NameOfCeleb: "Musk", ImageOfCeleb: UIImage(named: "musk")!, BasePrice: 120, Description:"Geneology Originating from Mars"),
        .init(NameOfCeleb: "Joe", ImageOfCeleb: UIImage(named: "whiteboy")!, BasePrice: 40, Description:"Geneology Originating in Western Europe"),
        .init(NameOfCeleb: "Biden", ImageOfCeleb: UIImage(named: "Biden")!, BasePrice: 120, Description:"Mysterious Geneology of Scranton"),
        .init(NameOfCeleb: "Nandu", ImageOfCeleb: UIImage(named: "indian")!, BasePrice: 1, Description:"Consists of Largely Indian Geneology"),
        .init(NameOfCeleb: "Megamind", ImageOfCeleb: UIImage(named: "megamind")!, BasePrice: 1, Description:"The Brain is Strong in This One"),
        .init(NameOfCeleb: "Hubert", ImageOfCeleb: UIImage(named: "japaneseboy")!, BasePrice: 1, Description:"Consists of Largely Japanese Geneology"),
        .init(NameOfCeleb: "Emma", ImageOfCeleb: UIImage(named: "japanesegirl")!, BasePrice: 1, Description:"Consists of Largely Japanese Geneology")
    ]
    @Published var CheapBases: Array<InfoModel.BabyBase>  = [
        .init(NameOfCeleb: "Nandu", ImageOfCeleb: UIImage(named: "indian")!, BasePrice: 5, Description:"Consists of Largely Indian Geneology"),
        .init(NameOfCeleb: "Vivek", ImageOfCeleb: UIImage(named: "divine")!, BasePrice: 50, Description:"Perfection Taken Physical Form"),
        .init(NameOfCeleb: "Isabel", ImageOfCeleb: UIImage(named: "hispanic")!, BasePrice: 1, Description:"Consists of Largely Hispanic Geneology"),
        .init(NameOfCeleb: "Megamind", ImageOfCeleb: UIImage(named: "megamind")!, BasePrice: 1, Description:"The Brain is Strong in This One"),
        .init(NameOfCeleb: "Hubert", ImageOfCeleb: UIImage(named: "japaneseboy")!, BasePrice: 1, Description:"Consists of Largely Japanese Geneology"),
        .init(NameOfCeleb: "Emma", ImageOfCeleb: UIImage(named: "japanesegirl")!, BasePrice: 1, Description:"Consists of Largely Japanese Geneology")
    ]
    @Published var FeaturedArticles: Array<InfoModel.Article> = [
        .init(Title: "Make a Healthy Baby with One Simple Trick!", Image: UIImage(named: "article1")!, Subtitle: "Order it from us! Don’t risk it on your own!", Description: """
A lot of stuff can go wrong when making a baby and parents have to live with those consequences their whole lives. If your baby is born with physical defects they can be bullied at school. If your baby is born with mental defects, they will never reach their full potential. There’s a simple way to prevent any of these things from happening, and that’s by making a baby through our platform.

We offer more than just safety and assurance, we offer a full suite of customization for your child. At the tap of a screen, you can assure yourself that your child won’t be afflicted with genetic disorders. You can assure yourself the baby you’ll get is the one you want.

There are many options to choose from, be it eye color, skin color, height, thiccness, and more. We offer even more advanced options such as IQ. We even go a step further and offer our famed ChariCare+ to replace your baby in case of any issues. You can also select accessories for your child to quick-start their development.
""", ForegroundColor: Color.white),
        .init(Title: "A Story of Success", Image: UIImage(named: "article2")!, Subtitle: "See how John succeeded when others thought he couldn’t, but we did.", Description: "akldafda;fl  akdf   akldfj a lkfda ok adlkf a sadf lkasdj fa  lksad fkl;as alk;dfj alklask;d lkasd jflasd lka;sdf as f;alsd fas jl;aslk ffas; l as;ldf jaof lsa skad l;as dflkas ;lla fioejgahsdklgf;hyauoe aksdfj iosajf kasldk oea; sadfo kaoejdf aksldfu waeo ksdfaj ioasp alk jdsafik n lkds klfasjd k", ForegroundColor: Color.black),
        .init(Title: "Perils of Procreation", Image: UIImage(named: "article3")!, Subtitle: "There is no greater pain than to see your child suffer", Description: "akldafda;fl  akdf   akldfj a lkfda ok adlkf a sadf lkasdj fa  lksad fkl;as alk;dfj alklask;d lkasd jflasd lka;sdf as f;alsd fas jl;aslk ffas; l as;ldf jaof lsa skad l;as dflkas ;lla fioejgahsdklgf;hyauoe aksdfj iosajf kasldk oea; sadfo kaoejdf aksldfu waeo ksdfaj ioasp alk jdsafik n lkds klfasjd k", ForegroundColor: Color.white),
    ]
    
    //Transistion Variables
    @Published var page = "home"
    @Published var currentOrderView = "Preview"
    @Published var selectedHomeTab: HomeView.Tab = .forYou
    @Published var currentOrder: InfoModel.Order = InfoModel.Order.init(OrderedBaby: .init(Base: .init(NameOfCeleb: "Error", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 0, Description: "Error"), IQ: 80, EyeColor: .ordering, SkinColor: .ordering, Height: 150, Thiccnes: 0, Traits: [], TotalPrice: 0, ProjectedIncome: 0), Financing: .ordering, Status: .ordering, AdditionalAccessories: [])
    @Published var currentBase: InfoModel.BabyBase = InfoModel.BabyBase.init(NameOfCeleb: "Error", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 0, Description: "error")
    @Published var allOrders: Array<InfoModel.Order> = [
    ]
    
    //colors
    @Published var colors: [Color] = [
        Color.blue,
        Color.green,
        Color.purple,
        Color.red,
        Color.orange,
    ]
    
    //User
    @Published var user: InfoModel.User = InfoModel.User.init(name: "Rishik", SocialCredit: 1, Location: "Dallas", Bio: "Hello! My name is Rishik and I love doing debate. I was recently deferred from Yale.", ProfilePicture: UIImage(named: "Donlad")!, BabiesInCart: [], BabiesOrdered: [])
    
}
