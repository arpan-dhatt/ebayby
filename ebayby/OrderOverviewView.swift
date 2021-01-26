//
//  OrderOverviewView.swift
//  ebayby
//
//  Created by user175571 on 1/21/21.
//

import SwiftUI

struct OrderOverviewView: View {
    @ObservedObject var model: ViewModel
    var orderspace: Namespace.ID
    
    @State var paymentOptions = [
        (InfoModel.Financing.cash, Color.green, false),
        (InfoModel.Financing.credit, Color.blue, false),
        (InfoModel.Financing.debit, Color.orange, false),
        (InfoModel.Financing.loan, Color.purple, false),
        (InfoModel.Financing.crypto, Color.pink, false),
    ]
    
    var body: some View {
        ZStack{

                VStack{
                    Spacer()
                    VStack{
                        ScrollView{
                            VStack(alignment:.leading) {
                                coolTitleLight(text: model.user.name+", Ready For A New Life?").padding(.bottom, -17.5)
                                Text("*You're Almost There :)").font(.caption).padding(.leading)
                                
                                coolTitle(text: "Payment Method", image: "creditcard")
                                VStack {
                                    ForEach((0..<5), id: \.self) {
                                        SelectionBoxPayment(model: self.model, financingOptions: $paymentOptions, optionIndex: $0)
                                    }
                                }.padding()
                                VStack(alignment: .leading){
                                    Text("*Don't Worry, We Already Have Your Payment Information!").font(.caption).padding(.leading)
                                coolTitle(text: "Your Baby", image: "heart.circle")
                                }
                                VStack{
                                HStack{
                                    Image(uiImage: model.currentOrder.OrderedBaby.Base.ImageOfCeleb).resizable().frame(width:150, height: 150).aspectRatio(contentMode: .fit).clipShape(Circle()).shadow(radius: 10).padding()
                                    Spacer()
                                    VStack(spacing: 20){
                                        Text(model.currentOrder.OrderedBaby.Base.NameOfCeleb).font(.system(size: 28, weight: .bold)).foregroundColor(Color.white)
                                    }
                                }
                                HStack {
                                    Image(systemName: "square.and.pencil").font(.system(size: 24, weight: .bold)).foregroundColor(Color.white)
                                    Text("IQ: ")
                                    Spacer()
                                    Text("\(model.currentOrder.OrderedBaby.IQ)")
                                }
                                HStack {
                                    Image(systemName: "ruler").font(.system(size: 18, weight: .bold)).foregroundColor(Color.white)
                                    Text("Height: ")
                                    Spacer()
                                    Text("\(Int(model.currentOrder.OrderedBaby.Height))cm")
                                }
                                HStack {
                                    Image(systemName: "pencil.tip.crop.circle.badge.plus").font(.system(size: 20, weight: .bold)).foregroundColor(Color.white)
                                    Text("Skin Color: ")
                                    Spacer()
                                    Text("\(model.currentOrder.OrderedBaby.SkinColor.rawValue.uppercased())")
                                }
                                HStack {
                                    Image(systemName: "eye.fill").font(.system(size: 18, weight: .bold)).foregroundColor(Color.white)
                                    Text("Eye Color: ")
                                    Spacer()
                                    Text("\(model.currentOrder.OrderedBaby.EyeColor.rawValue.uppercased())")
                                }
                                HStack {
                                    Image(systemName: "ruler").font(.system(size: 18, weight: .bold)).foregroundColor(Color.white)
                                    Text("Thiccness: ")
                                    Spacer()
                                    Text("\(Int(model.currentOrder.OrderedBaby.Thiccnes))%")
                                }
                                
                                HStack {
                                    Text("Payment Method: "+model.currentOrder.Financing.rawValue.uppercased()).font(.caption)
                                    Spacer()
                                    Text("$\(Int(model.currentOrder.OrderedBaby.TotalPrice))")
                                }
                                    
                                
                                }.padding().frame(width: UIScreen.main.bounds.width-30).background(Color.black).foregroundColor(Color.white).cornerRadius(10.0).padding(.leading)
                            coolTitleLight(text: "NEW: Free Shipping In 9-12 Weeks With ChariPrime!")
                    
                    Spacer()
                                Divider().padding()
                            
                    VStack{
                        HStack{
                            HStack {
                                Spacer()
                                Button(action: {
                                    withAnimation {
                                        model.currentOrderView = "Accessory"
                                    }
                                }){
                                    Image(systemName: "arrow.left").font(.system(size: 24, weight: .light))
                                    Text("Back").font(.system(size: 18, weight: .light)).padding()
                                }.frame(width: 150.0).background(model.TertiaryColor).cornerRadius(10.0).shadow(radius: 10.0).foregroundColor(Color.white)
                                Spacer()
                            }
                            HStack {
                                Spacer()
                                Button(action: {

                                        model.page = "home"
                                        model.currentOrderView = "Preview"
                                        model.allOrders.append(model.currentOrder)
                                        model.currentOrder = InfoModel.Order.init(OrderedBaby: .init(Base: .init(NameOfCeleb: "Error", ImageOfCeleb: UIImage(named: "Donlad")!, BasePrice: 0, Description: "Error"), IQ: 0, EyeColor: .ordering, SkinColor: .ordering, Height: 0, Thiccnes: 0, Traits: [], TotalPrice: 0, ProjectedIncome: 0), Financing: .ordering, Status: .ordering, AdditionalAccessories: [])
                                    
                                }){
                                    Text("Order").font(.system(size: 18, weight: .light)).padding()
                                    Image(systemName: "arrow.right").font(.system(size: 24, weight: .light))
                                }.frame(width: 150.0).background(model.SecondaryColor).cornerRadius(10.0).shadow(radius: 10.0).foregroundColor(Color.white)
                                Spacer()
                            }
                        }
                    }
                            }
                        }
                    }
                }
            }
        }
    }

struct SelectionBoxPayment: View {
    @ObservedObject var model: ViewModel
    @Binding var financingOptions: Array<(InfoModel.Financing, Color, Bool)>
    var optionIndex: Int
    
    var body: some View {
        VStack{
            if financingOptions[optionIndex].2 {
                Text(financingOptions[optionIndex].0.rawValue.uppercased()).padding().frame(width: UIScreen.main.bounds.width-30, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(financingOptions[optionIndex].1).overlay(RoundedRectangle(cornerRadius:5).stroke(financingOptions[optionIndex].1, lineWidth: 4)).transition(.opacity)
            }
            else {
                Text(financingOptions[optionIndex].0.rawValue.uppercased()).padding().frame(width: UIScreen.main.bounds.width-30, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(Color.gray).overlay(RoundedRectangle(cornerRadius:5).stroke(Color.gray, lineWidth: 4)).transition(.opacity)
            }
            
        }.onTapGesture {
            for i in 0..<financingOptions.count {
                financingOptions[i].2 = false
                model.currentOrder.Financing = financingOptions[optionIndex].0
            }
            withAnimation {
                financingOptions[optionIndex].2 = true
            }
            model.currentOrder.Status = .delivery
            
        }
    }
}

struct OrderOverviewView_Previews: PreviewProvider {
    @Namespace static var placeholder
    
    static var previews: some View {
        OrderOverviewView(model: ViewModel(), orderspace: placeholder)
    }
}
