//
//  OrderView.swift
//  ebayby
//
//  Created by user175571 on 1/18/21.
//

import SwiftUI

struct OrderView: View {
    @ObservedObject var model: ViewModel
    @Namespace var orderspace
    
    var body: some View {
        if model.currentOrderView == "Preview"{
            OrderPreviewView(model: model, orderspace: orderspace)
        }
        if model.currentOrderView == "Physical"{
            OrderPhysicalView(model: model, orderspace: orderspace)
        }
        if model.currentOrderView == "Internal"{
            OrderInternalView(model: model, orderspace: orderspace)
        }
        if model.currentOrderView == "Overview"{
            OrderPreviewView(model: model, orderspace: orderspace)
        }
    }
}

struct OrderPreviewView: View {
    @ObservedObject var model: ViewModel
    var orderspace: Namespace.ID
    
    var body: some View {
        ZStack{
            VStack(alignment: .center){
                Spacer()
                Text("Hello " + model.user.name).font(.largeTitle).padding()
                Text("You Have Selected "+model.currentBase.NameOfCeleb+" To Be The Base Of Your Child!").font(.headline).padding()
                Image(uiImage: model.currentBase.ImageOfCeleb).resizable().frame(width:250, height: 250).aspectRatio(contentMode: .fit).clipShape(Circle()).shadow(radius: 10).padding()
                Text(model.currentBase.NameOfCeleb).font(.largeTitle).matchedGeometryEffect(id: "NameOfCeleb", in: orderspace)
                Text(model.currentBase.Description).font(.title)
                Text("$"+String(model.currentBase.BasePrice)+"+").font(.headline).padding()
                Spacer()
                
                HStack{
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                model.page = "home"
                            }
                        }){
                            Text("Home").font(.system(size: 18, weight: .light)).padding()
                            Image(systemName: "house.fill").font(.system(size: 24, weight: .light))
                        }.frame(width: 150.0).background(model.TertiaryColor).cornerRadius(10.0).shadow(radius: 10.0).foregroundColor(Color.white)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                model.currentOrderView = "Physical"
                            }
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

struct OrderPhysicalView: View{
    @ObservedObject var model: ViewModel
    var orderspace: Namespace.ID
    
    @State var eyeOptions = [
        (InfoModel.EyeColor.black, Color.black, false),
        (InfoModel.EyeColor.blue, Color.blue, false),
        (InfoModel.EyeColor.brown, Color.init(.brown), false),
        (InfoModel.EyeColor.gold, Color.yellow, false),
        (InfoModel.EyeColor.green, Color.green, false),
        (InfoModel.EyeColor.purple, Color.purple, false)
    ]
    @State var skinOptions = [
        (InfoModel.SkinColor.black, Color.black, false),
        (InfoModel.SkinColor.brown, Color.init(.brown), false),
        (InfoModel.SkinColor.blue, Color.blue, false),
        (InfoModel.SkinColor.tan, Color.yellow, false),
        (InfoModel.SkinColor.red, Color.red, false),
        (InfoModel.SkinColor.white, Color.pink, false),
    ]
    @State var babyName = ""
    
    var body: some View {
        
        ZStack{
            ScrollView{
            VStack(alignment: .center){
               
                Spacer()
                Text(String(model.currentOrder.OrderedBaby.Base.NameOfCeleb)).font(.largeTitle).matchedGeometryEffect(id: "NameOfCeleb", in: orderspace)
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
                        Text("Eye Color").font(.system(size: 28, weight: .bold)).foregroundColor(Color.black).padding()
                        Spacer()
                        Image(systemName: "eye.fill").font(.system(size: 28, weight: .bold)).foregroundColor(Color.black).padding()
                    }
                    VStack {
                        ForEach((0..<6), id: \.self) {
                            SelectionBox(model: model, eyeOptions: $eyeOptions, optionIndex: $0)
                        }
                    }
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
                VStack{
                    HStack{
                        Text("Skin Color").font(.system(size: 28, weight: .bold)).foregroundColor(Color.black).padding()
                        Spacer()
                        Image(systemName: "pencil.tip.crop.circle.badge.plus").font(.system(size: 28, weight: .bold)).foregroundColor(Color.black).padding()
                    }
                    VStack {
                        ForEach((0..<6), id: \.self) {
                            SelectionBoxSkin(model: model, skinOptions: $skinOptions, optionIndex: $0)
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
                                model.currentOrderView = "Preview"
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
                                model.currentOrderView = "Internal"
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

struct SelectionBox: View {
    @ObservedObject var model: ViewModel
    @Binding var eyeOptions: Array<(InfoModel.EyeColor, Color, Bool)>
    var optionIndex: Int
    
    var body: some View {
        VStack{
            if eyeOptions[optionIndex].2 {
                Text(eyeOptions[optionIndex].0.rawValue).padding().frame(width: UIScreen.main.bounds.width-30, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(eyeOptions[optionIndex].1).overlay(RoundedRectangle(cornerRadius:5).stroke(eyeOptions[optionIndex].1, lineWidth: 1)).transition(.opacity)
            }
            else {
                Text(eyeOptions[optionIndex].0.rawValue).padding().frame(width: UIScreen.main.bounds.width-30, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(Color.gray).overlay(RoundedRectangle(cornerRadius:5).stroke(Color.gray, lineWidth: 1)).transition(.opacity)
            }
            
        }.onTapGesture {
            withAnimation {
                for i in 0..<eyeOptions.count {
                    eyeOptions[i].2 = false
                    model.currentOrder.OrderedBaby.EyeColor = eyeOptions[optionIndex].0
                }
                eyeOptions[optionIndex].2 = true
            }
            
        }
    }
}

struct SelectionBoxSkin: View {
    @ObservedObject var model: ViewModel
    @Binding var skinOptions: Array<(InfoModel.SkinColor, Color, Bool)>
    var optionIndex: Int
    
    var body: some View {
        VStack{
            if skinOptions[optionIndex].2 {
                Text(skinOptions[optionIndex].0.rawValue).padding().frame(width: UIScreen.main.bounds.width-30, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(skinOptions[optionIndex].1).overlay(RoundedRectangle(cornerRadius:5).stroke(skinOptions[optionIndex].1, lineWidth: 1)).transition(.opacity)
            }
            else {
                Text(skinOptions[optionIndex].0.rawValue).padding().frame(width: UIScreen.main.bounds.width-30, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(Color.gray).overlay(RoundedRectangle(cornerRadius:5).stroke(Color.gray, lineWidth: 1)).transition(.opacity)
            }
            
        }.onTapGesture {
            withAnimation {
                for i in 0..<skinOptions.count {
                    skinOptions[i].2 = false
                    model.currentOrder.OrderedBaby.SkinColor = skinOptions[optionIndex].0
                }
                skinOptions[optionIndex].2 = true
            }
            
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    
    static var previews: some View {
        OrderView(model: ViewModel())
    }
}
