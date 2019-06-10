//
//  ContentView.swift
//  Hackers
//
//  Created by Weiran Zhang on 09/06/2019.
//  Copyright © 2019 Weiran Zhang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var posts: [Post]
    
    var body: some View {
        NavigationView {
            List(posts) { post in
                PostCell(post: post)
            }
            .navigationBarTitle(Text("Hacker News"))
        }
    }
}

struct PostCell: View {
    var post: Post
    
    let config = Image(systemName: "arrow.up")
        .imageScale(.medium)
    
    var body: some View {
        HStack(alignment: VerticalAlignment.center) {
            ThumbnailImage()
            VStack(alignment: .leading, spacing: 5) {
                TitleView(post: post)
                MetadataView(post: post)
            }
        }
    }
}

struct ThumbnailImage: View {
    var body: some View {
        Image(systemName: "safari")
            .resizable(resizingMode: .stretch)
            .padding(10)
            .imageScale(.large)
            .frame(width: 60, height: 60)
            .background(Color.gray)
            .cornerRadius(8)
            .padding([.top, .bottom, .trailing], 5)
    }
}

struct TitleView: View {
    let post: Post
    
    var body: some View {
        Text(post.title)
            .font(.headline)
            .lineLimit(5)
    }
}

struct MetadataView: View {
    let post: Post
    
    var body: some View {
        HStack(spacing: 2) {
            Text("\(post.points)")
            Image(systemName: "arrow.up")
            BulletSpacer()
            Text("\(post.commentsCount)")
            Image(systemName: "bubble.left")
            BulletSpacer()
            Text(post.location.host!)
        }
        .font(.subheadline)
        .foregroundColor(.gray)
        .imageScale(.small)
    }
}

struct BulletSpacer: View {
    var body: some View {
        Text("•")
            .padding([.leading, .trailing], 5)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let posts: [Post] = [
            Post(id: 1, title: "The History of Random.org", points: 12, commentsCount: 4, date: Date(), location: URL(string: "https://google.com")!),
            Post(id: 2, title: "Opera, Brave, Vivaldi to ignore Chrome's anti-ad-blocker changes", points: 22, commentsCount: 4, date: Date(), location: URL(string: "https://google.com")!),
            Post(id: 3, title: "Android now forces apps to include proprietary code for push notifications some more text", points: 143, commentsCount: 43, date: Date(), location: URL(string: "https://www.reddit.com/r/freesoftware/comments/by4ipr/android_now_forces_apps_to_include_proprietary/")!)
        ]
        return ContentView(posts: posts)
    }
}
#endif
