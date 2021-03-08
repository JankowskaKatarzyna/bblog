class LoginPage {
    get usernameField() { return $('[placeholder="Username"]') }
    get passwordField() { return $('[placeholder="Password"]') }
    get submitButton() { return $('[type="submit"]') }

    login(username, password) {
        this.usernameField.setValue(username)
        this.passwordField.setValue(password)
        browser.pause(1000)
        this.submitButton.click()
    }

    testLogin() {
        browser.deleteCookies()
        browser.url('https://candidatex:qa-is-cool@qa-task.backbasecloud.com/#/login')
        const username = 'examplelogin@gmail.com'
        const password = 'example'
        this.login(username, password)
    }

}
export default new LoginPage()