//
//  FormulaDetail.swift
//  AccountantApp
//
//  Created by ALEXANDR DRAGUNOV on 11/7/20.
//

import SwiftUI
import AVKit

struct FormulaDetail: View {
    
    // Variable for result of calculating
    @State var result: Int? = 0
    
    // Variable for object
    var formula: Formula
    
    var body: some View {
        List {
            
            TitleContainer(formula: formula)
            
            ShortInfoAbout(formula: formula)
            
            DescriptionArea(formula: formula)
            
            CalculatingArea(formula: formula, result: result)
            
            VideoBlock()
            
        }
        .padding(.top, -50)
        .edgesIgnoringSafeArea(.all)
    }
}

struct TitleContainer: View {
    var formula: Formula
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Title container code
            
            // Image for Title block
            Image(formula.picture)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            // Little blur for more readable title
            Rectangle()
                .frame(height: 60)
                .opacity(0.45)
                .blur(radius: 10)
                .foregroundColor(Color("HomePageButtons"))
            
            // Title for block & page
            HStack {
                LazyVStack(alignment: .leading) {
                    Text(formula.name)
                        .font(.title)
                        .foregroundColor(Color("InvertColorsForPrimaryText"))
                }
                .padding(.leading)
                .padding(.bottom)
                
                Spacer()
            }
        }
        .listRowInsets(EdgeInsets())
        .padding(.bottom)
    }
}

struct ShortInfoAbout: View {
    var formula: Formula
    
    var body: some View {
        LazyVStack(alignment: .leading, spacing: 15) {
            // Short info about
            
            HStack {
                HStack(alignment: .top) {
                    Text("Type: ")
                        .font(.headline)
                        .foregroundColor(Color("InvertColorsForPrimaryText"))
                    Spacer()
                }
                .frame(width: 150)
                
                Text(formula.type)
                    .font(.subheadline)
                    .foregroundColor(Color("InvertColorsForSecondaryText"))
            }
            
            HStack(alignment: .top) {
                HStack(alignment: .top) {
                    Text("Measurement in: ")
                        .font(.headline)
                        .foregroundColor(Color("InvertColorsForPrimaryText"))
                    Spacer()
                }
                .frame(width: 150)
                
                Text(formula.measurementIn)
                    .font(.subheadline)
                    .foregroundColor(Color("InvertColorsForSecondaryText"))
            }
        }
        .padding()
        .background(Color("HomePageButtons"))
        .cornerRadius(10)
        .shadow(radius: 4)
    }
}

struct DescriptionArea: View {
    var formula: Formula
    
    var body: some View {
        LazyVStack(alignment: .center, spacing: 10) {
            // Description area
            
            // Title for block
            HStack(alignment: .top) {
                Text("Description")
                    .font(.headline)
                    .foregroundColor(Color("InvertColorsForPrimaryText"))
            }
            .frame(width: 150)
            
            // Description
            Text(formula.description)
                .foregroundColor(Color("InvertColorsForSecondaryText"))
        }
        .padding()
        .background(Color("HomePageButtons"))
        .cornerRadius(10)
        .shadow(radius: 4)
    }
}

struct CalculatingArea: View {
    var formula: Formula
    
    @State var result: Int?
    
    var body: some View {
        LazyVStack(spacing: 30) {
            // Area for calculating
            
            // Title for block
            HStack(alignment: .center) {
                Text("For calculate you need to write it down into text area")
                    .padding(15)
                    .multilineTextAlignment(.center)
            }
            
            // Fields generator
            let calculatingFields: CalculatingFields = CalculatingFields(formulaObject: formula, formulaId: formula.id, countOfFields: formula.countOfFields)
            calculatingFields.body
            
            HStack {
                // Result of calculating
                
                Text("\(result ?? 0)") // There will be your result,
                    .foregroundColor(Color("InvertColorsForPrimaryText")) // now I'll create simple text here
            }
        }
        .padding()
        .background(Color("HomePageButtons"))
        .cornerRadius(10)
        .shadow(radius: 4)
    }
}

struct VideoBlock: View {
    var body: some View {
        LazyVStack {
            // Video block
            
            // Title for block
            HStack {
                Text("Also you can watch the video about economics")
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("InvertColorsForPrimaryText"))
            }
            .padding(.top, 10)
            .padding(.trailing, 10)
            .padding(.bottom, 10)
            .padding(.leading, 10)
            .background(Color("HomePageButtons"))
            .cornerRadius(10)
            .shadow(radius: 4)
            
            // Video player. I can't bring any videos from YouTube,
            // and because of it I take video from other sites in the internet
            VideoPlayer(player: AVPlayer(url: URL(string: "https://content.jwplatform.com/manifests/FYyScuyE.m3u8")!))
                .frame(width: nil, height: 200)
        }
    }
}

struct DeveloperBlock: View {
    var body: some View {
        LazyVStack(alignment: .center) {
            // Developer's block
            
            Text("Created by Oleksandr Sokolov")
                .font(.headline)
                .multilineTextAlignment(.center)
        }
    }
}
