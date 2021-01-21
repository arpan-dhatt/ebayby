//
//  OrderPortal.swift
//  ebayby
//
//  Created by user175571 on 1/20/21.
//

import SwiftUI

struct OrderPortal: View {
    @ObservedObject var model: ViewModel
    
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    coolTitle(text: "Your Babies", image: "person.circle")
                    
                    if model.allOrders.count == 0{
                        VStack{
                            Spacer()
                            Text("You Have No Children").font(.system(size: 28, weight: .light)).foregroundColor(Color.black).padding()
                            Text("You Have No Purpose").font(.system(size: 18, weight: .ultraLight)).foregroundColor(Color.black).padding()
                            Text("- President Bethi").font(.system(size: 14, weight: .light)).foregroundColor(Color.black).padding()
                            Spacer()
                        }
                    }
                    else{
                        VStack{
                            coolTitleLight(text: "In Delivery")
                            deliveryCard(model: self.model, card: model.allOrders[0])
                        }
                        VStack{
                            coolTitleLight(text: "In Creation")
                        }
                        VStack{
                            coolTitleLight(text: "In Delivery")
                        }
                    }
                }
            }
        }
    }
}

struct deliveryCard: View {
    @ObservedObject var model: ViewModel
    var card: InfoModel.Order
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Image(uiImage: card.OrderedBaby.Base.ImageOfCeleb).resizable().frame(width:100, height: 100).aspectRatio(contentMode: .fit).clipShape(Circle()).shadow(radius: 10).padding()
                    VStack{
                        Text(card.OrderedBaby.Base.NameOfCeleb).font(.system(size: 28, weight: .bold)).foregroundColor(Color.black)
                        HStack{
                            VStack(alignment: .leading){
                                Text("IQ: "+String(card.OrderedBaby.IQ))
                                Text("Eye Color: "+card.OrderedBaby.EyeColor.rawValue)
                            }
                            Spacer()
                            VStack(alignment: .leading){
                                Text("Height: "+String(card.OrderedBaby.Height))
                                Text("Skin Color: "+card.OrderedBaby.SkinColor.rawValue)
                                
                            }
                        }.font(.caption2).padding(.top)
                    }
                }
                HStack{
                    VStack(alignment: .leading){
                        Text("Financing: "+card.Financing.rawValue)
                        Text("Status: "+card.Status.rawValue)
                        Spacer()
                    }.padding().font(.headline)
                    
                    VStack(alignment: .leading){
                        Text("Total Price: $"+String(card.OrderedBaby.TotalPrice))
                        Text("Projected Income: $"+String(card.OrderedBaby.ProjectedIncome))
                        Text("Net Benefit: $"+String(card.OrderedBaby.TotalPrice - card.OrderedBaby.ProjectedIncome))
                    }.font(.footnote)
                }
            }.padding()
        }
    }
}

struct coolTitle: View {
    var text: String
    var image: String
    
    var body: some View {
        HStack{
            Text(text).font(.system(size: 28, weight: .bold)).foregroundColor(Color.black).padding()
            Spacer()
            Image(systemName: image).font(.system(size: 28, weight: .bold)).foregroundColor(Color.black).padding()
        }
    }
}

struct coolTitleLight: View {
    var text: String
    
    var body: some View {
        HStack{
            Text(text).font(.system(size: 24, weight: .light)).foregroundColor(Color.black).padding()
            Spacer()
        }
    }
}


struct OrderPortal_Previews: PreviewProvider {
    static var previews: some View {
        OrderPortal(model: ViewModel())
    }
}
