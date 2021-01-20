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
                        BabyBasePreviewHomePageView(model: model, selection: self.$selection, title: "Featured Babies", baseList: model.AllBases)
                        
                        ArticlePreviewHomePageView(model: model, title: "Featured Articles", articleList: model.FeaturedArticles)
                        
                        BabyBasePreviewHomePageView(model: model, selection: self.$selection, title: "Deals!", baseList: model.DealBases)
                        
                        BabyBasePreviewHomePageView(model: model, selection: self.$selection, title: "Exclusive Babies", baseList: model.DealBases)
                        
                        BabyBasePreviewHomePageView(model: model, selection: self.$selection, title: "Cheap Babies", baseList: model.CheapBases)
                    }
                }
            }.navigationBarTitle(Text("Home"))
        }
        
    }
}

struct BabyBasePreviewView: View {
    @ObservedObject var model: ViewModel
    var base: InfoModel.BabyBase
    
    var body: some View{
        VStack{
            
            Image(uiImage: base.ImageOfCeleb).resizable().frame(width:250, height: 250).aspectRatio(contentMode: .fit)
            
            Button(action: {
                model.currentBase = base
                model.currentOrder.OrderedBaby.Base = base
                model.page = "order"
                model.currentOrderView = "Overview"
            }) {
                VStack{
                    
                    Text("Base Of " + base.NameOfCeleb).font(.title)
                    Text("$"+String(base.BasePrice)+"K+").font(.subheadline)
                    
                    Spacer()
                }.padding()
            }
            
        }.background(Color.init(.lightGray)).cornerRadius(10.0).foregroundColor(.white)
    }
}

struct BabyBasePreviewHomePageView : View {
    @ObservedObject var model: ViewModel
    @Binding var selection : String?
    
    @State var title: String
    
    @State var baseList: Array<InfoModel.BabyBase>
    
    var body: some View {
        VStack {
            HStack {
                Text(title).font(.system(size: 28, weight: .bold)).foregroundColor(Color.black).multilineTextAlignment(.leading)
                
                Spacer()
                
                Button(action: {
                    self.selection = "basePreview"
                }){
                    Text("See All Babies").foregroundColor(model.PrimaryColor).multilineTextAlignment(.trailing)
                }
            }.padding([.leading, .trailing], 15)
            
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 15.0){
                    ForEach(baseList, id: \.id){ babyBase in
                        BabyBasePreviewView(model: self.model, base: babyBase)
                    }
                }.padding(.leading)
            }.shadow(radius: 10.0)
        }.foregroundColor(.black).padding([.bottom, .top], 25)
        Divider()

    }
    
}

struct ArticlePreviewHomePageView : View {
    @ObservedObject var model: ViewModel
    
    @State var title: String
    @State var articleList: Array<InfoModel.Article>
    
    var body: some View {
        VStack{
            HStack {
                Text(title).font(.system(size: 28, weight: .bold)).foregroundColor(Color.black).multilineTextAlignment(.leading)
                
                Spacer()
            }.padding([.leading, .trailing], 15)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack (spacing: 15.0) {
                    ForEach(articleList, id: \.id){ article in
                        ArticlePreviewView(model: self.model, article: article)
                    }
                }.padding(.leading)
            }
        }
        Divider()
    }
}

struct ArticlePreviewView: View {
    @ObservedObject var model: ViewModel
    var article: InfoModel.Article
    
    var body: some View{
        VStack{
            ZStack(alignment: .bottom){
                Image(uiImage: article.Image).resizable().frame(width:260, height: 350).aspectRatio(contentMode: .fit).cornerRadius(10.0).onTapGesture(){
                    model.page = "order"
                }
                
                VStack{
                    Text(article.Title).font(.headline)
                    Text(article.Subtitle)
                }.padding().frame(width:260).background(model.PrimaryColor.opacity(0.75))
            }
        }.cornerRadius(10.0).foregroundColor(.white)
    }
}

struct BabyBasePreviewListView: View{
    @ObservedObject var model: ViewModel
    var baseList: Array<InfoModel.BabyBase>
    
    var body: some View{
        
        ScrollView(.vertical){
            VStack(alignment: .leading) {
                VStack(spacing:15){
                    ForEach(model.AllBases, id: \.id){ babyBase in
                        BabyBasePreviewView(model: self.model, base: babyBase)
                    }
                }.foregroundColor(.black)
            }.shadow(radius: 10.0).foregroundColor(.black).padding([.bottom, .top], 25)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(model: ViewModel())
    }
}
