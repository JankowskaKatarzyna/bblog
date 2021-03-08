import Page from './page'

class UserProfilePage extends Page {
    get favoritedArticlesList() { return $('[href="#/profile/testlogin/favorites"]') }
    get userAvatar() { return $('.user-img') }

    openFavoritedArticlesList() {
        this.favoritedArticlesList.click()
    }
}
export default new UserProfilePage()