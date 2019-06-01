class Api::ContactsController < ApplicationController

  before_action :authenticate_user

  def index
    @contacts = current_user.contacts
    if params[:search]
      @contacts = @contacts.where("first_name iLike ? OR last_name iLike ? OR phone_number iLike ? OR email iLike ?" , "%#{params[:search]}%",  "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%",)
    end
    if params[:group]
      @contacts = @contacts.where(contact.groups[])


    render 'index.json.jbuilder' 
  end

  def show
    
    @contact = Contact.find(params[:id].to_i)

    if @contact.user_id == current_user.id
      render 'show.json.jbuilder'
    else
      render json:{}
    end
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
      bio: params[:bio],
      user_id: current_user.id
      )
    if @contact.save
      render 'show.json.jbuilder'
    else
      render json:{errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end
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
        

    if @contact.save
      render 'show.json.jbuilder'
    else
      render json:{errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end
    
  end

  def destroy
    @contact = Contact.find(params[:id].to_i)
    @contact.destroy
    render json:[Contact: "Annihilated..."]
  end

end
