class BbcHomepage
    include Capybara::DSL
    #page objects
    #constant is always caps
    HOMEPAGE = 'https://www.bbc.co.uk'
    SIGN_IN_LINK_ID = '#idcta-link' #id for the sign in button on BBC website

    def visit_homepage
        visit(HOMEPAGE)
    end

    def sign_in_link 
        find(SIGN_IN_LINK_ID)
    end

    def click_sign_in_link
        find(SIGN_IN_LINK_ID).click
    end
end