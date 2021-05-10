//
//  RSSViewModel.swift
//  AppleMusic
//
//  Created by Alex Peterson on 5/6/21.
//

import Foundation
import Alamofire

class AlbumViewModel: ObservableObject {
    
    @Published var albums: [Album] = [Album]()
    @Published var explicit: Bool = true
    
    private let webService: WebService
    
    init(dataService: WebService = WebService()) {
        self.webService = dataService
    }
    
    func handleOnAppear() {
        webService.fetchAlamoFire(url:  "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/25/explicit.json") { albums in
            self.albums = albums!
        }
        
//        dataService.fetchURLSession(url: URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/25/explicit.json")!) { albums in
//            self.albums = albums!
//        }
    }
    
    func handleTestDataOnAppear() {
        self.albums = [
            Album(id: "1557600260", artistName: "RodWave", name: "SoulFly", contentAdvisoryRating: "Explicit", artworkUrl100: "https://is3-ssl.mzstatic.com/image/thumb/Music114/v4/83/8a/6b/838a6b08-6abc-552e-409b-0081638ff263/19027.jpg/200x200bb.png", url:  "https://music.apple.com/us/album/soulfly/1557600260?app=music"),
            Album(id:"1552791073", artistName: "Taylor Swift", name: "Fearless (Taylor's Version)", contentAdvisoryRating: "", artworkUrl100: "https://is2-ssl.mzstatic.com/image/thumb/Music124/v4/e0/d7/50/e0d750e8-b290-a8ff-88fe-8cbed749120c/21UMGIM09915.rgb.jpg/200x200bb.png", url:  "https://music.apple.com/us/album/fearless-taylors-version/1552791073?app=music"),
            Album(id: "1560923807", artistName: "MO3", name: "Shottaz 4Eva", contentAdvisoryRating: "Explicit", artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Music114/v4/27/07/bd/2707bd16-ff8c-01ee-02f2-a0d8ca873650/194690477201_cover.jpg/200x200bb.png", url:  "https://music.apple.com/us/album/shottaz-4eva/1560923807?app=music"),
            Album(id: "1561058084", artistName: "Justin Bieber", name: "Justice (Triple Chucks Deluxe / Deluxe Video Version)", contentAdvisoryRating: "Explicit", artworkUrl100: "https://is3-ssl.mzstatic.com/image/thumb/Music114/v4/fa/96/2d/fa962da6-7d09-fd32-6dc2-bc935d3f2d45/21UMGIM20642.rgb.jpg/200x200bb.png", url: "https://music.apple.com/us/album/justice-triple-chucks-deluxe-deluxe-video-version/1561058084?app=music"),
            Album(id: "1559775393", artistName: "Lil Tjay", name: "Destined 2 Win", contentAdvisoryRating: "Explicit", artworkUrl100: "https://is2-ssl.mzstatic.com/image/thumb/Music114/v4/98/37/c9/9837c9d2-9691-9877-1456-b5ceaa35fef8/886449173587.jpg/200x200bb.png", url: "https://music.apple.com/us/album/destined-2-win/1559775393?app=music"),
            Album(id: "1557600260", artistName: "RodWave", name: "SoulFly", contentAdvisoryRating: "Explicit", artworkUrl100: "https://is3-ssl.mzstatic.com/image/thumb/Music114/v4/83/8a/6b/838a6b08-6abc-552e-409b-0081638ff263/19027.jpg/200x200bb.png", url:  "https://music.apple.com/us/album/soulfly/1557600260?app=music"),
            Album(id:"1552791073", artistName: "Taylor Swift", name: "Fearless (Taylor's Version)", contentAdvisoryRating: "", artworkUrl100: "https://is2-ssl.mzstatic.com/image/thumb/Music124/v4/e0/d7/50/e0d750e8-b290-a8ff-88fe-8cbed749120c/21UMGIM09915.rgb.jpg/200x200bb.png", url:  "https://music.apple.com/us/album/fearless-taylors-version/1552791073?app=music"),
            Album(id: "1560923807", artistName: "MO3", name: "Shottaz 4Eva", contentAdvisoryRating: "Explicit", artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Music114/v4/27/07/bd/2707bd16-ff8c-01ee-02f2-a0d8ca873650/194690477201_cover.jpg/200x200bb.png", url:  "https://music.apple.com/us/album/shottaz-4eva/1560923807?app=music"),
            Album(id: "1561058084", artistName: "Justin Bieber", name: "Justice (Triple Chucks Deluxe / Deluxe Video Version)", contentAdvisoryRating: "Explicit", artworkUrl100: "https://is3-ssl.mzstatic.com/image/thumb/Music114/v4/fa/96/2d/fa962da6-7d09-fd32-6dc2-bc935d3f2d45/21UMGIM20642.rgb.jpg/200x200bb.png", url: "https://music.apple.com/us/album/justice-triple-chucks-deluxe-deluxe-video-version/1561058084?app=music"),
            Album(id: "1559775393", artistName: "Lil Tjay", name: "Destined 2 Win", contentAdvisoryRating: "Explicit", artworkUrl100: "https://is2-ssl.mzstatic.com/image/thumb/Music114/v4/98/37/c9/9837c9d2-9691-9877-1456-b5ceaa35fef8/886449173587.jpg/200x200bb.png", url: "https://music.apple.com/us/album/destined-2-win/1559775393?app=music"),
            Album(id: "1557600260", artistName: "RodWave", name: "SoulFly", contentAdvisoryRating: "Explicit", artworkUrl100: "https://is3-ssl.mzstatic.com/image/thumb/Music114/v4/83/8a/6b/838a6b08-6abc-552e-409b-0081638ff263/19027.jpg/200x200bb.png", url:  "https://music.apple.com/us/album/soulfly/1557600260?app=music"),
            Album(id:"1552791073", artistName: "Taylor Swift", name: "Fearless (Taylor's Version)", contentAdvisoryRating: "", artworkUrl100: "https://is2-ssl.mzstatic.com/image/thumb/Music124/v4/e0/d7/50/e0d750e8-b290-a8ff-88fe-8cbed749120c/21UMGIM09915.rgb.jpg/200x200bb.png", url:  "https://music.apple.com/us/album/fearless-taylors-version/1552791073?app=music"),
            Album(id: "1560923807", artistName: "MO3", name: "Shottaz 4Eva", contentAdvisoryRating: "Explicit", artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Music114/v4/27/07/bd/2707bd16-ff8c-01ee-02f2-a0d8ca873650/194690477201_cover.jpg/200x200bb.png", url:  "https://music.apple.com/us/album/shottaz-4eva/1560923807?app=music"),
            Album(id: "1561058084", artistName: "Justin Bieber", name: "Justice (Triple Chucks Deluxe / Deluxe Video Version)", contentAdvisoryRating: "Explicit", artworkUrl100: "https://is3-ssl.mzstatic.com/image/thumb/Music114/v4/fa/96/2d/fa962da6-7d09-fd32-6dc2-bc935d3f2d45/21UMGIM20642.rgb.jpg/200x200bb.png", url: "https://music.apple.com/us/album/justice-triple-chucks-deluxe-deluxe-video-version/1561058084?app=music"),
            Album(id: "1559775393", artistName: "Lil Tjay", name: "Destined 2 Win", contentAdvisoryRating: "Explicit", artworkUrl100: "https://is2-ssl.mzstatic.com/image/thumb/Music114/v4/98/37/c9/9837c9d2-9691-9877-1456-b5ceaa35fef8/886449173587.jpg/200x200bb.png", url: "https://music.apple.com/us/album/destined-2-win/1559775393?app=music"),
            Album(id: "1557600260", artistName: "RodWave", name: "SoulFly", contentAdvisoryRating: "Explicit", artworkUrl100: "https://is3-ssl.mzstatic.com/image/thumb/Music114/v4/83/8a/6b/838a6b08-6abc-552e-409b-0081638ff263/19027.jpg/200x200bb.png", url:  "https://music.apple.com/us/album/soulfly/1557600260?app=music"),
            Album(id:"1552791073", artistName: "Taylor Swift", name: "Fearless (Taylor's Version)", contentAdvisoryRating: "", artworkUrl100: "https://is2-ssl.mzstatic.com/image/thumb/Music124/v4/e0/d7/50/e0d750e8-b290-a8ff-88fe-8cbed749120c/21UMGIM09915.rgb.jpg/200x200bb.png", url:  "https://music.apple.com/us/album/fearless-taylors-version/1552791073?app=music"),
            Album(id: "1560923807", artistName: "MO3", name: "Shottaz 4Eva", contentAdvisoryRating: "Explicit", artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Music114/v4/27/07/bd/2707bd16-ff8c-01ee-02f2-a0d8ca873650/194690477201_cover.jpg/200x200bb.png", url:  "https://music.apple.com/us/album/shottaz-4eva/1560923807?app=music"),
            Album(id: "1561058084", artistName: "Justin Bieber", name: "Justice (Triple Chucks Deluxe / Deluxe Video Version)", contentAdvisoryRating: "Explicit", artworkUrl100: "https://is3-ssl.mzstatic.com/image/thumb/Music114/v4/fa/96/2d/fa962da6-7d09-fd32-6dc2-bc935d3f2d45/21UMGIM20642.rgb.jpg/200x200bb.png", url: "https://music.apple.com/us/album/justice-triple-chucks-deluxe-deluxe-video-version/1561058084?app=music"),
            Album(id: "1559775393", artistName: "Lil Tjay", name: "Destined 2 Win", contentAdvisoryRating: "Explicit", artworkUrl100: "https://is2-ssl.mzstatic.com/image/thumb/Music114/v4/98/37/c9/9837c9d2-9691-9877-1456-b5ceaa35fef8/886449173587.jpg/200x200bb.png", url: "https://music.apple.com/us/album/destined-2-win/1559775393?app=music"),
            Album(id: "1557600260", artistName: "RodWave", name: "SoulFly", contentAdvisoryRating: "Explicit", artworkUrl100: "https://is3-ssl.mzstatic.com/image/thumb/Music114/v4/83/8a/6b/838a6b08-6abc-552e-409b-0081638ff263/19027.jpg/200x200bb.png", url:  "https://music.apple.com/us/album/soulfly/1557600260?app=music"),
            Album(id:"1552791073", artistName: "Taylor Swift", name: "Fearless (Taylor's Version)", contentAdvisoryRating: "", artworkUrl100: "https://is2-ssl.mzstatic.com/image/thumb/Music124/v4/e0/d7/50/e0d750e8-b290-a8ff-88fe-8cbed749120c/21UMGIM09915.rgb.jpg/200x200bb.png", url:  "https://music.apple.com/us/album/fearless-taylors-version/1552791073?app=music"),
            Album(id: "1560923807", artistName: "MO3", name: "Shottaz 4Eva", contentAdvisoryRating: "Explicit", artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Music114/v4/27/07/bd/2707bd16-ff8c-01ee-02f2-a0d8ca873650/194690477201_cover.jpg/200x200bb.png", url:  "https://music.apple.com/us/album/shottaz-4eva/1560923807?app=music"),
            Album(id: "1561058084", artistName: "Justin Bieber", name: "Justice (Triple Chucks Deluxe / Deluxe Video Version)", contentAdvisoryRating: "Explicit", artworkUrl100: "https://is3-ssl.mzstatic.com/image/thumb/Music114/v4/fa/96/2d/fa962da6-7d09-fd32-6dc2-bc935d3f2d45/21UMGIM20642.rgb.jpg/200x200bb.png", url: "https://music.apple.com/us/album/justice-triple-chucks-deluxe-deluxe-video-version/1561058084?app=music"),
            Album(id: "1559775393", artistName: "Lil Tjay", name: "Destined 2 Win", contentAdvisoryRating: "Explicit", artworkUrl100: "https://is2-ssl.mzstatic.com/image/thumb/Music114/v4/98/37/c9/9837c9d2-9691-9877-1456-b5ceaa35fef8/886449173587.jpg/200x200bb.png", url: "https://music.apple.com/us/album/destined-2-win/1559775393?app=music")
        ]
    }
}
