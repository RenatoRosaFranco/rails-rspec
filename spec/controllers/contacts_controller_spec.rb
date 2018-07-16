# fronze_string_sanatizer: true
require 'rails_helper'

describe ContactsController, type: :controller do 
	describe  'GET #index' do 
		it 'populates an array of contacts' do 
			contact = FactoryBot.create(:contact)
			get :index
			expect(assigns(:contacts)).to eq([contact])
		end
		it 'renders the :index view' do 
			get :index
			expect(response).to render_template :index
		end
	end

	describe 'GET #show' do 
		it 'assigns  the requested contato to @contact' do 
			contact = FactoryBot.create(:contact)
			get :show, params: {id: contact.id }
			expect(assigns(:contact)).to eq(contact)
		end
		it 'render the :show template' do 
			get :show, params: {id: FactoryBot.create(:contact) }
			expect(response).to	render_template :show
		end
	end

	describe 'GET #new' do 
	  it 'assigns a new contact to @contact' do
	  	get :new 
	  	expect(assigns(:contact).phones.map{ |p| p.phone_type }).
	  		to eq %w(home office mobile)
	  end	

	  it 'render the new template' do 
	  	get :new, params: 
	  		{ 
	  			contact: FactoryBot.attributes_for(:contact, {
	  				firstname: nil, 
	  				lastname: nil
	  			}) 
	  		}
	  	expect(response).to render_template :new
	  end
	end

	describe 'POST #create' do 
	 context 'with valid attributes' do 
		 it 'saves the new contact in the database' do 
		 	 expect {
		 	 	post :create, params: { contact: FactoryBot.attributes_for(:contact) }
		 	 }.to change(Contact, :count).by(1)
		 end
		 it 'redirects to home page' do 
		 	 post :create, params: { contact: FactoryBot.attributes_for(:contact) }
		 	 expect(response).to redirect_to(Contact.last)
		 end
	 end

	 context 'with invalid attributes' do 
		 it 'does not save the new contact in the database' do 
		 	expect {
		 		post :create, params: { contact: FactoryBot.attributes_for(:invalid_contact) }
		 	}.to_not change(Contact, :count)
		 end 
		 it 're-renders the :new template' do 
		 	 post :create, params: { contact: FactoryBot.attributes_for(:invalid_contact) }
		 	 expect(response).to render_template :new
		 end
	 end
	end

	describe 'PUT update' do 
		before(:each ) do 
			@contact = FactoryBot.create(:contact)
		end

		context 'valid attributes' do 
			it 'located the request @contact' do 
				put :update, params: {id: @contact, contact: FactoryBot.attributes_for(:contact) } 
				expect(assigns(:contact)).to eq(@contact)
			end

			it "change contact's attributes"  do 
				put :update, params: { id: @contact, 
				contact: FactoryBot
				.attributes_for(:contact, firstname: 'Renato', lastname: 'Franco') }
				@contact.reload
				expect(@contact.firstname).to eq('Renato')
				expect(@contact.lastname).to eq('Franco')
			end

			it 'redirects to the updated contact' do 
				put :update, params: { 
					id: @contact, 
					contact: FactoryBot.attributes_for(:contact)
				}
				expect(response).to redirect_to(@contact)
			end 
		end

		context 'invalid attributes' do 
			it "does not change @contact's attributes" do
			  post :update, params: {
			  	id: @contact,
			  	contact: FactoryBot.attributes_for(:contact, firstname: 'Larry', lastname: nil)
			  } 
				@contact.reload
				expect(@contact.firstname).to_not eq("Larry")
				expect(@contact.lastname).to_not eq("Smith")
			end
			it 're-renders the edit method' do 
				put :update, params: { 
					id: @contact,
					contact: FactoryBot.attributes_for(:invalid_contact)
				}
				expect(response).to render_template :edit
			end
		end
	end

	describe 'DELETE destroy' do 
		before(:each) do 
			@contact = FactoryBot.create(:contact)
		end

		it 'deletes the contact' do 
			expect {
				delete :destroy, params: { id: @contact.id }
			}.to change(Contact, :count).by(-1)
		end

		it 'redirects to contact#index' do 
			delete :destroy, params: { id: @contact.id }
			expect(response).to redirect_to(contacts_url)
		end
	end	
end