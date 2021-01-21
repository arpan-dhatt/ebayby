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
            OrderPortal(model: self.model).tabItem {
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
    var size: CGFloat
    var showBio: Bool
    
    var body: some View{
        ZStack{
            
            Image(uiImage: base.ImageOfCeleb).resizable().frame(width:size, height: size).aspectRatio(contentMode: .fit)
            VStack{
                Spacer()
                VisualEffectView(effect: UIBlurEffect(style: .regular)).frame(width: size, height: size/3, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            VStack{
                Spacer()
                    Text("Base Of " + base.NameOfCeleb).font(.title)
                Text("$"+String(base.BasePrice)+"K+").font(.subheadline)
                    if showBio {
                        Text(base.Description)
                    }
            }.padding()
        }.cornerRadius(10.0).foregroundColor(.white).onTapGesture {
            model.currentBase = base
            model.currentOrder.OrderedBaby.Base = base
            model.page = "order"
            model.currentOrderView = "Overview"
        }
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
                        BabyBasePreviewView(model: self.model, base: babyBase, size: 250, showBio: false)
                    }
                }.padding([.leading, .trailing])
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
            
            TabView {
                
                    ForEach(articleList, id: \.id){ article in
                        ArticlePreviewView(model: self.model, article: article)
                    }
            }.frame(width: UIScreen.main.bounds.width, height: 350).tabViewStyle(PageTabViewStyle()).shadow(radius: 10.0)
        }.foregroundColor(.black).padding([.bottom, .top], 25)
        Divider()
    }
}

struct ArticlePreviewView: View {
    @ObservedObject var model: ViewModel
    var article: InfoModel.Article
    @State var showArticle : Bool = false
    
    var body: some View{
        VStack{
            ZStack{
                Image(uiImage: article.Image).resizable().aspectRatio(contentMode: .fill).cornerRadius(10.0).onTapGesture {
                    showArticle.toggle()
                }
                
                VStack{
                    HStack {
                        Text(article.Subtitle).font(.subheadline).fontWeight(.bold)
                        Spacer()
                    }
                    HStack {
                        Text(article.Title).font(.system(size: 38, weight: .bold))
                        Spacer()
                    }
                    Spacer()
                }.padding(.top, 55).padding(.leading, 15)
            }.frame(width:UIScreen.main.bounds.width-30, height: 350).onTapGesture {
                showArticle.toggle()
            }
        }.cornerRadius(10.0).foregroundColor(.white).sheet(isPresented: $showArticle, content: {
            ArticleSheetView(showSheetView: $showArticle, title: article.Title, image: article.Image, subtitle: article.Subtitle, text: article.Subtitle)
        }).contentShape(Rectangle()).onTapGesture {
            showArticle.toggle()
        }
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
                        BabyBasePreviewView(model: self.model, base: babyBase, size: UIScreen.main.bounds.width-30, showBio: true)
                    }
                }.foregroundColor(.black)
            }.shadow(radius: 10.0).foregroundColor(.black)
        }.navigationBarTitle("All Babies")
    }
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(model: ViewModel())
    }
}
