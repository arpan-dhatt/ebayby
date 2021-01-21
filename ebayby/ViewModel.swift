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
        .init(NameOfCeleb: "Donnald", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Biden", ImageOfCeleb: UIImage(named: "Biden")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald2", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald3", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald4", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald5", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald6", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald7", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald8", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
    ]
    @Published var DealBases: Array<InfoModel.BabyBase>  = [
        .init(NameOfCeleb: "Donnald", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald1", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald2", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald3", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald4", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald5", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald6", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald7", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald8", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
    ]
    @Published var PricyBases: Array<InfoModel.BabyBase>  = [
        .init(NameOfCeleb: "Donnald", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald1", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald2", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald3", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald4", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald5", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald6", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald7", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald8", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
    ]
    @Published var CheapBases: Array<InfoModel.BabyBase>  = [
        .init(NameOfCeleb: "Donnald", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald1", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald2", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald3", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald4", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald5", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald6", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald7", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
        .init(NameOfCeleb: "Donnald8", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 1, Description:"nulllll"),
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
    
    //User
    @Published var user: InfoModel.User = InfoModel.User.init(name: "Rishik", SocialCredit: 1, Location: "Dallas", Bio: "El Presidente", ProfilePicture: UIImage(named: "Donlad")!, BabiesInCart: [], BabiesOrdered: [])
    
}
