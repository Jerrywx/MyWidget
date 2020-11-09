//
//  ContentView.swift
//  MyWidget
//
//  Created by 王潇 on 2020/11/3.
//

import SwiftUI

/// 按钮
struct CalculatorButton: View {
    
    let fontSize: CGFloat = 38
    let title: String
    let size: CGSize
    let backgroundColorName: String
    let action: () -> Void
    
    ///
    var body: some View {
        
        Button(action: action) {
            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(.white)
                .frame(width: size.width, height: size.height, alignment: .center)
                .background(Color(backgroundColorName))
                .cornerRadius(size.width * 0.5)
        }
    }
}

/// 一行按钮
struct CalculatorButtonRow: View {
    
    @Binding var brain: CalculatorBrain
    
    let row: [CalculatorButtonItem]
    var body: some View {
        
        HStack {
            ForEach(row, id: \.self) { item in
                CalculatorButton(
                    title: item.title,
                    size: item.size,
                    backgroundColorName: item.backgroundColorName) {
                    
                    self.brain = self.brain.apply(item: item)
                    print("Button \(self.brain)")
                }
            }
        }
    }
}

/// 键盘
struct CaclulatorButtonPad: View {
    
    @Binding var brain: CalculatorBrain
    
    let pad: [[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip), .command(.percent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
        [.digit(0), .dot, .op(.equal)],
    ]
    
    var body: some View {
        VStack(spacing: 8) {
            ForEach(pad, id: \.self) { row in
                CalculatorButtonRow(brain: self.$brain, row: row)
            }
        }
    }
}

/// 内容
struct ContentView: View {
    
    @State private var brain: CalculatorBrain = .left("0")
    
    var body: some View {
        
        VStack(alignment:.trailing, spacing: 12) {
            
            Spacer()
            
            Text(brain.output)
                .font(.system(size: 76))
                .minimumScaleFactor(0.5)
                .padding(.trailing, 24)
                .lineLimit(1)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
            
            Button(self.brain.output) {
//                self.brain = .left(".123")
            }
            
            CaclulatorButtonPad(brain: $brain)
                .padding(.bottom)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
