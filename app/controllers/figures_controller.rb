class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  post '/figures' do
    binding.pry
    @figure = Figure.create(params[:figure])
    @titles = params[:title_ids].map do |title|
      Title.find(title)
    end
    @figure.titles = @titles

    @landmarks = params[:landmark_ids].map do |landmark|
      Landmark.find(landmark)
    end
    @figure.landmarks = @landmarks
    redirect "/figures/#{@figure.id}"
  end

  get 'figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

end
