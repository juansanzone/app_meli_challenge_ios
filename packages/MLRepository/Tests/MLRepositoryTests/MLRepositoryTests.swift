import XCTest
@testable import MLRepository

final class MLRepositoryTests: XCTestCase {
    func testSetSiteID() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        MeliRepository.siteID = .MLA
        XCTAssertEqual(MeliRepository.siteID, MeliRepository.SiteIDType.MLA)
    }
    
    func testSearchRepository() {
        MeliRepository.siteID = .MLA
        let repo = MeliRepository.search("test")
        XCTAssertEqual(repo.httpMethod, "GET")
        XCTAssertEqual(repo.url?.path, "/sites/MLA/search")
        XCTAssertEqual(repo.url?.query, "q=test")
        XCTAssertEqual(repo.cachePolicy, URLRequest.CachePolicy.reloadIgnoringCacheData)
    }
    
    func testHomeRepository() {
        MeliRepository.siteID = .MLA
        let repo = MeliRepository.home()
        XCTAssertEqual(repo.httpMethod, "GET")
        XCTAssertEqual(repo.url?.path, "/sites/MLA/home")
        XCTAssertEqual(repo.url?.query, nil)
        XCTAssertEqual(repo.cachePolicy, URLRequest.CachePolicy.reloadIgnoringCacheData)
    }
    
    func testDetailRepository() {
        let repo = MeliRepository.detail(id: "test")
        XCTAssertEqual(repo.httpMethod, "GET")
        XCTAssertEqual(repo.url?.path, "/vips/test")
        XCTAssertEqual(repo.url?.query, nil)
        XCTAssertEqual(repo.cachePolicy, URLRequest.CachePolicy.reloadIgnoringCacheData)
    }
    
    func testDetailDescriptionRepository() {
        let repo = MeliRepository.detailDescription(id: "test")
        XCTAssertEqual(repo.httpMethod, "GET")
        XCTAssertEqual(repo.url?.path, "/vips/test/description")
        XCTAssertEqual(repo.url?.query, nil)
        XCTAssertEqual(repo.cachePolicy, URLRequest.CachePolicy.reloadIgnoringCacheData)
    }
    
    func testAutosuggestRepository() {
        let repo = MeliRepository.autosuggest("test")
        XCTAssertEqual(repo.httpMethod, "GET")
        XCTAssertEqual(repo.url?.path, "/sites/MLA/autosuggest")
        XCTAssertEqual(repo.url?.query, "api_version=2&q=test")
        XCTAssertEqual(repo.cachePolicy, URLRequest.CachePolicy.reloadIgnoringCacheData)
    }

    static var allTests = [
        ("testSetSiteID", testSetSiteID),
        ("testSearchRepository", testSearchRepository),
        ("testHomeRepository", testHomeRepository),
        ("testDetailRepository", testDetailRepository),
        ("testDetailDescriptionRepository", testDetailDescriptionRepository),
        ("testAutosuggestRepository", testAutosuggestRepository),
    ]
}
