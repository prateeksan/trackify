# Homepage (Root path)
get '/' do
  redirect '/tracks/index'
end

get '/tracks/index' do
  @tracks = Track.all
  erb :'/tracks/index'
end

get '/tracks/new' do 
  @track = Track.new
  erb :'/tracks/tracks_form'
end

post '/tracks/edit' do
  @track = Track.find(params[:id])
  erb :'/tracks/tracks_form'
end

post '/tracks' do
  @track = params[:id].empty? ? Track.new : Track.find(params[:id])
  @track.title = params[:title]
  @track.author = params[:author]
  @track.url = params[:url]
  if @track.save
    redirect '/'
  else
    erb :'/tracks/tracks_form'
  end
end

post '/tracks/delete' do
  Track.find(params[:id]).destroy
  redirect '/'
end
