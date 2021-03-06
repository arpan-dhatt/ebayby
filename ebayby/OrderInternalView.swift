//
//  OrderInternalView.swift
//  ebayby
//
//  Created by user175571 on 1/20/21.
//

import SwiftUI

struct OrderInternalView: View {
    @ObservedObject var model: ViewModel
    var orderspace: Namespace.ID
    
    @State var traits = [
        ("Agile",5200.0, false),
        ("Dumb",-13300.0, false),
        ("Quirky",16500.0, false),
        ("Capitalistic",-132000.0, false),
        ("Socialistic",165000.0, false),
        ("Insecure",-16750.0, false),
        ("Egotistical",-199800.0, false),
        ("Hardworking",1444050.0, false),
        ("Resourceful",120500.0, false),
        ("Imaginative",1500500.0, false),
        ("Individualistic",656500.0, false),
        ("Perfectionist",540500.0, false),
        ("Hopeful",4005000.0, false),
        ("Funny",9509000.0, false),
        ("Sophisticated",7545000.0, false),
        ("Lazy",-50000.0, false),
        ("Materialistic",-850000.0, false)
    ]
    
    var body: some View {
        ZStack{
            ScrollView{
            VStack(alignment: .center){
               
                Spacer()
                Text(model.currentOrder.OrderedBaby.Base.NameOfCeleb).font(.largeTitle).matchedGeometryEffect(id: "NameOfCeleb", in: orderspace)
                    VStack{
                        HStack{
                            Text("IQ").font(.system(size: 28, weight: .bold)).foregroundColor(Color.black).padding()
                            Spacer()
                            Image(systemName: "paintbrush").font(.system(size: 28, weight: .bold)).foregroundColor(Color.black).padding()
                        }
                        Slider(value: $model.currentOrder.OrderedBaby.IQ, in: 50...180, step: 1).padding().shadow(radius: 2.5)
                        Text(String(model.currentOrder.OrderedBaby.IQ)).font(.system(size: 28, weight: .light)).foregroundColor(Color.black)
                    }
                VStack{
                    HStack{
                        VStack{
                        Text("Personality Traits").font(.system(size: 28, weight: .bold)).foregroundColor(Color.black)
                        }.padding()
                        Spacer()
                        Image(systemName: "hare.fill").font(.system(size: 28, weight: .bold)).foregroundColor(Color.black).padding()
                    }
                    VStack{
                        ForEach((0..<traits.count), id: \.self) {
                                personalityTraitsBox(model: self.model, traitOptions: $traits, optionsIndex: $0)
                            }
                    }
                    
                }

                Divider()
                Spacer()
               
                }
                HStack{
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                model.currentOrderView = "Physical"
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
                                model.currentOrderView = "Accessory"
                            }
                        }){
                            Text("Next").font(.system(size: 18, weight: .light)).padding()
                            Image(systemName: "arrow.right").font(.system(size: 24, weight: .light))
                        }.frame(width: 150.0).background(model.TertiaryColor).cornerRadius(10.0).shadow(radius: 10.0).foregroundColor(Color.white)
                        Spacer()
                    }
                }
            }
        }
    }
}

struct personalityTraitsBox: View {
    @ObservedObject var model: ViewModel
    @Binding var traitOptions: Array<(String, Double, Bool)>
    var optionsIndex: Int
    @State var color: Color = Color.gray
    
    var body: some View {
        VStack{
            Text(traitOptions[optionsIndex].0)
            Text("$"+String(traitOptions[optionsIndex].1)).font(.caption2)
        }.padding().frame(width: UIScreen.main.bounds.width-30, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(color).overlay(RoundedRectangle(cornerRadius:5).stroke(color, lineWidth: 4)).transition(.opacity).onTapGesture {
            withAnimation {
                traitOptions[optionsIndex].2.toggle()
                if traitOptions[optionsIndex].2 {
                    model.currentOrder.OrderedBaby.Traits.append(traitOptions[optionsIndex].0)
                    self.color = Color.green
                    model.currentOrder.OrderedBaby.TotalPrice += Float(traitOptions[optionsIndex].1)
                }
                else{
                    self.color = Color.gray
                    model.currentOrder.OrderedBaby.TotalPrice -= Float(traitOptions[optionsIndex].1)
                    for val in 0..<model.currentOrder.OrderedBaby.Traits.count {
                        if traitOptions[optionsIndex].0 == model.currentOrder.OrderedBaby.Traits[val] {
                            model.currentOrder.OrderedBaby.Traits.remove(at: val)
                            break
                        }
                    }
                }
            }
    }
    
}
}

struct OrderInternalView_Previews: PreviewProvider {
    @Namespace static var placeholder
    
    static var previews: some View {
        OrderInternalView(model: ViewModel(), orderspace: placeholder)
    }
}
