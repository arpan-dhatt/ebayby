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
                            coolTitleLight(text: "Ordering")
                            ForEach(model.allOrders, id: \.id){ order in
                                if order.Status == .delivery {
                                    deliveryCard(model: self.model, card:order).padding().shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                }
                            }
                        }
                        VStack{
                            coolTitleLight(text: "In Transit")
                            ForEach(model.allOrders, id: \.id){ order in
                                if order.Status == .ordering {
                                    deliveryCard(model: self.model, card:order).padding().shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                }
                            }
                        }
                        VStack{
                            coolTitleLight(text: "Delivered")
                            ForEach(model.allOrders, id: \.id){ order in
                                if order.Status == .paid || order.Status == .partiallyPaid {
                                    deliveryCard(model: self.model, card:order).padding().shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct deliveryCard: View {
    @ObservedObject var model: ViewModel
    @Namespace var cardspace
    @State private var expanded: Bool = false
    var card: InfoModel.Order
    
    var body: some View {
            ZStack{
                VStack {
                    if !expanded {
                        HStack{
                                Image(uiImage: card.OrderedBaby.Base.ImageOfCeleb).resizable().frame(width:100, height: 100).aspectRatio(contentMode: .fit).clipShape(Circle()).shadow(radius: 10).padding()
                                VStack{
                                    Text(card.OrderedBaby.Base.NameOfCeleb).font(.system(size: 28, weight: .bold)).foregroundColor(Color.white).matchedGeometryEffect(id: "name", in: cardspace)
                                    Text("Delivery Status: "+card.Status.rawValue.uppercased()).font(.caption)
                                    Text("Payment Method: "+card.Financing.rawValue.uppercased()).font(.caption)
                                }.padding(.trailing)
                        }
                    }
                    else {
                        HStack{
                                Image(uiImage: card.OrderedBaby.Base.ImageOfCeleb).resizable().frame(width:100, height: 100).aspectRatio(contentMode: .fit).clipShape(Circle()).shadow(radius: 10).padding()
                            VStack(spacing: 20){
                                Text(card.OrderedBaby.Base.NameOfCeleb).font(.system(size: 28, weight: .bold)).foregroundColor(Color.white).matchedGeometryEffect(id: "name", in: cardspace)
                                    Text("Delivery Status: "+card.Status.rawValue.uppercased()).font(.caption).padding(.trailing).matchedGeometryEffect(id: "delivery status", in: cardspace)
                            }
                        }
                        HStack {
                            Image(systemName: "square.and.pencil").font(.system(size: 24, weight: .bold)).foregroundColor(Color.white)
                            Text("IQ: ")
                            Spacer()
                            Text("\(card.OrderedBaby.IQ)")
                        }
                        HStack {
                            Image(systemName: "ruler").font(.system(size: 18, weight: .bold)).foregroundColor(Color.white)
                            Text("Height: ")
                            Spacer()
                            Text("\(Int(card.OrderedBaby.Height))cm")
                        }
                        HStack {
                            Image(systemName: "pencil.tip.crop.circle.badge.plus").font(.system(size: 20, weight: .bold)).foregroundColor(Color.white)
                            Text("Skin Color: ")
                            Spacer()
                            Text("\(card.OrderedBaby.SkinColor.rawValue.uppercased())")
                        }
                        HStack {
                            Image(systemName: "eye.fill").font(.system(size: 18, weight: .bold)).foregroundColor(Color.white)
                            Text("Eye Color: ")
                            Spacer()
                            Text("\(card.OrderedBaby.EyeColor.rawValue.uppercased())")
                        }
                        HStack {
                            Image(systemName: "ruler").font(.system(size: 18, weight: .bold)).foregroundColor(Color.white)
                            Text("Thiccness: ")
                            Spacer()
                            Text("\(Int(card.OrderedBaby.Thiccnes))%")
                        }
                        Spacer()
                        HStack {
                            Text("Payment Method: "+card.Financing.rawValue.uppercased()).font(.caption).matchedGeometryEffect(id: "payment method", in: cardspace)
                            Spacer()
                            Text("$\(Int(card.OrderedBaby.TotalPrice))")
                        }

                    }
                }.padding()
                .frame(width: UIScreen.main.bounds.width-30).background(Color.black).foregroundColor(Color.white).cornerRadius(10.0).matchedGeometryEffect(id: "card", in: cardspace).onTapGesture {
                    withAnimation {
                        expanded.toggle()
                    }
                }
            }
        }
//        ZStack{
//            VStack{
//                HStack{
//                    Image(uiImage: card.OrderedBaby.Base.ImageOfCeleb).resizable().frame(width:100, height: 100).aspectRatio(contentMode: .fit).clipShape(Circle()).shadow(radius: 10).padding()
//                    VStack{
//                        Text(card.OrderedBaby.Base.NameOfCeleb).font(.system(size: 28, weight: .bold)).foregroundColor(Color.white)
//                        HStack{
//                            VStack(alignment: .leading){
//                                Text("IQ: "+String(card.OrderedBaby.IQ))
//                                Text("Eye Color: "+card.OrderedBaby.EyeColor.rawValue)
//                            }
//
//                            VStack(alignment: .leading){
//                                Text("Height: "+String(card.OrderedBaby.Height))
//                                Text("Skin Color: "+card.OrderedBaby.SkinColor.rawValue)
//
//                            }
//                        }.font(.caption2).padding(.top)
//                    }
//                }
//                HStack{
//                    VStack(alignment: .leading){
//                        Text("Financing: "+card.Financing.rawValue)
//                        Text("Status: "+card.Status.rawValue)
//                        Spacer()
//                    }.padding([.leading,.top,.bottom]).font(.callout)
//
//                    VStack(alignment: .leading){
//                        Text("Total Price: $"+String(card.OrderedBaby.TotalPrice))
//                    }.padding(.trailing).font(.footnote)
//                }
//            }.background(Color.black).foregroundColor(Color.white).cornerRadius(10.0).matchedGeometryEffect(id: "card", in: cardspace).onTapGesture {
//                expanded.toggle()
//            }
//        }
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
