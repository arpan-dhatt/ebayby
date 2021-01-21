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
        .init(NameOfCeleb: "Vivek", ImageOfCeleb: UIImage(named: "divine")!, BasePrice: 1, Description:"Perfection Taken Physical Form"),
        .init(NameOfCeleb: "Isabel", ImageOfCeleb: UIImage(named: "hispanic")!, BasePrice: 1, Description:"Consists of Largely Hispanic Geneology"),
        .init(NameOfCeleb: "Megamind", ImageOfCeleb: UIImage(named: "megamind")!, BasePrice: 1, Description:"The Brain is Strong in This One"),
        .init(NameOfCeleb: "Nandu", ImageOfCeleb: UIImage(named: "indian")!, BasePrice: 1, Description:"Consists of Largely Indian Geneology"),
        .init(NameOfCeleb: "Hubert", ImageOfCeleb: UIImage(named: "japaneseboy")!, BasePrice: 1, Description:"Consists of Largely Japanese Geneology"),
        .init(NameOfCeleb: "Emma", ImageOfCeleb: UIImage(named: "japanesegirl")!, BasePrice: 1, Description:"Consists of Largely Japanese Geneology")
    ]
    @Published var DealBases: Array<InfoModel.BabyBase>  = [
        .init(NameOfCeleb: "Hubert", ImageOfCeleb: UIImage(named: "japaneseboy")!, BasePrice: 1, Description:"Consists of Largely Japanese Geneology"),
        .init(NameOfCeleb: "Emma", ImageOfCeleb: UIImage(named: "japanesegirl")!, BasePrice: 1, Description:"Consists of Largely Japanese Geneology"),
        .init(NameOfCeleb: "Vivek", ImageOfCeleb: UIImage(named: "divine")!, BasePrice: 1, Description:"Perfection Taken Physical Form"),
        .init(NameOfCeleb: "Isabel", ImageOfCeleb: UIImage(named: "hispanic")!, BasePrice: 1, Description:"Consists of Largely Hispanic Geneology"),
        .init(NameOfCeleb: "Megamind", ImageOfCeleb: UIImage(named: "megamind")!, BasePrice: 1, Description:"The Brain is Strong in This One"),
        .init(NameOfCeleb: "Nandu", ImageOfCeleb: UIImage(named: "indian")!, BasePrice: 1, Description:"Consists of Largely Indian Geneology"),
    ]
    @Published var PricyBases: Array<InfoModel.BabyBase>  = [
        .init(NameOfCeleb: "Kim", ImageOfCeleb: UIImage(named: "jong")!, BasePrice: 1, Description:"Descendent of God"),
        .init(NameOfCeleb: "Musk", ImageOfCeleb: UIImage(named: "musk")!, BasePrice: 1, Description:"Geneology Originating from Mars"),
        .init(NameOfCeleb: "Joe", ImageOfCeleb: UIImage(named: "whiteboy")!, BasePrice: 1, Description:"Geneology Originating in Western Europe"),
        .init(NameOfCeleb: "Biden", ImageOfCeleb: UIImage(named: "Biden")!, BasePrice: 1, Description:"Mysterious Geneology of Scranton"),
        .init(NameOfCeleb: "Nandu", ImageOfCeleb: UIImage(named: "indian")!, BasePrice: 1, Description:"Consists of Largely Indian Geneology"),
        .init(NameOfCeleb: "Megamind", ImageOfCeleb: UIImage(named: "megamind")!, BasePrice: 1, Description:"The Brain is Strong in This One"),
        .init(NameOfCeleb: "Hubert", ImageOfCeleb: UIImage(named: "japaneseboy")!, BasePrice: 1, Description:"Consists of Largely Japanese Geneology"),
        .init(NameOfCeleb: "Emma", ImageOfCeleb: UIImage(named: "japanesegirl")!, BasePrice: 1, Description:"Consists of Largely Japanese Geneology")
    ]
    @Published var CheapBases: Array<InfoModel.BabyBase>  = [
        .init(NameOfCeleb: "Nandu", ImageOfCeleb: UIImage(named: "indian")!, BasePrice: 1, Description:"Consists of Largely Indian Geneology"),
        .init(NameOfCeleb: "Vivek", ImageOfCeleb: UIImage(named: "divine")!, BasePrice: 1, Description:"Perfection Taken Physical Form"),
        .init(NameOfCeleb: "Isabel", ImageOfCeleb: UIImage(named: "hispanic")!, BasePrice: 1, Description:"Consists of Largely Hispanic Geneology"),
        .init(NameOfCeleb: "Megamind", ImageOfCeleb: UIImage(named: "megamind")!, BasePrice: 1, Description:"The Brain is Strong in This One"),
        .init(NameOfCeleb: "Hubert", ImageOfCeleb: UIImage(named: "japaneseboy")!, BasePrice: 1, Description:"Consists of Largely Japanese Geneology"),
        .init(NameOfCeleb: "Emma", ImageOfCeleb: UIImage(named: "japanesegirl")!, BasePrice: 1, Description:"Consists of Largely Japanese Geneology")
    ]
    @Published var FeaturedArticles: Array<InfoModel.Article> = [
        .init(Title: "Hello You", Image: UIImage(named: "Donlad")!, Subtitle: "How Goes It?", Description: "akldafda;fl  akdf   akldfj a lkfda ok adlkf a sadf lkasdj fa  lksad fkl;as alk;dfj alklask;d lkasd jflasd lka;sdf as f;alsd fas jl;aslk ffas; l as;ldf jaof lsa skad l;as dflkas ;lla fioejgahsdklgf;hyauoe aksdfj iosajf kasldk oea; sadfo kaoejdf aksldfu waeo ksdfaj ioasp alk jdsafik n lkds klfasjd k"),
        .init(Title: "Hello You", Image: UIImage(named: "Donlad")!, Subtitle: "How Goes It?", Description: "akldafda;fl  akdf   akldfj a lkfda ok adlkf a sadf lkasdj fa  lksad fkl;as alk;dfj alklask;d lkasd jflasd lka;sdf as f;alsd fas jl;aslk ffas; l as;ldf jaof lsa skad l;as dflkas ;lla fioejgahsdklgf;hyauoe aksdfj iosajf kasldk oea; sadfo kaoejdf aksldfu waeo ksdfaj ioasp alk jdsafik n lkds klfasjd k"),
        .init(Title: "Hello You", Image: UIImage(named: "Donlad")!, Subtitle: "How Goes It?", Description: "akldafda;fl  akdf   akldfj a lkfda ok adlkf a sadf lkasdj fa  lksad fkl;as alk;dfj alklask;d lkasd jflasd lka;sdf as f;alsd fas jl;aslk ffas; l as;ldf jaof lsa skad l;as dflkas ;lla fioejgahsdklgf;hyauoe aksdfj iosajf kasldk oea; sadfo kaoejdf aksldfu waeo ksdfaj ioasp alk jdsafik n lkds klfasjd k"),
    ]
    @Published var ParentingTips: Array<InfoModel.Article> = [
        .init(Title: "Hello You", Image: UIImage(named: "Donlad")!, Subtitle: "How Goes It?", Description: "akldafda;fl  akdf   akldfj a lkfda ok adlkf a sadf lkasdj fa  lksad fkl;as alk;dfj alklask;d lkasd jflasd lka;sdf as f;alsd fas jl;aslk ffas; l as;ldf jaof lsa skad l;as dflkas ;lla fioejgahsdklgf;hyauoe aksdfj iosajf kasldk oea; sadfo kaoejdf aksldfu waeo ksdfaj ioasp alk jdsafik n lkds klfasjd k"),
        .init(Title: "Hello You", Image: UIImage(named: "Donlad")!, Subtitle: "How Goes It?", Description: "akldafda;fl  akdf   akldfj a lkfda ok adlkf a sadf lkasdj fa  lksad fkl;as alk;dfj alklask;d lkasd jflasd lka;sdf as f;alsd fas jl;aslk ffas; l as;ldf jaof lsa skad l;as dflkas ;lla fioejgahsdklgf;hyauoe aksdfj iosajf kasldk oea; sadfo kaoejdf aksldfu waeo ksdfaj ioasp alk jdsafik n lkds klfasjd k"),
        .init(Title: "Hello You", Image: UIImage(named: "Donlad")!, Subtitle: "How Goes It?", Description: "akldafda;fl  akdf   akldfj a lkfda ok adlkf a sadf lkasdj fa  lksad fkl;as alk;dfj alklask;d lkasd jflasd lka;sdf as f;alsd fas jl;aslk ffas; l as;ldf jaof lsa skad l;as dflkas ;lla fioejgahsdklgf;hyauoe aksdfj iosajf kasldk oea; sadfo kaoejdf aksldfu waeo ksdfaj ioasp alk jdsafik n lkds klfasjd k"),
    ]
    @Published var TopTens: Array<InfoModel.Article> = [
        .init(Title: "Hello You", Image: UIImage(named: "Donlad")!, Subtitle: "How Goes It?", Description: "akldafda;fl  akdf   akldfj a lkfda ok adlkf a sadf lkasdj fa  lksad fkl;as alk;dfj alklask;d lkasd jflasd lka;sdf as f;alsd fas jl;aslk ffas; l as;ldf jaof lsa skad l;as dflkas ;lla fioejgahsdklgf;hyauoe aksdfj iosajf kasldk oea; sadfo kaoejdf aksldfu waeo ksdfaj ioasp alk jdsafik n lkds klfasjd k"),
        .init(Title: "Hello You", Image: UIImage(named: "Donlad")!, Subtitle: "How Goes It?", Description: "akldafda;fl  akdf   akldfj a lkfda ok adlkf a sadf lkasdj fa  lksad fkl;as alk;dfj alklask;d lkasd jflasd lka;sdf as f;alsd fas jl;aslk ffas; l as;ldf jaof lsa skad l;as dflkas ;lla fioejgahsdklgf;hyauoe aksdfj iosajf kasldk oea; sadfo kaoejdf aksldfu waeo ksdfaj ioasp alk jdsafik n lkds klfasjd k"),
        .init(Title: "Hello You", Image: UIImage(named: "Donlad")!, Subtitle: "How Goes It?", Description: "akldafda;fl  akdf   akldfj a lkfda ok adlkf a sadf lkasdj fa  lksad fkl;as alk;dfj alklask;d lkasd jflasd lka;sdf as f;alsd fas jl;aslk ffas; l as;ldf jaof lsa skad l;as dflkas ;lla fioejgahsdklgf;hyauoe aksdfj iosajf kasldk oea; sadfo kaoejdf aksldfu waeo ksdfaj ioasp alk jdsafik n lkds klfasjd k"),
    ]
    
    //Transistion Variables
    @Published var page = "home"
    @Published var currentOrderView = "Physical"
    @Published var selectedHomeTab: HomeView.Tab = .forYou
    @Published var currentOrder: InfoModel.Order = InfoModel.Order.init(OrderedBaby: .init(Base: .init(NameOfCeleb: "Error", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 0, Description: "Error"), IQ: 0, EyeColor: .ordering, SkinColor: .ordering, Height: 0, Thiccnes: 0, Traits: [], TotalPrice: 0, ProjectedIncome: 0), Financing: .ordering, Status: .ordering, AdditionalAccessories: [])
    @Published var currentBase: InfoModel.BabyBase = InfoModel.BabyBase.init(NameOfCeleb: "Error", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 0, Description: "error")
    @Published var allOrders: Array<InfoModel.Order> = [
        InfoModel.Order.init(OrderedBaby: .init(Base: .init(NameOfCeleb: "Stephan", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 10, Description: "Rank 0"), IQ: 140, EyeColor: .blue, SkinColor: .brown, Height: 150, Thiccnes: 50, Traits: [], TotalPrice: 100000, ProjectedIncome: 100000), Financing: .cash, Status: .delivery, AdditionalAccessories: []),
        InfoModel.Order.init(OrderedBaby: .init(Base: .init(NameOfCeleb: "Stephan2", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 10, Description: "Rank 0.1"), IQ: 140, EyeColor: .blue, SkinColor: .brown, Height: 150, Thiccnes: 50, Traits: [], TotalPrice: 100000, ProjectedIncome: 100000), Financing: .credit, Status: .paid, AdditionalAccessories: []),
        InfoModel.Order.init(OrderedBaby: .init(Base: .init(NameOfCeleb: "Stephan3", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 10, Description: "Rank 0.01"), IQ: 140, EyeColor: .blue, SkinColor: .brown, Height: 150, Thiccnes: 50, Traits: [], TotalPrice: 100000, ProjectedIncome: 100000), Financing: .loan, Status: .ordering, AdditionalAccessories: [])
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
    @Published var user: InfoModel.User = InfoModel.User.init(name: "Rishik", SocialCredit: 1, Location: "Dallas", Bio: "El Presidente", ProfilePicture: UIImage(named: "Donlad")!, BabiesInCart: [], BabiesOrdered: [])
    
}
