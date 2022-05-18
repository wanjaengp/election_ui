//
//  close the vote.swift
//  LINETown_Election
//
//  Created by WANJAENG PHONGPHAT on 5/9/22.
//

import SwiftUI

struct CloseTheVote: View {
  @State private var search: String = ""
  @State private var selectedIndex: Int = 1
  
  var body: some View {
    NavigationView {
      ZStack {
        Color(#colorLiteral(red: 0.937254902,
                            green: 0.937254902,
                            blue: 0.937254902,
                            alpha: 1))
          .ignoresSafeArea()
        
        ScrollView (showsIndicators: false) {
          VStack (alignment: .center) {
            TagLineView()
              .padding()
            
            SearchAndScanView(search: $search)
            
            Text("Candidate List")
              .font(.title3)
              .fontWeight(.regular)
              .opacity(0.5)
              .padding(.leading, 8)
            
            ScrollView (.horizontal, showsIndicators: false) {
              VStack (spacing: 20) {
                ForEach(0 ..< 4) { i in
                  NavigationLink(
                    destination: CandidateList(),
                    label: {
                      ProductCardView(image: Image("chair_\(i+1)"), size: 210)
                    })
                    .navigationBarHidden(true)
                    .foregroundColor(.black)
                }
                .padding(.leading)
              }
            }
            .padding(.bottom)
          }
        }
        
        VStack {
          Spacer()
          
        }
      }
    }
  }
}

struct CloseTheVote_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}

struct TagLineView_CloseTheVote: View {
  var body: some View {
    Text("LINE TOWN ELECTION ")
      .font(.custom("PlayfairDisplay-Regular", size: 30))
      .foregroundColor(Color("Primary"))
      .font(.custom("PlayfairDisplay-Bold", size: 30))
      .fontWeight(.bold)
      .foregroundColor(Color("Primary"))
  }
}

struct SearchAndScanView_CloseTheVote: View {
  @Binding var search: String
  var body: some View {
    HStack() {
      HStack() {
        Image("Search")
          .padding(.trailing, 8)
        TextField("Search Your Mayor", text: $search)
      }
      .padding(.all, 20)
      .background(Color.white)
      .cornerRadius(10.0)
      .padding(.trailing, 8)
    }
    .padding(.horizontal)
  }
}

struct ProductCardView_CloseTheVote: View {
  let image: Image
  let size: CGFloat
  
  var body: some View {
    VStack(alignment: .center) {
      image
        .resizable()
        .frame(width: size, height: 200 * (size/210))
        .cornerRadius(20.0)
      HStack (spacing: 2) {
        Text("Candidate1")
          .font(.title3)
          .fontWeight(.bold)
        Spacer()
        Text("1.1K")
          .font(.title3)
          .fontWeight(.bold)
      }
      
      HStack (spacing: 2) {
        Text("45year")
          .opacity(0.5)
          .padding(.leading, 8)
        Spacer()
        Text("voter")
          .opacity(0.5)
          .padding(.leading, 8)
      }
      Spacer()
      HStack (spacing: 2) {
        Text("\"Choose me if your don't know who to choose\"")
          .font(.title3)
          .fontWeight(.bold)
      }
    }
    .frame(width: size, alignment: .center)
    .padding(.all, 20)
    .padding(.trailing, 8)
    .background(Color.white)
    .cornerRadius(20.0)
  }
}


