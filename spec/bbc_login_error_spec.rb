require 'spec_helper'

describe 'Incorrect user details produces valid error' do
    
    context 'it should respond with the correct error when incorrect details are input' do

        it 'should produce an error clicking sign-in with blank fields' do
            @bbc_site = BbcSite.new
            @bbc_site.bbc_homepage.visit_homepage
            @bbc_site.bbc_homepage.click_sign_in_link
            @bbc_site.bbc_sign_in_page.click_sign_in_button
            expect(@bbc_site.bbc_sign_in_page.get_general_error_message).to eq "Sorry, those details don't match. Check you've typed them correctly."
            expect(@bbc_site.bbc_sign_in_page.get_password_error_message).to eq "Something's missing. Please check and try again."
            expect(@bbc_site.bbc_sign_in_page.get_password_error_message).to eq "Something's missing. Please check and try again."
        end
        
        it 'should produce a general error message and password when inputting an incorrect username' do
            @bbc_site = BbcSite.new
            @bbc_site.bbc_homepage.visit_homepage
            @bbc_site.bbc_homepage.click_sign_in_link 
            @bbc_site.bbc_sign_in_page.input_invalid_username
            @bbc_site.bbc_sign_in_page.click_sign_in_button
            expect(@bbc_site.bbc_sign_in_page.get_general_error_message).to eq "Sorry, those details don't match. Check you've typed them correctly."
            expect(@bbc_site.bbc_sign_in_page.get_password_error_message).to eq "Something's missing. Please check and try again."
        end

        it 'should produce an invalid username message when the username does not exist but the password is valid' do
            @bbc_site = BbcSite.new
            @bbc_site.bbc_homepage.visit_homepage
            @bbc_site.bbc_homepage.click_sign_in_link 
            @bbc_site.bbc_sign_in_page.input_invalid_username
            @bbc_site.bbc_sign_in_page.input_acceptable_password
            @bbc_site.bbc_sign_in_page.click_sign_in_button
            expect(@bbc_site.bbc_sign_in_page.get_username_error_message).to eq "Sorry, we can’t find an account with that username. If you're over 13, try your email address instead or get help here."
        end

        it 'should produce error message for when the password is too short' do
            @bbc_site = BbcSite.new
            @bbc_site.bbc_homepage.visit_homepage
            @bbc_site.bbc_homepage.click_sign_in_link
            @bbc_site.bbc_sign_in_page.input_short_password
            @bbc_site.bbc_sign_in_page.click_sign_in_button
            expect(@bbc_site.bbc_sign_in_page.get_password_error_message).to eq "Sorry, that password is too short. It needs to be eight characters or more."
        end

        it 'should produce an error message when password only contain letters' do
            @bbc_site = BbcSite.new
            @bbc_site.bbc_homepage.visit_homepage
            @bbc_site.bbc_homepage.click_sign_in_link
            @bbc_site.bbc_sign_in_page.input_character_only_password
            @bbc_site.bbc_sign_in_page.click_sign_in_button
            expect(@bbc_site.bbc_sign_in_page.get_password_error_message).to eq "Sorry, that password isn't valid. Please include something that isn't a letter."
        end

        it 'should produce an error message when the wrong password is used to login an existing account' do
            @bbc_site = BbcSite.new
            @bbc_site.bbc_homepage.visit_homepage
            @bbc_site.bbc_homepage.click_sign_in_link
            @bbc_site.bbc_sign_in_page.input_valid_username
            @bbc_site.bbc_sign_in_page.input_acceptable_password
            @bbc_site.bbc_sign_in_page.click_sign_in_button
            expect(@bbc_site.bbc_sign_in_page.get_password_error_message).to eq "Uh oh, that password doesn’t match that account. Please try again."
        end

        it 'should sleep' do
            sleep 5
        end
    end
end