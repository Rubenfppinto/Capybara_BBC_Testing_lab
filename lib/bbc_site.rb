#superclass - include all pages in here

require_relative 'pages/bbc_homepage'
require_relative 'pages/bbc_sign_in_page'

class BbcSite

    def bbc_homepage
        #instantiate the class bbc_homepage
        BbcHomepage.new
    end

    def bbc_sign_in_page
        #instantiate the class bbc_sign_in_page
        BbcSignInPage.new 
    end
end