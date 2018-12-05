require 'capybara/dsl'

class BbcSignInPage
    include Capybara::DSL 

    SIGN_IN_PAGE_URL = 'https://www.bbc.co.uk/signin'
    SIGN_IN_BUTTON_ID = "#submit-button"
    USERNAME_INPUT_ID = "user-identifier-input"
    PASSWORD_INPUT_ID = "password-input"

    # visits the sign in page
    def visit_sign_in_page
        visit(SIGN_IN_PAGE_URL)
    end

    # click on the sign in button that will take to the sign in form
    def click_sign_in_button
        find(SIGN_IN_BUTTON_ID).click
    end

    #fills in the username input box with a username that does not exist
    def input_invalid_username
        fill_in(USERNAME_INPUT_ID, :with => 'Ruben12ddf')
    end

    #fills in the username input box with a username that exists
    def input_valid_username
        fill_in(USERNAME_INPUT_ID, :with => 'Believe')
    end

    # fills in the password entry with invalid password that is short
    def input_short_password
        fill_in(PASSWORD_INPUT_ID, :with => 'aa12')
    end

    # fills in the password entry with invalid password that uses only letters
    def input_character_only_password
        fill_in(PASSWORD_INPUT_ID, :with => 'aaaaaaaaaa')
    end

    # fills in the password entry with valid password
    def input_acceptable_password
        fill_in(PASSWORD_INPUT_ID, :with => 'qwerty12345')
    end

    # methods that find the error messages on the page, for wrong username, password and general
    def get_general_error_message
        find('#form-message-general').text
    end

    def get_username_error_message
        find('#form-message-username').text
    end

    def get_password_error_message
        find('#form-message-password').text
    end
end