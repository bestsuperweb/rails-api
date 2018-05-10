module V2
  class PostsController < ApplicationController
    # GET /posts
    def index
      json_response({ message: 'Hello there, this is response from version 2.0 api...'})
    end
  end
end