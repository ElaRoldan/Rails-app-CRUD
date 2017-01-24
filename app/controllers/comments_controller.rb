class CommentsController < ApplicationController
  # #Validacion que permite solo a los usuarios registrados crear y borrar comments
  # http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
  #Permite crear comentarios
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  #Borra comentarios
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
 
  private
    #Valida que permite guardar para cada comment
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
  end



end
