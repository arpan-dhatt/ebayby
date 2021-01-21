//
//  OrderPortal.swift
//  ebayby
//
//  Created by user175571 on 1/20/21.
//

import SwiftUI

struct OrderPortal: View {
    @ObservedObject var model: ViewModel
    
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    coolTitle(text: "Your Babies", image: "person.circle")
                    
                    if model.allOrders.count == 0{
                        VStack{
                            Spacer()
                            Text("You Have No Children").font(.system(size: 28, weight: .light)).foregroundColor(Color.black).padding()
                            Text("You Have No Purpose").font(.system(size: 18, weight: .ultraLight)).foregroundColor(Color.black).padding()
                            Text("- President Bethi").font(.system(size: 14, weight: .light)).foregroundColor(Color.black).padding()
                            Spacer()
                        }
                    }
                    else{
                        VStack{
                            coolTitleLight(text: "In Delivery")
                        }
                        VStack{
                            coolTitleLight(text: "In Creation")
                        }
                        VStack{
                            coolTitleLight(text: "In Delivery")
                        }
                    }
                }
            }
        }
    }
}

struct coolTitle: View {
    var text: String
    var image: String
    
    var body: some View {
        HStack{
            Text(text).font(.system(size: 28, weight: .bold)).foregroundColor(Color.black).padding()
            Spacer()
            Image(systemName: image).font(.system(size: 28, weight: .bold)).foregroundColor(Color.black).padding()
        }
    }
}

struct coolTitleLight: View {
    var text: String
    
    var body: some View {
        HStack{
            Text(text).font(.system(size: 24, weight: .light)).foregroundColor(Color.black).padding()
            Spacer()
        }
    }
}


struct OrderPortal_Previews: PreviewProvider {
    static var previews: some View {
        OrderPortal(model: ViewModel())
    }
}
