import Vapor
import ModelProtocols

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    let techTalkController = TechTalkController()
    router.get("techTalks", use: techTalkController.index)
    router.post("techTalks", use: techTalkController.create)
    
    let reviewController = ReviewController()
    router.post("reviews", use: reviewController.create)
    
    let speakerController = SpeakerController()
    router.post("speakers", use: speakerController.create)
}
