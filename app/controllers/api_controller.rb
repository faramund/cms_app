class ApiController < ApplicationController
  def get_next_after
    name_of_page = params[:name_of_page]
    id = params[:id]
    if Micropost.exists?(id)
      micropost = Micropost.find(id)
      us = micropost.user 
      if us.name_of_page == name_of_page and us.microposts.where("id > ?", id).order("id ASC").first
        next_micropost = us.microposts.where("id > ?", id).order("id ASC").first
        render :status=>201,
            json: {
              status:201,
              id: next_micropost.id,
              content: next_micropost.content
            }
      else
        render :status=>201,
          json: {
            status:401,
            text: "brak strony z takim id"

          }
      end    
    else
      render :status=>201,
        json: {
          status:401,
          text: "brak takiego id"
        }
    end     
  end

  def get_first
    name_of_page = params[:name_of_page]
    us = User.find_by_name_of_page(name_of_page)
    if us  
      if us.microposts.first
        micropost = us.microposts.first
        render :status=>201,
            json: {
              status:201,
              id: micropost.id,
              content: micropost.content
            }
      else
        render :status=>201,
          json: {
            status:401,
            text: "brak zawartosci strony "

          }
      end    
    else
      render :status=>201,
        json: {
          status:401,
          text: "brak takiej strony w bazie"
        }
    end
  end
end
