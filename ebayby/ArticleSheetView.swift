//
//  ArticleSheetView.swift
//  ebayby
//
//  Created by Arpan Dhatt on 1/20/21.
//

import SwiftUI

struct ArticleSheetView: View {
    @Binding var showSheetView: Bool
    @State var title: String
    @State var image: UIImage
    @State var subtitle: String
    @State var text: String
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Image(uiImage: image).resizable().aspectRatio(contentMode: .fit)
                HStack {
                    Text(title).multilineTextAlignment(.leading).font(.system(size: 38, weight: .bold)).shadow(color: .gray, radius:15, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    Spacer()
                }.padding(.leading)
                HStack {
                    Text(subtitle).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/).font(.subheadline).shadow(radius: 5)
                    Spacer()
                }.padding(.leading).shadow(radius: 15)
                Text(text)
                    .multilineTextAlignment(.leading)
                    .font(.caption)
                    .padding(.all)
                Spacer()
            }
        }
    }
}

struct ArticleSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleSheetView(showSheetView: .constant(true), title: "Title", image: UIImage.init(named: "Donlad")!, subtitle: "Subtitle subtitle", text: "asldkfjadslf asd fa sdf  dsfa sd f as df  dasfdsaf d f ads f asdfasd sadfasdfas fsadfds fdsfsdf fadsfas\nadfasdfasdfasdfas adfsadfasdf  asdfasdfsafasd asdfasdfas")
    }
}
