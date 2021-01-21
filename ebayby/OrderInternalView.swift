//
//  OrderInternalView.swift
//  ebayby
//
//  Created by user175571 on 1/20/21.
//

import SwiftUI

struct OrderInternalView: View {
    @ObservedObject var model: ViewModel
    
    var body: some View {
        ZStack{
            ScrollView{
            VStack(alignment: .center){
               
                Spacer()
                Text(String(model.currentOrder.OrderedBaby.Base.NameOfCeleb)).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                VStack{
                    HStack{
                        Text("Name").font(.system(size: 28, weight: .bold)).foregroundColor(Color.black).padding()
                        Spacer()
                        Image(systemName: "square.and.pencil").font(.system(size: 28, weight: .bold)).foregroundColor(Color.black).padding()
                    }
                    TextField("Enter A Name For Your Baby", text:$model.currentOrder.OrderedBaby.Base.NameOfCeleb).textFieldStyle(RoundedBorderTextFieldStyle()).padding().shadow(radius: 2.5)
                }
                    VStack{
                        HStack{
                            Text("Final Height").font(.system(size: 28, weight: .bold)).foregroundColor(Color.black).padding()
                            Spacer()
                            Image(systemName: "ruler").font(.system(size: 28, weight: .bold)).foregroundColor(Color.black).padding()
                        }
                        Slider(value: $model.currentOrder.OrderedBaby.Height, in: 100...200, step: 1).padding().shadow(radius: 2.5)
                        Text(String(model.currentOrder.OrderedBaby.Height)+" cm").font(.system(size: 28, weight: .light)).foregroundColor(Color.black)
                    }
                VStack{
                    HStack{
                        VStack{
                        Text("Thiccness").font(.system(size: 28, weight: .bold)).foregroundColor(Color.black)
                            Text("33% is Average")
                        }.padding()
                        Spacer()
                        Image(systemName: "ruler").font(.system(size: 28, weight: .bold)).foregroundColor(Color.black).padding()
                    }

                    Slider(value: $model.currentOrder.OrderedBaby.Thiccnes, in: 0...100, step: 1).padding().shadow(radius: 2.5)
                    Text(String(model.currentOrder.OrderedBaby.Thiccnes)+"%").font(.system(size: 28, weight: .light)).foregroundColor(Color.black)
                }

                Divider()
                Spacer()
               
                }
                HStack{
                    HStack {
                        Spacer()
                        Button(action: {
                            model.currentOrderView = "Preview"
                        }){
                            Image(systemName: "arrow.left").font(.system(size: 24, weight: .light))
                            Text("Back").font(.system(size: 18, weight: .light)).padding()
                        }.frame(width: 150.0).background(model.TertiaryColor).cornerRadius(10.0).shadow(radius: 10.0).foregroundColor(Color.white)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Button(action: {
                            model.currentOrderView = "Internal"
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

struct OrderInternalView_Previews: PreviewProvider {
    static var previews: some View {
        OrderInternalView(model: ViewModel())
    }
}
