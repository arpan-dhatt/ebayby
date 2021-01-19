//
//  OrderView.swift
//  ebayby
//
//  Created by user175571 on 1/18/21.
//

import SwiftUI

struct OrderView: View {
    @ObservedObject var model: ViewModel
    
    var body: some View {
        if model.currentOrderView == "Preview"{
            OrderPreviewView(model: model)
        }
        if model.currentOrderView == "Physical"{
            OrderPreviewView(model: model)
        }
        if model.currentOrderView == "Internal"{
            OrderPreviewView(model: model)
        }
        if model.currentOrderView == "Overview"{
            OrderPreviewView(model: model)
        }
    }
}

struct OrderPreviewView: View {
    @ObservedObject var model: ViewModel
    
    var body: some View {
        ZStack{
            VStack(alignment: .center){
                Spacer()
                Text("Hello " + model.user.name).font(.largeTitle).padding()
                Text("You Have Selected "+model.currentBase.NameOfCeleb+" To Be The Base Of Your Child!").font(.headline).padding()
                Image(uiImage: model.currentBase.ImageOfCeleb).resizable().frame(width:250, height: 250).aspectRatio(contentMode: .fit).clipShape(Circle()).shadow(radius: 10).padding()
                Text(model.currentBase.NameOfCeleb).font(.largeTitle)
                Text(model.currentBase.Description).font(.title)
                Text("$"+String(model.currentBase.BasePrice)+"+").font(.headline).padding()
                Spacer()
                
                HStack{
                    HStack {
                        Spacer()
                        Button(action: {
                            model.page = "home"
                        }){
                            Text("Home").font(.system(size: 18, weight: .light)).padding()
                            Image(systemName: "house.fill").font(.system(size: 24, weight: .light))
                        }.frame(width: 150.0).background(model.TertiaryColor).cornerRadius(10.0).shadow(radius: 10.0).foregroundColor(Color.white)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Button(action: {
                            model.currentOrderView = "Physical"
                        }){
                            Text("Next").font(.system(size: 18, weight: .light)).padding()
                            Image(systemName: "arrow.right").font(.system(size: 24, weight: .light))
                        }.frame(width: 150.0).background(model.TertiaryColor).cornerRadius(10.0).shadow(radius: 10.0).foregroundColor(Color.white)
                        Spacer()
                    }
                }
            }.padding()
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(model: ViewModel())
    }
}
