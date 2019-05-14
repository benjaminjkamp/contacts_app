class Api::ContactsController < ApplicationController

  def index
    @contacts = Contact.all
    render 'index.json.jbuilder' 
  end

  def show
    @contact = Contact.find(params[:id].to_i)
    render 'show.json.jbuilder'
  end

  def create
    @contact = Contact.new(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      latitude: Geocoder.coordinates(params[:address])[0],
      longitude: Geocoder.coordinates(params[:address])[1],
      bio: params[:bio]
      )
    @contact.save
    render 'show.json.jbuilder'
  end

  def update
    @contact = Contact.find(params[:id].to_i)
    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.middle_name = params[:middle_name] || @contact.middle_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.email = params[:email] || @contact.email
    @contact.phone_number = params[:phone_number] || @contact.phone_number
    @contact.bio = params[:bio] || @contact.bio
    @contact.latitude = Geocoder.coordinates(params[:address])[0] || @contact.latitude
    @contact.longitude = Geocoder.coordinates(params[:address])[1] || @contact.longitude
        

    @contact.save
    render 'show.json.jbuilder'
    
  end

  def destroy
    @contact = Contact.find(params[:id].to_i)
    @contact.destroy
    render json:[Contact: "Annihilated..."]
  end

end
