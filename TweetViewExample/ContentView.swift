//
//  ContentView.swift
//  TweetViewExample
//
//  Created by Tetsuo Kawakami on 2023/12/03.
//

import SwiftUI

struct Tweet: Identifiable {
    var id = UUID()
    var username: String
    var body: String
}

struct TweetView: View {
    var tweet: Tweet

    var body: some View {
        VStack(alignment: .leading) {
            Text(tweet.username)
                .font(.headline)
            Text(tweet.body)
                .font(.body)
        }
        .padding()
        .border(Color.gray, width: 1)
    }
}

struct ContentView: View {
    @State private var newTweetText: String = ""
    
    @State var tweets: [Tweet] = [
        Tweet(username: "User1", body: "This is my first tweet!"),
        Tweet(username: "User2", body: "Excited to be on Twitter!"),
        // Add more tweets as needed
    ]

    var body: some View {
        NavigationView {
            VStack {
                List(tweets) { tweet in
                    TweetView(tweet: tweet)
                }
                .listStyle(InsetListStyle())

                HStack {
                    TextField("What's happening?", text: $newTweetText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button(action: {
                        // Add a new tweet to the list
                        tweets.append(Tweet(username: "CurrentUser", body: newTweetText))
                        newTweetText = ""
                    }) {
                        Text("Tweet")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding()
            }
            .navigationTitle("Twitter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
