class UserController < Sinatra::Base

configure:development do
  register Sinatra::Reloader
end

$posts = [{
  id: 0,
  title: "User 1",
  email: "g.lamp@gmail.com",
  firstname: "Gerald",
  lastname: "Lamp",
  age: 20
  },
  {
    id: 1,
    title: "User 2",
    email: "a.fish@gmail.com",
    firstname: "Amanda",
    lastname: "Fish",
    age: 37
  },
  {
    id: 2,
    title: "User 3",
    email: "l.goldust@gmail.com",
    firstname: "Lucy",
    lastname: "Goldust",
    age: 46
  }]

# sets root as the parent-directory of the current file
set :root, File.join(File.dirname(__FILE__), '..')
# sets the view directory correctly
set :views, Proc.new { File.join(root, "views") }

  #Index page
  get "/" do
    @title = "Users"
    @posts = $posts
    erb:"posts/index"
  end

  #New
  get "/new" do
    erb:"posts/new"
  end

  #Show
  get "/:id" do
    id = params[:id]
    @posts = $posts[id.to_i]
    @header = $posts[id.to_i][:title]
    @email = $posts[id.to_i][:email]
    @firstname = $posts[id.to_i][:firstname]
    @lastname = $posts[id.to_i][:lastname]
    @age = $posts[id.to_i][:age]
    erb:"posts/show"
  end

  #Edit
  get "/:id/edit" do
    id = params[:id]
    @header = $posts[id.to_i][:title]
    @email = $posts[id.to_i][:email]
    @firstname = $posts[id.to_i][:firstname]
    @lastname = $posts[id.to_i][:lastname]
    @age = $posts[id.to_i][:age]
    erb:"posts/edit"
  end

  #Create
  post "/" do
    "This will be the post method"
  end

  #Update
  put "/:id" do
    id = params[:id]
    "This will update #{id}"
  end

  #Destroy
  delete "/:id" do
    id = params[:id]
    "This will delete #{id}"
  end

end
