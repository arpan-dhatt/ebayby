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
        ZStack{
            VStack{
                Text("Hello You")
            }
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(model: ViewModel())
    }
}
