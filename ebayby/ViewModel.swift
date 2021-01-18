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
    let PrimaryColor = Color.init(red: 238/255, green: 174/255, blue: 202/255)
    let SecondaryColor = Color.init(red: 238/255, green: 174/255, blue: 202/255)
    
    //Transistion Variables
    @Published var page = "login"
    @Published var currentOrderView = "Overview"
    @Published var selectedHomeTab: HomeView.Tab = .forYou
    
    //User
    @Published var user: InfoModel.User = InfoModel.User.init(name: "Rishik", SocialCredit: 1, Location: "Dallas", Bio: "El Presidente", ProfilePicture: UIImage(named: "Donlad")!, BabiesInCart: [], BabiesOrdered: [])
    
    
    //BabyBase Infortion
    @Published var AllBases: Array<InfoModel.BabyBase> = [
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
}
