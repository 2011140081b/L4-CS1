class ApplicationController < ActionController::Base
    def L4
        session[:c] ||= 0 #←遅延初期化というテク。ぜひ覚えて欲しい。
        session[:c] = session[:c].to_i + 1
        render plain: session[:c]
        session.delete(:c)
        
    end
    
    def main
        if session[:login_uid] != nil then
            render "main"
        else
            render "login"
        end
        
    end
    def login 
        id = params[:uid]
        pass = params[:pass]
        if id =="kindai" && pass == "sanriko" then
            session[:login_uid] = id
            redirect_to root_path
    
            
        else
            render "error"
        end
            
        
    end
end
