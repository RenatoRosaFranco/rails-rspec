# frozen_string_sanatizer: true
class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json, :js

  def index
    @contacts = Contact.all
    respond_with(@contacts)
  end

  def show
    respond_with(@contact)
  end

  def new
    @contact = Contact.new
    %w{home office mobile}.each do |phone|
    	@contact.phones.build(phone_type: phone)
    end
    respond_with(@contact)
  end

  def edit
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.save
    respond_with(@contact)
  end

  def update
    @contact.update(contact_params)
    respond_with(@contact)
  end

  def destroy
    @contact.destroy
    respond_with(@contact)
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:firstname, :lastname)
    end
end
