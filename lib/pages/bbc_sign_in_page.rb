require 'capybara/dsl'

class BbcSignInPage
    include Capybara::DSL 

    SIGN_IN_PAGE_URL = 'https://www.bbc.co.uk/signin'
    SIGN_IN_BUTTON_ID = "#submit-button"
    USERNAME_INPUT_ID = "user-identifier-input"
    PASSWORD_INPUT_ID = "password-input"

    def visit_sign_in_page
        visit(SIGN_IN_PAGE_URL)
    end

    def click_sign_in_button
        find(SIGN_IN_BUTTON_ID).click
    end

    def input_invalid_username
        fill_in(USERNAME_INPUT_ID, :with => 'Ruben12ddf')
    end

    def input_valid_username
        fill_in(USERNAME_INPUT_ID, :with => 'Believe')
    end

    def input_short_password
        fill_in(PASSWORD_INPUT_ID, :with => 'aa12')
    end

    def input_character_only_password
        fill_in(PASSWORD_INPUT_ID, :with => 'aaaaaaaaaa')
    end

    def input_acceptable_password
        fill_in(PASSWORD_INPUT_ID, :with => 'qwerty12345')
    end

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