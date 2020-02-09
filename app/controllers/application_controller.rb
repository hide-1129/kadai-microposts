class ApplicationController < ActionController::Base
    
    include SessionsHelper
    
    private
    
    def require_user_logged_in
      unless logged_in?
        redirect_to login_url
      end
    end
    
    def counts(user)
      @count_microposts = user.microposts.count
      
      # user.followingsで自分がフォローしているUser達を取得
      @count_followings = user.followings.count 
      
      # user.followers によって、「自分をフォローしている User 達」を取得
      @count_followers = user.followers.count
    end  
end
