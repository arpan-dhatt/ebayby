//
//  HomeView.swift
//  ebayby
//
//  Created by user175571 on 1/16/21.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var model: ViewModel
    @State var selection: String? = nil
    
    var body: some View {
        TabView(selection: $model.selectedHomeTab) {
            ForYouView(model: self.model).tabItem {
                Image(systemName: "plus").font(.system(size: 28, weight:.ultraLight))
                Text("For You")
            }.tag(Tab.forYou)
            ProfileView(model: self.model).tabItem {
                Image(systemName: "house").font(.system(size: 28, weight:.ultraLight))
                Text("Profile")
            }.tag(Tab.profile)
            testView(model: self.model).tabItem {
                Image(systemName: "list.bullet").font(.system(size: 28, weight:.ultraLight))
                Text("Orders")
            }.tag(Tab.orders)

        }
    }
}

extension HomeView{
    enum Tab: Hashable {
        case forYou
        case profile
        case orders
    }
}

struct testView: View {
    @ObservedObject var model: ViewModel
    
    var body: some View {
        Text("test")
    }
}

struct ForYouView: View {
    @ObservedObject var model: ViewModel
    @State var selection: String? = nil
    
    var body: some View{
        
        NavigationView{
            ScrollView{
                
                NavigationLink(destination: BabyBasePreviewListView(model: self.model, baseList: model.AllBases), tag: "basePreview", selection: $selection) {
                    EmptyView()
                }.foregroundColor(Color.white)
                
                ZStack{
                    VStack{
                        VStack {
                            Text("Featured").font(.system(size: 36, weight: .light)).foregroundColor(Color.white)
                            
                            ScrollView(.horizontal){
                                VStack(alignment: .leading) {
                                    HStack{
                                        ForEach(model.AllBases, id: \.id){ babyBase in
                                            BabyBasePreviewView(model: self.model, base: babyBase)
                                        }
                                    }.foregroundColor(.black)
                                }
                            }.padding().shadow(radius: 10.0)
                            
                            HStack {
                                Spacer()
                                Button(action: {
                                    self.selection = "basePreview"
                                }){
                                    Text("See All").font(.system(size: 16, weight: .light)).padding()
                                }.frame(width: 100.0).background(Color.green).cornerRadius(10.0).shadow(radius: 10.0).foregroundColor(Color.white)
                                Spacer()
                            }
                        }.foregroundColor(.black).padding([.bottom, .top], 25)
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 0){
                                ForEach(model.FeaturedArticles, id: \.id){ article in
                                        GeometryReader {
                                            geo in
                                            ArticlePreviewView(model: self.model, article: article).rotation3DEffect(.degrees(-Double(geo.frame(in: .global).minX) / 8), axis: (x: 0, y: 1, z: 0))
                                        
                                        }.frame(width: 270, height: 400)
                                    }
                            }
                        }
                        
                    }
                }
            }.background(LinearGradient(gradient: Gradient(colors: [model.PrimaryColor,model.SecondaryColor,.white]), startPoint: .top, endPoint: .bottom)).navigationBarTitle(Text("Home"))
        }
        
    }
}

struct BabyBasePreviewView: View {
    @ObservedObject var model: ViewModel
    var base: InfoModel.BabyBase
    
    var body: some View{
        VStack{

            Image(uiImage: base.ImageOfCeleb).resizable().frame(width:250, height: 250).aspectRatio(contentMode: .fit)
            
            VStack{
                    Spacer()
                    
                    Text("Base Of " + base.NameOfCeleb).font(.headline)
                    
                    Text("$"+String(base.BasePrice)+"K+").font(.title)
                    Text(base.Description).font(.caption)
                    
                    Spacer()
                    
                    Button(action: {
                        model.currentBase = base
                        model.currentOrder.OrderedBaby.Base = base
                        model.page = "order"
                        model.currentOrderView = "Overview"
                    }){
                        Text("Start Now").font(.system(size: 12, weight: .light))
                    }.padding(15).background(model.PrimaryColor).cornerRadius(10.0).shadow(radius: 5.0).foregroundColor(Color.black)
                    
                    Spacer()
            }.padding()
        }.background(LinearGradient(gradient: Gradient(colors: [Color.init(red: 204/255, green: 204/255, blue: 178/255), Color.init(red: 117/255, green: 117/255, blue: 25/255)]), startPoint: .top, endPoint: .bottom)).cornerRadius(10.0).foregroundColor(.black).padding(.trailing, 15)
    }
}

struct ArticlePreviewView: View {
    @ObservedObject var model: ViewModel
    var article: InfoModel.Article
    
    var body: some View{
        VStack{
            ZStack(alignment: .bottomLeading){
            Image(uiImage: article.Image).resizable().frame(width:260, height: 250).aspectRatio(contentMode: .fit)
           
            HStack{
                Text(article.Title).font(.headline)
                Spacer()
                    Button(action: {
                        
                    }){
                        Text("Read More").font(.system(size: 12, weight: .light))
                    }.padding(15).background(model.PrimaryColor).cornerRadius(10.0).shadow(radius: 5.0).foregroundColor(Color.black)

            }.padding().background(Color.white.opacity(0.3))
            }
            Text(article.Description).font(.caption).padding()
        }.background(LinearGradient(gradient: Gradient(colors: [Color.init(red: 204/255, green: 204/255, blue: 178/255), Color.init(red: 117/255, green: 117/255, blue: 25/255)]), startPoint: .top, endPoint: .bottom)).cornerRadius(10.0).foregroundColor(.black).padding(.trailing, 15)
    }
}

struct BabyBasePreviewListView: View{
    @ObservedObject var model: ViewModel
    var baseList: Array<InfoModel.BabyBase>
    
    var body: some View{
        
        ScrollView(.vertical){
            VStack(alignment: .leading) {
                VStack{
                    ForEach(model.AllBases, id: \.id){ babyBase in
                        BabyBasePreviewView(model: self.model, base: babyBase).padding(.bottom, 50)
                    }
                }.foregroundColor(.black)
            }.padding().shadow(radius: 10.0).foregroundColor(.black).padding([.bottom, .top], 25)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(model: ViewModel())
    }
}
