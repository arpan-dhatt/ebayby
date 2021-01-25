//
//  OrderAccessoryView.swift
//  ebayby
//
//  Created by user175571 on 1/22/21.
//

import SwiftUI

struct OrderAccessoryView: View {
    @ObservedObject var model: ViewModel
    @State var chariCare = Color.white
    
    @State var Accessory1 = false
    
    var body: some View {
        VStack{
            ScrollView{
            VStack{
                coolTitle(text: "Accessories", image: "bag.fill.badge.plus")
                coolTitleLight(text: "ChariCare+")
                VStack(alignment:.leading){
                    Text("Replacement Baby Of Same Development Within 9-12  Weeks").font(.callout)
                    Text("Starting At Only $100,000").font(.headline)
                    Text("*Ends Once Baby is 6 Years Old").font(.caption2)
                    Text("**Replacement Baby Will Have No Previous Memories").font(.caption2)
                }.padding().background(chariCare).cornerRadius(10.0).shadow(radius: 10).onTapGesture {
                    withAnimation(){
                        if chariCare == Color.white{
                            chariCare = Color.green
                            model.currentOrder.AdditionalAccessories.append(.init(ImageOfAccessory: UIImage(named: "divine")!, Name: "ChariCare+", Price: 100000, Description: "Premier Protection Plan For Your Future"))
                            model.currentOrder.OrderedBaby.TotalPrice+=100000.0
                        }
                        else{
                            chariCare = Color.white
                            model.currentOrder.OrderedBaby.TotalPrice-=100000.0
                            for val in 0..<model.currentOrder.AdditionalAccessories.count {
                                if model.currentOrder.AdditionalAccessories[val].Name == "ChariCare+" {
                                    model.currentOrder.AdditionalAccessories.remove(at: val)
                                    break
                                }
                            }
                        }
                    }
                }
                coolTitleLight(text: "Additional Accessories")
                ScrollView(.horizontal){
                    HStack{
                        accessoryCard(model: self.model, name: "Flexy Bag", description: "Start Life Off in Style", image: UIImage(named: "divine")!, price: 100000, isSelected: $Accessory1).padding()
                        accessoryCard(model: self.model, name: "Self-cleaning Bib", description: "No mess for you to clean", image: UIImage(named: "divine")!, price: 100000, isSelected: $Accessory1).padding()
                        accessoryCard(model: self.model, name: "Pacific Pacifier", description: "Calm as the Pacific ocean", image: UIImage(named: "divine")!, price: 100000, isSelected: $Accessory1).padding()

                    }
                }
                Text("*Due to High Demand, Customers Are Limited to 1 Count Of Each Accessory").font(.caption).padding(.leading)
                Text("**Due to High Demand, Accessories Must Be Bought With A Baby").font(.caption).padding(.leading)
                
            }
        }
            VStack{

                Divider().padding()

                HStack{
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                model.currentOrderView = "Internal"
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
                            withAnimation {
                                model.currentOrderView = "Overview"
                            }
                        }){
                            Text("Checkout").font(.system(size: 18, weight: .light)).padding()
                            Image(systemName: "arrow.right").font(.system(size: 24, weight: .light))
                        }.frame(width: 150.0).background(model.SecondaryColor).cornerRadius(10.0).shadow(radius: 10.0).foregroundColor(Color.white)
                        Spacer()
                    }
                }
            }
        }
    }
}

struct accessoryCard: View {
    var model: ViewModel
    var name:String
    var description:String
    var image: UIImage
    var price: Int
    @Binding var isSelected: Bool
    @State var color: Color = Color.white
    
    var body: some View{
        VStack{

            Text(name).font(.headline)
            Text(description).font(.subheadline)
            Text("$"+String(price)+"+").padding([.bottom]).font(.title2)
            
            
        }.background(color).cornerRadius(10.0).shadow(radius: 10.0).onTapGesture {
            withAnimation(){
                isSelected.toggle()
                if isSelected{
                    color = Color.green
                    model.currentOrder.AdditionalAccessories.append(.init(ImageOfAccessory: image, Name: self.name, Price: Float(self.price), Description: self.description))
                    model.currentOrder.OrderedBaby.TotalPrice+=Float(self.price)
                }
                else{
                    color = Color.white
                    model.currentOrder.OrderedBaby.TotalPrice-=Float(self.price)
                    for val in 0..<model.currentOrder.AdditionalAccessories.count {
                        if model.currentOrder.AdditionalAccessories[val].Name == name {
                            model.currentOrder.AdditionalAccessories.remove(at: val)
                            break
                        }
                    }
                }
            }
        }
        
    }
}

struct OrderAccessoryView_Previews: PreviewProvider {
    static var previews: some View {
        OrderAccessoryView(model: ViewModel())
    }
}
