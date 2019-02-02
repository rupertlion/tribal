module OmniAuthFixtures
	def self.facebook_mock
		{"provider"=>"facebook",
			  "uid"=>"2243663995747690",
			  "info"=>
			  	{"email"=>"john.doe@mail.com",
			    "first_name"=>"John",
			    "last_name"=>"Doe",
			    "image"=>"http://graph.facebook.com/v2.10/"},
			  "credentials"=>
			  	{"token"=>
			    	"EBADnlbiIiEkBACoOh2GeGbxbZABXGPPKQPZABVS9z3BjKIzlZB2hZBtTAYKZCwkO7HVchqY5ZCmrvvLk4i7GMwfuYVZAQsFK0JXreW6ngA7IgtsFYEeMKtBPZAVL1ZAEMWZCvVZCrZAmkcxwXIwnv1bEVZAZBVSCZBUsHdWsX74qAzZARm5t4QZDZD",
			    "expires_at"=>1554219256,
			    "expires"=>true},
			  "extra"=>
			  	{"raw_info"=>
			    	{"first_name"=>"John",
			      "last_name"=>"Doe",
			      "email"=>"john.doe@mail.com",
			      "id"=>"2243663995747690"}}}

		end
end
