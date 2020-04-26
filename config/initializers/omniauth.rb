Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, '9b50c2aefb1754e2f04a', 'eb95f0506c4d65b336f806f8020c5c5342878287'
end

#go back and change to hash key