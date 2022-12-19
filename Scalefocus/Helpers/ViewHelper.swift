//
//  ViewHelper.swift
//  Scalefocus
//
//  Created by İbrahim Erdogan on 15.12.2022.
//

import Foundation
import SwiftUI

extension Date {
    ///  for format relase date formating
    /// - Parameter format: take just desired date format
    /// - Returns: return desired date format as a string
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}


struct MovieDetailRow: View {
    var rowTitle : String
    var rowDefinition : String
    var body: some View {
        HStack{
            HStack{
                Spacer()
                Text(rowTitle).lineLimit(1)
            }.frame(width:UIScreen.main.bounds.width * 0.5)
            HStack{
                Text(rowDefinition).lineLimit(1)
                Spacer()
            }.frame(width:UIScreen.main.bounds.width / 2)
        }
        .foregroundColor(.white)
    }
}


struct RoundedLongButtonModifier : ViewModifier{
    var backGroundColor : Color
    var width : CGFloat
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .foregroundColor(.white)
            .frame(width: width, height: 50, alignment: .center)
            .background(backGroundColor)
            .cornerRadius(20)
           
    }
}

struct ImageHolderFrameModifier : ViewModifier{
    func body(content: Content) -> some View {
        content
            .frame(minWidth: UIScreen.main.bounds.width * 0.4, maxWidth: UIScreen.main.bounds.width * 0.41, minHeight: UIScreen.main.bounds.height * 0.3, maxHeight: UIScreen.main.bounds.height * 0.34, alignment: .center)
    }
}

struct RoundedTextFieldModifier : ViewModifier{
    var backGroundColor : Color
    func body(content: Content) -> some View {
        content
            .padding(10)
            .background(backGroundColor)
            .cornerRadius(20)
            
    }
}

struct HeaderViewModifier : ViewModifier{
    func body(content: Content) -> some View {
        content
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.1, alignment: .leading)
            .background(Color("HeaderColor"))
            .edgesIgnoringSafeArea(.top)
            .foregroundColor(.white)
            .font(.system(size: 20))
    }
}

struct TextEditorViewModifier : ViewModifier{
    var height : CGFloat
    func body(content: Content) -> some View {
        content
            .frame(height: height)
            .padding(10)
            .background()
            .cornerRadius(20)
    }
}


extension Text
{
    func RoundedLongButtonStyle(backGroundColor : Color,width : CGFloat) -> some View
    {
        modifier(RoundedLongButtonModifier(backGroundColor: backGroundColor,width: width))
    }
}

extension TextField
{
    func RoundedTextFieldStyle(backGroundColor: Color) -> some View
    {
        modifier(RoundedTextFieldModifier(backGroundColor : backGroundColor))
    }
}


extension View
{
    func HeaderViewStyle() -> some View
    {
        modifier(HeaderViewModifier())
    }
    
    func ImageHolderFrameStyle() -> some View
    {
        modifier(ImageHolderFrameModifier())
    }
}

extension TextEditor
{
    func TextEditorStyle(height : CGFloat) -> some View
    {
        modifier(TextEditorViewModifier(height: height))
    }
}
