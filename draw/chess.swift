//
//  chess.swift
//  draw
//
//  Created by Максим on 02.02.2021.
//

import SwiftUI

struct chessBoard: Shape {
    public var animatableData: AnimatablePair<Double, Double> {
        get {
           AnimatablePair(Double(rows), Double(columns))
        }

        set {
            self.rows = Int(newValue.first)
            self.columns = Int(newValue.second)
        }
    }
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let rowSize = rect.height / CGFloat(rows)
        let columnSize = rect.width / CGFloat(columns)
        
        for row in 0..<rows {
            for column in 0..<columns{
                if(row+column).isMultiple(of: 2){
                    
                    let startX = columnSize * CGFloat(column)
                    let startY = rowSize * CGFloat(row)
                    
                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }
        return path
    }
    
    var rows: Int
    var columns: Int
}

struct chess: View {
    @State private var row = 8
    @State private var column = 8
    var body: some View {
        VStack{
        chessBoard(rows: row, columns: column)
            .padding(20)
            .frame(maxWidth: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                self.row+=1
                self.column+=1
            }
        Button(action: {
            self.row = 8
            self.column = 8
        }){
            Text("Reset")
        }
        }
    }
}

struct chess_Previews: PreviewProvider {
    static var previews: some View {
        chess()
    }
}
