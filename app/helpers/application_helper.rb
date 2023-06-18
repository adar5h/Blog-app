module ApplicationHelper

    def gravatar_for(user, options = {size: 80})
        email_address = user.email.downcase
        hash = Digest::MD5.hexdigest(email_address)
        size = options[:size]
        gravatar_url = "https://gravatar.com/avatar/#{hash}?s=#{size}"
        image_tag(gravatar_url, alt: user.username)
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id] #Memoization to only hit the DB with query when the value isn't there.
    end

    def logged_in?
        !!current_user
    end
end
