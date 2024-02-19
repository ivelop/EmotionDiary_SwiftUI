//
//  DiaryDateInputView.swift
//  EmotionDiary
//
//  Created by joonwon lee on 2022/07/02.
//

import SwiftUI


struct DiaryDateInputView: View {
    
//    @State var date: Date = Date()
//    @Binding var isPresented: Bool
//
    @StateObject var vm: DiaryViewModel
    
    var body: some View {
        VStack {
            DatePicker(
                "Start Date",
                selection: $vm.date,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
        }
    }
}

struct DiaryDateInputView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = DiaryViewModel(isPresented: .constant(true))
        DiaryDateInputView(vm: vm)
//        DiaryDateInputView(isPresented: .constant(false))
    }
}
