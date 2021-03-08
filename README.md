# bblog 
Favorite articles automated test
In repo you will find:
/testCases - with feature file with a set of most important test scenarios for favorite articles functionality
/webdriverio-test - automated test created with Webdriver.io 
Test user credentials: login/password: testlogin/example

How to run test

Install and usage:
1. Go to webdriverio-test then ```npm install```
2. To run tests enter ```npx wdio wdio.conf.js --spec ./tests/favorite_articles.js``` on the command line
3. Test scripts are located in webdriverio-test/tests folder
4. Page objects are located in webdriverio-test/tests/page-objects folder
5. Reports are located in webdriverio-test/reports folder
6. To open a master report you can use link https://htmlpreview.github.io/?https://github.com/JankowskaKatarzyna/bblog/blob/main/webdriverio-test/reports/html-reports/master-report.html
