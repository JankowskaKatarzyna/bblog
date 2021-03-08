import login_page from './page-objects/login_page'
import user_home_page from './page-objects/user_home_page'
import user_profile_page from './page-objects/user_profile_page'


describe('Favorite articles', () => {
    beforeEach(() => {
        login_page.testLogin()
        user_home_page.newPostIcon.waitForExist()
    })

    afterEach(() => {
        // TODO Add cleanup after each test.
    })

    it('[3] Add selected article to the list of favorite articles', () => {
        // Given
        user_home_page.openGlobalFeedList()
        waitUntilAllElementsAreRendered(0)
        const article = user_home_page.getArticleListItem(0)
        let bg_color = user_home_page.getButtonBackgroundColor(article)
        expect(bg_color).toBe('#000000')

        // When
        user_home_page.toggleFavoriteArticleButton(article)

        // Then
        bg_color = user_home_page.getButtonBackgroundColor(article)
        expect(bg_color).toBe('#00569c')

    })

    it('[18] Removing particular article does not affect the remaining articles added to the list of favorite articles', () => {
        // Given
        user_home_page.openGlobalFeedList()
        waitUntilAllElementsAreRendered(2)
        const firstArticle = user_home_page.getArticleListItem(1)
        user_home_page.toggleFavoriteArticleButton(firstArticle)
        const secondArticle = user_home_page.getArticleListItem(2)
        user_home_page.toggleFavoriteArticleButton(secondArticle)
        user_home_page.openUserProfile()
        user_profile_page.userAvatar.waitForExist()
        user_profile_page.openFavoritedArticlesList()
        waitUntilAllElementsAreRendered(user_home_page.getArticleListItems().length)

        expect(user_home_page.getArticleListItems().length).toBe(3)

        expect(user_home_page.getArticleListItem(0).$('button')).toBeDisplayed()
        expect(user_home_page.getArticleListItem(1).$('button')).toBeDisplayed()
        expect(user_home_page.getArticleListItem(2).$('button')).toBeDisplayed()

        // When
        user_home_page.toggleFavoriteArticleButton(user_home_page.getArticleListItem(1))

        browser.refresh()
        waitUntilAllElementsAreRendered(user_home_page.getArticleListItems().length)

        // Then
        expect(user_home_page.getArticleListItems().length).toBe(2)
        expect(user_home_page.getArticleListItem(0).$('button')).toBeDisplayed()
    })


    const waitUntilAllElementsAreRendered = (articleLength) => {
        browser.waitUntil(() => user_home_page.getArticleListItem(articleLength) !== undefined, {
            timeout: 2000,
            timeoutMsg: 'Failed to fetch articles list'
        })
    }
})