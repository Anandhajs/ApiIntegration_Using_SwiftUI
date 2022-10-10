//
//  ContentView.swift
//  API_Integration_Using_SwiftUI
//
//  Created by Apple on 10/10/22.
//

import SwiftUI

struct ContentView: View {
    @State var image = [Images]()

    var body: some View {
        List(image) { book in
            HStack {
                let url = URL(string: "\(book.urls?.small ?? "")")
                let data = try? Data(contentsOf: url!)

                Image(uiImage: UIImage(data: data!)! ).resizable()
                    .frame(width: 80, height: 80)
                    .scaledToFit()
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .padding(5)

                Spacer()
                VStack {
                    Text(book.user?.name ?? "")
                    let like = String(book.likes ?? 0)
                    Text(like).padding(5)

                    let date = dateFormate(date: book.user?.updated_at ?? "")
                    Text(date)
                }
            }
        }
        .onAppear() {
            ApiCalling().loadData { (books) in
                self.image = books
            }
        }.navigationTitle("Images")
    }

    func dateFormate(date: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let formattedDate = formatter.date(from: date)
        formatter.dateFormat = "E, d MMM yyyy"
        let date1 = formatter.string(from: formattedDate ?? Date())

        return "\(date1)"
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
