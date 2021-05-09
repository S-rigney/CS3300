module ControllerMacros
    def login_admin
      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:admin]
        sign_in FactoryBot.create(:admin) # Using factory bot as an example
      end
    end

    def login_student
      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:student]
        student = FactoryBot.create(:student)
        sign_in student
      end
    end
  end