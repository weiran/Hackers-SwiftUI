//
//  CommentsView.swift
//  Hackers
//
//  Created by Weiran Zhang on 10/06/2019.
//  Copyright © 2019 Weiran Zhang. All rights reserved.
//

import SwiftUI

struct CommentsView: View {
    var comments: [Comment]
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        formatter.doesRelativeDateFormatting = true
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            List(comments) { comment in
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        HStack(spacing: 5) {
                            Text(comment.author)
                            Spacer()
                            Text(self.dateFormatter.string(from: comment.date))
                        }.font(.callout)
                        
                        Text(comment.contents)
                            .lineLimit(100)
                            .font(.body)
                    }
                }
                .padding([.leading], CGFloat(comment.level * 15))
            }
        }
    }
}

#if DEBUG
struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        let comment = Comment(id: 1, author: "Author", date: Date(), contents: "It will be awesome if Salesforce can adjust their model and make Tableau spit out D3. Their desktop tool is nice for designing, but their server components seem frequently unnecessary for running the visualization. The catch is that creating serverless dynamic visualizations isn’t all that money-making and the cool UI/UX design tool is outside of OSS’ wheelhouse.")
        let comment2 = Comment(id: 2, author: "Author", date: Date(), contents: "It will be awesome if Salesforce can adjust their model and make Tableau spit out D3. Their desktop tool is nice for designing, but their server components seem frequently unnecessary for running the visualization. The catch is that creating serverless dynamic visualizations isn’t all that money-making and the cool UI/UX design tool is outside of OSS’ wheelhouse.", level: 1)
        let comment3 = Comment(id: 3, author: "Author", date: Date(), contents: "It will be awesome if Salesforce can adjust their model and make Tableau spit out D3. Their desktop tool is nice for designing, but their server components seem frequently unnecessary for running the visualization. The catch is that creating serverless dynamic visualizations isn’t all that money-making and the cool UI/UX design tool is outside of OSS’ wheelhouse.", level: 2)
        let comments = [
            comment,
            comment2,
            comment3
        ]
        return CommentsView(comments: comments)
    }
}
#endif
