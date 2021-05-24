require 'digest'

class SessionsController < ApplicationController
    def new
    end
  
    def create
      user = Cliente.find_by(correo: params[:session][:email])
      if user
        print user
        clave = params[:session][:password]
        hash = Digest::SHA2.new
        clave = hash.hexdigest(clave)

        if(clave == user[:contrasena])
            log_in user
            redirect_back_or root_path
        else
            message = 'Invalid password'
            render 'new', notice: message
        end
      else
        message = 'Invalid email'
        render 'new', notice: message
      end
    end
  
    def destroy
      log_out
      redirect_to root_url
    end
  end