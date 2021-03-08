Feature: Favorite articles
              In order to create a list of most appreciated articles
              As a logged user
              I am able to add or remove any article from the list of my favorite articles

    Rule: From the Global Feed list level, a user should be able to add/ remove article from the list of my favorite articles
        Background:
            Given I am a logged user
              And I use account login/password: testlogin/example
              And I am on Global Feed list "https://qa-task.backbasecloud.com/#/"
              And There is at least one article visible in the list

        Scenario: [1] Check possibility to add/remove an article to the list of favorite articles
            Given I can see a list of articles
             When I check any article
             Then There is a <favoriteArticleButton> button visible for subjected article

        Scenario: [2] Check if an article is added to the list of favorite articles
            Given I have chosen particular article with status <article_status?>
              And <favoriteArticleButton> button is visible next to article title
             When I check the button background colour for selected article
             Then <favoriteArticleButton> button has backbround-color set to <color?>

                  | <article_status?> | <color?>  |
                  | added             | '#00569c' |
                  | not added         | '#000000' |

        Scenario: [3] Add selected article to the list of favorite articles
            Given I see an article with title "Dolor inventore praesentium vitae nulla et corporis aut."
              And <favoriteArticleButton> button has backbround-color set to '#000000'
             When I click onto <favoriteArticleButton> button next to article title
             Then <favoriteArticleButton> button changes backbround-color to '#00569c'

        Scenario: [4] Remove selected article to the list of favorite articles
            Given I see an article with title "Dolor inventore praesentium vitae nulla et corporis aut."
              And <favoriteArticleButton> button has backbround-color set to '#00569c'
             When I click onto <favoriteArticleButton> button next to article title
             Then <favoriteArticleButton> button changes backbround-color to '#000000'

        Scenario: [5] Add second and any next article to the list of favorite articles
            Given I already added article with tilte "Dolor inventore praesentium vitae nulla et corporis aut." to the list of favorite articles
              And Article with title "Est qui est mollitia." is not added to the list of favorite articles
              And <favoriteArticleButton> button backbround-color for the article with title "Est qui est mollitia." is set to '#000000'
             When I click onto <favoriteArticleButton> button for the article with title "Est qui est mollitia."
             Then Article with tilte "Dolor inventore praesentium vitae nulla et corporis aut." is still added to the list of favorite articles
              And <favoriteArticleButton> button for the article with title "Est qui est mollitia." changes backbround-color to '#00569c'

        Scenario: [6] Removing particular article does not affect the remaining articles added to the list of favorite articles
            Given I have two articles: "Dolor inventore praesentium vitae nulla et corporis aut." and "Est qui est mollitia." added to the list of favorite articles
              And <favoriteArticleButton> buttons for both articles have backbround-color set to '#00569c'
             When I click onto <favoriteArticleButton> button for the article with title "Est qui est mollitia."
             Then Article with tilte "Dolor inventore praesentium vitae nulla et corporis aut." is still added to the list of favorite articles
              And Its <favoriteArticleButton> button backbround-color is set to '#00569c'
              And Article with title "Est qui est mollitia." is not longer added to the list of favorite articles
              And Its <favoriteArticleButton> button backbround-color is set to '#000000'

        Scenario: [7] Counter in <favoriteArticleButton> button should be updated after user action
            Given I see an article with title "Dolor inventore praesentium vitae nulla et corporis aut."
              And <favoriteArticleButton> button has backbround-color set to <color?>
              And <favoriteArticleButton> button has counter set to <counter_value?>
             When I click onto <favoriteArticleButton> button next to article title
             Then Counter in <favoriteArticleButton> button is <counter_action?> and its value changed to <new_counter_value?>

                  | <color?>  | <counter_value?> | <counter_action?> | <new_counter_value?> |
                  | '#00569c' | 1                | decrementing      | 0                    |
                  | '#000000' | 0                | incrementing      | 1                    |

    Rule: From the user profile page level, a user should be able to enter and manage a  list of favorite articles
        Background:
            Given I am a logged user
              And I use account login/password: testlogin/example
              And I am on user profile page "https://qa-task.backbasecloud.com/#/profile/testlogin"

        Scenario: [8] Enter the list of favorite articles
            Given I see two tabs in horizontal navigation bar "My Articles" and "Favorited Articles"
             When I click onto "Favorited Articles" tab header
             Then I am redirected to  "Favorite Articles" tab "https://qa-task.backbasecloud.com/#/profile/testlogin/favorites"

        Scenario: [9] Check if I have any article added the list of favorite articles
            Given I am on "Favorite Articles" tab
             When I <select_action?> article added to the list of favorite articles
             Then I see <select_result?>

                  | <select_action?> | <select_result?>                    |
                  | have an          | list of added articles              |
                  | don't have any   | info "No articles are here... yet." |

        Scenario: [10] Check if selected article is displayed on the list of favorite articles after user action on Global Feed list
            Given I clicked <favoriteArticleButton> button for "Est qui est mollitia." article on Global Feed list to add article to the list of favorite articles
             When I enter "Favorite Articles" tab
             Then I see article with title "Est qui est mollitia." on the list of favorite articles

        Scenario: [11] Check if selected article is removed from the list of favorite articles after user action on Global Feed list
            Given I clicked <favoriteArticleButton> button for "Est qui est mollitia." article on Global Feed list to remove article from the list of favorite articles
             When I enter "Favorite Articles" tab
             Then I don't see article with title "Est qui est mollitia." on the list of favorite articles

        Scenario: [12] Check if selected article is added to the list of favorite articles after user action on particular article page in header section
            Given I clicked <favoritePostHeaderButton> button for "Est qui est mollitia." article on article page to add article to the list of favorite articles
             When I enter "Favorite Articles" tab
             Then I see article with title "Est qui est mollitia." on the list of favorite articles

        Scenario: [13] Check if selected article is removed from the list of favorite articles after user action on particular article page in header section
            Given I clicked <favoritePostHeaderButton> button for "Est qui est mollitia." article on article page to remove article to the list of favorite articles
             When I enter "Favorite Articles" tab
             Then I don't see article with title "Est qui est mollitia." on the list of favorite articles

        Scenario: [14] Check if selected article is added to the list of favorite articles after user action on particular article page in comment section
            Given I clicked <favoritePostCommentButton> button for "Est qui est mollitia." article on article page to add article to the list of favorite articles
             When I enter "Favorite Articles" tab
             Then I see article with title "Est qui est mollitia." on the list of favorite articles

        Scenario: [15] Check if selected article is removed from the list of favorite articles after user action on particular article page in comment section
            Given I clicked <favoritePostCommentButton> button for "Est qui est mollitia." article on article page to remove article to the list of favorite articles
             When I enter "Favorite Articles" tab
             Then I don't see article with title "Est qui est mollitia." on the list of favorite articles

        Scenario: [16] Enter particular article from the list of favorite articles
            Given I am on "Favorite Articles" tab
              And I see article with title "Dolor inventore praesentium vitae nulla et corporis aut." on the list of favorite articles
             When I click onto article title "Dolor inventore praesentium vitae nulla et corporis aut."
             Then I am redirected to the article page "https://qa-task.backbasecloud.com/#/article/dolor-inventore-praesentium-vitae-nulla-et-corporis-aut-12pfap"

        Scenario: [17] Remove particular article from the list of favorite articles
            Given I am on "Favorite Articles" tab
              And I see the article with title "Dolor inventore praesentium vitae nulla et corporis aut." on the list of favorite articles
              And There is a <favoriteArticleButton2> button visible for subjected article
             When I click onto <favoriteArticleButton2> button for subjected article
              And I reload page
             Then I no longer see the article with title "Dolor inventore praesentium vitae nulla et corporis aut." on the list of favorite articles

        Scenario: [18] Removing particular article does not affect the remaining articles added to the list of favorite articles
            Given I am on "Favorite Articles" tab
              And I have two articles: "Dolor inventore praesentium vitae nulla et corporis aut." and "Est qui est mollitia." added to the list of favorite articles
              And <favoriteArticleButton2> buttons for both articles are visible
             When I click onto <favoriteArticleButton2> button for the article with title "Est qui est mollitia."
              And I reload page
             Then Article with tilte "Dolor inventore praesentium vitae nulla et corporis aut." is still visible the list of favorite articles
              And Its <favoriteArticleButton2> button is visible
              And Article with title "Est qui est mollitia." is not longer visible on the list of favorite articles

    Rule: From an article page level, a user should be able to add/ remove particular article from the list of favorite articles
        Background:
            Given I am a logged user
              And I use account login/password: testlogin/example
              And I am on an article page "https://qa-task.backbasecloud.com/#/article/dolor-inventore-praesentium-vitae-nulla-et-corporis-aut-12pfap"

        Scenario: [19] Check <favoritePostHeaderButton> button visibility in header section
            Given I see an article page
             When I scroll page to the header section of article
             Then There is a <favoritePostHeaderButton> button visible for subjected article

        Scenario: [20] Check <favoritePostCommentButton> button visibility in comment section
            Given I see an article page
             When I scroll page to the comment section of article
             Then There is a <favoritePostCommentButton> button visible for subjected article

        Scenario: [21] Check if particular article is added the list of favorite articles
            Given I see an article page
             When The article <article_status?> added to the list of favorite articles
             Then <favoritePostHeaderButton> and <favoritePostCommentButton> buttons have text equals to <button_text?>

                  | <article_status?> | <button_text?>        |
                  | is                | "Unfavorite Post (1)" |
                  | is not            | "Favorite Post (0)"   |

              And <button_text?> for <favoritePostHeaderButton> button in header section is equal to <button_text?> for <favoritePostCommentButton> button in comment section

        Scenario: [22] Add selected article to the list of favorite articles using <favoritePostHeaderButton>  button from header section
            Given I see an article page
              And <favoritePostHeaderButton> button in header section has text "Favorite Post (0)"
              And <favoritePostCommentButton> button in comment section has text "Favorite Post (0)"
             When I click onto <favoriteArticleHeaderButton> button
             Then <favoritePostHeaderButton> button in header section has text "Unfavorite Post (1)"
              And <favoritePostCommentButton> button in comment section has text "Unfavorite Post (1)"

        Scenario: [23] Add selected article to the list of favorite articles using <favoritePostCommentButton>  button from comment section
            Given I see an article page
              And <favoritePostHeaderButton> button in header section has text "Favorite Post (0)"
              And <favoritePostCommentButton> button in comment section has text "Favorite Post (0)"
             When I click onto <favoriteArticleCommentButton> button
             Then <favoritePostHeaderButton> button in header section has text "Unfavorite Post (1)"
              And <favoritePostCommentButton> button in comment section has text "Unfavorite Post (1)"

        Scenario: [24] Remove selected article to the list of favorite articles using <favoritePostHeaderButton>  button from header section
            Given I see an article page
              And <favoritePostHeaderButton> button in header section has text "Unfavorite Post (1)"
              And <favoritePostCommentButton> button in comment section has text "Unfavorite Post (1)"
             When I click onto <favoriteArticleHeaderButton> button
             Then <favoritePostHeaderButton> button in header section has text "Favorite Post (0)"
              And <favoritePostCommentButton> button in comment section has text "Favorite Post (0)"

        Scenario: [25] Add selected article to the list of favorite articles using <favoritePostCommentButton>  button from comment section
            Given I see an article page
              And <favoritePostHeaderButton> button in header section has text "Unfavorite Post (1)"
              And <favoritePostCommentButton> button in comment section has text "Unfavorite Post (1)"
             When I click onto <favoriteArticleCommentButton> button
             Then <favoritePostHeaderButton> button in header section has text "Favorite Post (0)"
              And <favoritePostCommentButton> button in comment section has text "Favorite Post (0)"

    Rule: Only logged users should have possibility to create and manage a list of favorite articles
        Background:
            Given I am not a logged user
              And I am on Global Feed list "https://qa-task.backbasecloud.com/#/"
              And There is at least one article visible in the list

        Scenario: [26] Check possibility to add/remove an article to the list of favorite articles
            Given I can see a list of articles
             When I check any article
             Then <favoriteArticleButton> button for subjected article is not visible



