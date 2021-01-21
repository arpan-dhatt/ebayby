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
                    HStack{
                        Text("Your Babies").font(.system(size: 28, weight: .bold)).foregroundColor(Color.black).padding()
                        Spacer()
                        Image(systemName: "person.circle").font(.system(size: 28, weight: .bold)).foregroundColor(Color.black).padding()
                    }

                        if model.allOrders.count == 0{
                            VStack{
                                Text("You Have No Children").font(.system(size: 28, weight: .light)).foregroundColor(Color.black).padding()
                                Text("You Have No Purpose").font(.system(size: 18, weight: .ultraLight)).foregroundColor(Color.black).padding()
                                Text("- President Bethi").font(.system(size: 14, weight: .light)).foregroundColor(Color.black).padding()
                            }
                        }
                        else{
                            
                        }
                    
                }
            }
        }
    }
}

struct OrderPortal_Previews: PreviewProvider {
    static var previews: some View {
        OrderPortal(model: ViewModel())
    }
}
