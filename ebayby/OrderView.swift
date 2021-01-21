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
            OrderPhysicalView(model: model)
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

struct OrderPhysicalView: View{
    @ObservedObject var model: ViewModel
    @State var eyeOption6 = Color.gray
    @State var eyeOption5 = Color.gray
    @State var eyeOption4 = Color.gray
    @State var eyeOption3 = Color.gray
    @State var eyeOption2 = Color.gray
    @State var eyeOption1 = Color.gray
    @State var babyName = ""
    
    var body: some View {
        
        ZStack{
            VStack(alignment: .center){
                ScrollView{
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
                        Stepper(value: $model.currentOrder.OrderedBaby.Height, in 100...200, label: {
                            Text("current height")
                        }).padding().shadow(radius: 2.5)
                    }
                VStack{
                    HStack{
                        Text("Eye Color").font(.system(size: 28, weight: .bold)).foregroundColor(Color.black).padding()
                        Spacer()
                        Image(systemName: "eye.fill").font(.system(size: 28, weight: .bold)).foregroundColor(Color.black).padding()
                    }
                    HStack{
                        Spacer()
                        SelectionBox(option: "Green", color: $eyeOption1, mode: self.model).onTapGesture {
                            eyeOption1 = Color.green
                            eyeOption2 = Color.gray
                            eyeOption3 = Color.gray
                            eyeOption4 = Color.gray
                            eyeOption5 = Color.gray
                            eyeOption6 = Color.gray
                            model.currentOrder.OrderedBaby.EyeColor = .green
                            
                        }
                        Spacer()
                        SelectionBox(option: "Blue", color: $eyeOption2, mode: self.model).onTapGesture {
                            eyeOption1 = Color.gray
                            eyeOption2 = Color.green
                            eyeOption3 = Color.gray
                            eyeOption4 = Color.gray
                            eyeOption5 = Color.gray
                            eyeOption6 = Color.gray
                            model.currentOrder.OrderedBaby.EyeColor = .blue
                        }
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        SelectionBox(option: "Black", color: $eyeOption3, mode: self.model).onTapGesture {
                            eyeOption1 = Color.gray
                            eyeOption2 = Color.gray
                            eyeOption3 = Color.green
                            eyeOption4 = Color.gray
                            eyeOption5 = Color.gray
                            eyeOption6 = Color.gray
                            model.currentOrder.OrderedBaby.EyeColor = .black
                        }
                        Spacer()
                        SelectionBox(option: "Brown", color: $eyeOption4, mode: self.model).onTapGesture {
                            eyeOption1 = Color.gray
                            eyeOption2 = Color.gray
                            eyeOption3 = Color.gray
                            eyeOption4 = Color.green
                            eyeOption5 = Color.gray
                            eyeOption6 = Color.gray
                            model.currentOrder.OrderedBaby.EyeColor = .brown
                        }
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        SelectionBox(option: "Gold", color: $eyeOption5, mode: self.model).onTapGesture {
                            eyeOption1 = Color.gray
                            eyeOption2 = Color.gray
                            eyeOption3 = Color.gray
                            eyeOption4 = Color.gray
                            eyeOption5 = Color.green
                            eyeOption6 = Color.gray
                            model.currentOrder.OrderedBaby.EyeColor = .gold
                        }
                        Spacer()
                        SelectionBox(option: "Purple", color: $eyeOption6, mode: self.model).onTapGesture {
                            eyeOption1 = Color.gray
                            eyeOption2 = Color.gray
                            eyeOption3 = Color.gray
                            eyeOption4 = Color.gray
                            eyeOption5 = Color.gray
                            eyeOption6 = Color.green
                            model.currentOrder.OrderedBaby.EyeColor = .purple
                        }
                        Spacer()
                    }
                    Divider()
                    
                }
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

struct SelectionBox: View {
    var option: String
    @Binding var color: Color
    @ObservedObject var mode: ViewModel
    
    var body: some View {
        VStack{
            Text(option).frame(width: 125, height: 25, alignment:.center).padding().overlay(RoundedRectangle(cornerRadius:5).stroke(color, lineWidth: 1))
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(model: ViewModel())
    }
}
