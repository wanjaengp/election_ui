//
//  CandidateList.swift
//  LINETown_Election
//
//  Created by WANJAENG PHONGPHAT on 5/9/22.
//

import SwiftUI

struct CandidateList: View {
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  @State private var isPresented: Bool = false
  @State private var text: String = ""
  @State private var items = (1...5).map { "\($0)" }
  
  var body: some View {
    ZStack {
      Color("Bg")
      ScrollView  {
        Image("pic_1")
          .resizable()
          .aspectRatio(1,contentMode: .fit)
          .edgesIgnoringSafeArea(.top)
        
        DescriptionView()
        
      }
      .edgesIgnoringSafeArea(.top)
      
      Alert(title: "Please enter your national ID \nto confirm your vote",
            isShown: $isPresented,
            text: $text,
            onDone: { text in
          self.items.append(text)
          })
      
      HStack(alignment: .center) {
        Spacer()
        Button(action: {
          self.text = ""
          self.isPresented = true
          
        }) {
          Text("Click here to voting")
              .font(.title)
              .foregroundColor(.white)
          Text("VOTE")
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundColor(Color("Primary"))
            .padding()
            .padding(.horizontal, 8)
            .background(Color.white)
            .cornerRadius(10.0)
        }
      }
      .padding()
      .padding(.horizontal)
      .background(Color("Primary"))
      .cornerRadius(60.0, corners: .allCorners)
      .frame(maxHeight: .infinity, alignment: .bottom)
      .edgesIgnoringSafeArea(.bottom)
    }
    
    .navigationBarBackButtonHidden(true)
    .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDot"))
  }
}


struct RoundedCorner: Shape {
  
  var radius: CGFloat = .infinity
  var corners: UIRectCorner = .allCorners
  
  func path(in rect: CGRect) -> Path {
    let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    return Path(path.cgPath)
  }
}

extension View {
  func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
    clipShape( RoundedCorner(radius: radius, corners: corners) )
  }
}

struct DetailScreen_Previews: PreviewProvider {
  static var previews: some View {
    CandidateList()
  }
}


struct ColorDotView: View {
  let color: Color
  var body: some View {
    color
      .frame(width: 24, height: 24)
      .clipShape(Circle())
  }
}

struct DescriptionView: View {
  var body: some View {
    VStack (alignment: .center) {
      HStack (spacing: 2) {
        Text("John Wick")
          .font(.title)
          .fontWeight(.bold)
        Spacer()
        Text("1.1K")
          .font(.title)
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
          .font(.title)
          .fontWeight(.bold)
          .multilineTextAlignment(.center)
          .padding(.top, 60.0)
      }
    }
    .padding()
    .padding(.top)
    .background(Color("Bg"))
    .cornerRadius(30, corners: [.topLeft, .topRight])
    .offset(x: 0, y: -30.0)
  }
}


struct BackButton: View {
  let action: () -> Void
  var body: some View {
    Button(action: action) {
      Image(systemName: "chevron.backward")
        .foregroundColor(.black)
        .padding(.all, 12)
        .background(Color.white)
        .cornerRadius(8.0)
    }
  }
}
