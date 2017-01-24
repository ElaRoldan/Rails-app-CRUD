class ArticlesController < ApplicationController
  #Aqui pedimos que el usuario este atutenticado exepto para index y show
  # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]


  #Muestra todos los artculos y muestra la primera vista
  def index
    @articles = Article.all
  end
  
  #Muestra los articulos
  def show
    @article = Article.find(params[:id])
  end

  
  def new
    @article = Article.new
  end
  
  #Permite editar los articulos 
  def edit
    @article = Article.find(params[:id])
  end
  
  
  #Crea los nuevos articulos y los guarda en la base 
  def create
    @article = Article.new(article_params)
    #Le dice que hacer en caso de que articule no cumpla los
    #requisitos de la validacion para ser salvado
    if @article.save
      redirect_to @article
     else
      render 'new'
    end 
  end

  #Guarda las ediciones de un articulo
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  #Borra los registros sellecionados 
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
 
    redirect_to articles_path
  end

private
  #Valida que params permite para esa forma en especifio, se estila que sean metodos privados
  def article_params
    params.require(:article).permit(:title, :text)
  end


end
