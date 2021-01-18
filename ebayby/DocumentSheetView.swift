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
            ScrollView(.vertical) {
                VStack {
                    Text(text)
                        .multilineTextAlignment(.leading)
                        .font(.caption)
                        .padding(/*@START_MENU_TOKEN@*/.all, 5.0/*@END_MENU_TOKEN@*/)
                        .navigationBarTitle(
                            Text(title), displayMode: .inline)
                        .navigationBarItems(trailing: Button(action: {
                            self.showSheetView = false
                        }) {
                            Text("Done").bold()
                        })
                    Spacer()
                }
            }
        }
    }
}

struct DocumentSheetView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentSheetView(showSheetView: .constant(true),title: "Testing", text: "lalalaa s f sda f sd f   d fa sd f asd fsadfsd fsd f ds f sdfsdfsdf sd fsd d s fs d f sd f ds f ds fs d fds")
    }
}
