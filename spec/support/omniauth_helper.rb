module OmniauthHelper
	def mock_omniauth_sign_in
		OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
	    :provider => 'twitter',
	    :uid => '1234567',
	    :user_info => {
	    	:nickname => 'estlintester'
	  	},
	  	:credentials => {
	  		:token => '2342kmlskdlakmsdlkasm',
	  		:secret => 'aslsakmdlkm32m3902j'
	  	}
  	})
	end
end
