//
//  MainView.swift
//  ebayby
//
//  Created by user175571 on 1/16/21.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var model: ViewModel = ViewModel()
    
    var body: some View {
        VStack{
            if model.page == "home"{
                HomeView(model: self.model)
            }
            if model.page == "login"{
                VStack{
                    Spacer()
                    Text("Login")
                    Spacer()
                    VStack{
                        
                        Button(action: {
                            self.model.page = "order"
                        }){
                            Text("Orders").font(.system(size: 24, weight: .light)).padding()
                        }.frame(width: 225).background(Color.green).cornerRadius(10.0).shadow(radius: 10.0).foregroundColor(Color.white)
                        
                        
                        Button(action: {
                            self.model.page = "home"
                        }){
                            Text("Home").font(.system(size: 24, weight: .light)).padding()
                        }.frame(width: 225).background(Color.green).cornerRadius(10.0).shadow(radius: 10.0).foregroundColor(Color.white)
                        
                        
                        Button(action: {
                            self.model.page = "login"
                        }){
                            Text("Login").font(.system(size: 24, weight: .light)).padding()
                        }.frame(width: 225).background(Color.green).cornerRadius(10.0).shadow(radius: 10.0).foregroundColor(Color.white)
                        
                    }
                    Spacer()
                }
            }
            if model.page == "order"{
                OrderView(model: self.model)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
