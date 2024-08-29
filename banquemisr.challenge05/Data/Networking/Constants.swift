//
//  Constants.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Maamoun on 29/08/2024.
//

import Foundation
class Constants {
    
    public static var shared:Constants = Constants()
    
    public var apiKey:String {
        get {
            return "cf2d13de0bc3ea47718f7de8f14a0167"
        }
    }
    
    public var accessToken:String {
        get {
            return "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZjJkMTNkZTBiYzNlYTQ3NzE4ZjdkZThmMTRhMDE2NyIsIm5iZiI6MTcyNDg4Mzc3My4zOTg1MzgsInN1YiI6IjY2Y2ZhMDA1YzkxYmRjNmQxYjJiOWRkYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ._Qqn51kO5hA8CnUlwdJhiYImvKSd-NGKU2yeBTALJhs"
        }
    }
    
    public var UP_COMMING_API : String {
        get {
            return "https://api.themoviedb.org/3/movie/upcoming"
        }
    }
    public var POPULAR_Api : String {
        get {
            return "https://api.themoviedb.org/3/movie/popular"
        }
    }
    public var NOW_PLAYING_API : String {
        get {
            return "https://api.themoviedb.org/3/movie/now_playing"
        }
    }
    public var IMAGE_BASE_URL : String {
        get {
            return "https://image.tmdb.org/t/p/w500"
        }
    }
}
