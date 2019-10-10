//
//  ContentView.swift
//  FBGroup
//
//  Created by Williams on 10/10/2562 BE.
//  Copyright © 2562 Williams. All rights reserved.
//

import SwiftUI

struct Post {
    let id: Int
    let username, text, posting, imageName: String
}

struct Group {
    let id: Int
    let imageName, title: String
}

struct ContentView: View {
    let posts: [Post] = [
        .init(
            id: 0,
            username: "Will",
            text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
            posting: "burger",
            imageName: "photo"
        ),
        .init(
            id: 1,
            username: "Lary",
            text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
            posting: "burger",
            imageName: "lift"
        ),
    ]
    
    let groupView: [Group] = [
        .init(id: 0, imageName: "turtle", title: "Hikes to see the Turtle"),
        .init(id: 1, imageName: "turtle", title: "Hikes to see the Burger"),
        .init(id: 2, imageName: "burger", title: "Hikes to see the Sea"),
        .init(id: 3, imageName: "turtle", title: "Hikes to see the Goat"),
        .init(id: 4, imageName: "burger", title: "Hikes to see the Goat"),
        .init(id: 5, imageName: "turtle", title: "Hikes to see the Goat"),
        .init(id: 6, imageName: "burger", title: "Hikes to see the Goat"),
    ]
    
    var body: some View {
        NavigationView {
            
            List {
                VStack(alignment: .leading) {
                    Text("Trending")
                    ScrollView {
                        VStack(alignment: .leading) {
                            
                        HStack {
//                            Use a foreach array.
                                ForEach(groupView, id: \.id) { group in
                                    NavigationLink(destination: GroupDetailView(
                                        message: group.title
                                    )) {
                                        GroupView(group: group)
                                    }
                            }
                        }
                    }
                        
                    }.frame(height: 200)
                }
                
//                Post rows
                ForEach(posts, id: \.id) { post in
                    PostView(post: post)
                }
                
            }.navigationBarTitle(Text("Users"))
        }
    }
}

struct GroupDetailView: View {
    let message: String
    
    var body: some View {
        VStack {
            Text(message)
        }
    }
}

struct GroupView: View {
    let group: Group
    
    var body: some View {
        VStack (alignment: .leading) {
            Image(group.imageName)
            .resizable()
            .renderingMode(.original)
            .cornerRadius(10)
            .frame(width: 100, height: 100, alignment: .center)
            Text(group.imageName)
            .lineLimit(120)
                .padding(.leading, 0)
        }.frame(width: 107).padding(.leading,0)
    }
}

struct PostView: View {
    let post: Post
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 16) {
            HStack {
                Image(post.imageName)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 60, height: 60)
                    .clipped()
                
                VStack (alignment: .leading, spacing: 4) {
                    Text(post.username).font(.headline)
                    Text("Posted 8 hrs ago").font(.headline)
                    
                }.padding(.leading, 8)
                               
            }.padding(.leading, 16).padding(.top, 16)
            
            VStack {
                Text(post.text)
                    .lineLimit(nil)
                    .padding(.leading, -30)
                    .padding(.horizontal, 30)
                    .padding(.trailing, 70)
            }.padding(.leading, 20)
            
            Image(post.posting)
                   .resizable()
                   .aspectRatio(contentMode: .fit)
                   .frame(width: 500)
            
        }.padding(.leading, -20).padding(.bottom, -8)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
