class MoviesController < ApplicationController
    def index
        @movies = session[:movies]
        # ||= (or equals) --> if movies is falsy, make it an empty array
        @movies ||= []
    end

    def create
        #creating a session (cookie) for temporary data storage if it doesnt exist already
        if session[:movies] == nil
            session[:movies] = []
        end

        session[:movies].push(params[:movie])

        redirect_to movies_path
        
    end

    def new
    end

    def show
    end

    def edit
        @movie_id = params[:id].to_i
        @movie = session[:movies][@movie_id]
        
    end

    def update
        @movie_id = params[:id].to_i
        @movie = session[:movies][@movie_id] = params[:movie]

        redirect_to movies_path
    end

end