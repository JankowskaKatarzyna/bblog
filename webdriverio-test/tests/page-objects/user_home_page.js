import Page from './page'

class UserHomePage extends Page {
    get globalFeedList() { return $('//a[contains(string(),"Global Feed")]') }

    openGlobalFeedList() {
        this.globalFeedList.click()
    }
}
export default new UserHomePage()