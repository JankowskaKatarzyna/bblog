export default class Page {
    get userProfile() { return $('[href="#/profile/testlogin"]') }
    get newPostIcon() { return $('.ion-compose') }
    get articleList() { return $('app-article-list') }
    get articleListItems() { return $$('app-article-list-item') }

    openUserProfile() {
        this.userProfile.click()
    }

    getArticleListItem(index) {
        return this.articleListItems[index]
    }

    getArticleListItems() {
        return this.articleListItems
    }

    toggleFavoriteArticleButton(articleListItem) {
        articleListItem.$('button').click()
    }

    getButtonBackgroundColor(articleListItem) {
        return articleListItem.$('button').getCSSProperty('background-color').parsed.hex
    }
}