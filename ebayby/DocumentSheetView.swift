//
//  DocumentSheetView.swift
//  ebayby
//
//  Created by Arpan Dhatt on 1/18/21.
//

import SwiftUI

struct DocumentSheetView: View {
    @Binding var showSheetView: Bool
    @State var title: String
    @State var text: String
    
    var body: some View {
        NavigationView {
            Text(text)
                .navigationBarTitle(
                    Text(title), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.showSheetView = false
                }) {
                    Text("Done").bold()
                })
        }
    }
}

//struct DocumentSheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        DocumentSheetView(showSheetView: .constant(true),title: "Testing", text: "lalala")
//    }
//}
