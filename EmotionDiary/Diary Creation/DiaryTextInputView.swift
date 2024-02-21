//
//  DiaryTextInputView.swift
//  EmotionDiary
//
//  Created by joonwon lee on 2022/07/02.
//

import SwiftUI

struct DiaryTextInputView: View {
    @ObservedObject var vm: DiaryViewModel
    @FocusState var focused: Bool
    
    var body: some View {
        VStack {
            TextEditor(text: self.$vm.text)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .border(Color.gray.opacity(0.4), width: 2)
                .padding(EdgeInsets(top: 30, leading: 20, bottom: 30, trailing: 20))
                .focused($focused)
                .onAppear{
                    self.focused = true
                }
            HStack {
                Button {
                    vm.completed()
                } label: {
                    Text("Done")
                        .frame(width: 200, height: 80)
                        .foregroundColor(.white)
                        .background(Color.pink)
                        .cornerRadius(40)
                }

            }
        }
    }
}

struct DiaryTextInputView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryTextInputView(vm: DiaryViewModel(isPresented: .constant(false)))
    }
}
