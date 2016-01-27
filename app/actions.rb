helpers do
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
end

# Homepage (Root path)
get '/' do
  erb :index
end

get '/tracks/index' do
  @tracks = Track.all
  if current_user
    erb :'/tracks/index'
  else
    redirect '/'
  end
end

get '/tracks/new' do 
  @track = Track.new
  if current_user
    @action = "Add"
    erb :'/tracks/tracks_form'
  else
    redirect '/'
  end
end

get '/signup' do
  unless current_user
    @user = User.new
    erb :'/users/new'
  else
    redirect '/tracks/index'
  end
end

get '/login' do
  erb :'sessions/new'
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/upvote/:track_id' do
  if current_user
    @upvote = Upvote.new(
      user_id: current_user.id,
      track_id: params[:track_id]
      )
    if @upvote.save
      @track = Track.find(params[:track_id])
      @track.votes = Upvote.all.where(track_id: @track.id).count
      @track.save
    end
    redirect '/tracks/index'
  else
    redirect '/'
  end
end

post '/signup' do
  @user = User.new(
    username: params[:username],
    password: params[:password]
    )
  if @user.save
    session[:user_id] = @user.id
    redirect '/tracks/index'
  else
    erb :'/users/new'
  end
end

post '/login' do
  @user = User.find_by(username: params[:username])
  if @user 
    if @user.password = params[:password]
      session[:user_id] = @user.id
      redirect 'tracks/index'
    end
  else
    redirect '/login'
  end
end

post '/tracks/edit' do
  @track = Track.find(params[:id])
  @action = "Edit"
  erb :'/tracks/tracks_form'
end

post '/tracks' do
  @track = params[:id].empty? ? Track.new : Track.find(params[:id])
  @track.title = params[:title]
  @track.author = params[:author]
  @track.url = params[:url]
  @track.user_id = session[:user_id]
  if @track.save
    redirect '/tracks/index'
  else
    erb :'/tracks/tracks_form'
  end
end

post '/tracks/delete' do
  Track.find(params[:id]).destroy
  redirect '/tracks/index'
end
