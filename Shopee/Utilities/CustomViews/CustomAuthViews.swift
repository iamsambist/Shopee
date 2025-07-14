//
//  CustomAuthButton.swift
//  Shopee
//
//  Created by MacBook Two on 14/07/2025.
//

import SwiftUI

struct CustomButton: View {
    var buttonText: String = "Next"
    var onClick: () -> Void
   
    var body: some View {
        ZStack {
            Text("\(buttonText)")
                .foregroundColor(.white)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(Color.blue)
        .cornerRadius(8)
        .onTapGesture {
            onClick()
        }
    }
}

struct CustomTextField: View {
    @Binding var text: String
    var placeHolderText: String = "Email"
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text("\(placeHolderText)")
                    .foregroundColor(.gray)
                    .padding(.leading, 12)
            }
            TextField("", text: $text)
                .foregroundColor(.black)
                .padding(.leading, 12)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(12)
        
    }
}

#Preview {
    CustomTextField(text: .constant(""))
}
