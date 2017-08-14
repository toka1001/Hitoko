class WordsController < ApplicationController
  before_action :set_word, only: [:edit, :update, :destroy]
  def index
    @words = Word.all
  end

  def new
    if params[:back]
      @word = Word.new(words_params)
    else
      @word = Word.new
    end
  end

  def confirm
    @word = Word.new(words_params)
    render :new if @word.invalid?
  end
  
  def create
    @word = Word.new(words_params)
    if @word.save
     redirect_to words_path, notice: "ヒトコトを作成しました！"
    else
     render 'new'
    end
  end

  def edit
  end
  
  def update
    if @word.update(words_params)
      redirect_to words_path, notice: "ヒトコトを更新しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
    @word.destroy
    redirect_to words_path, notice: "ヒトコトを削除しました！"
  end
  
  private
    def words_params
      params.require(:word).permit(:title, :content)
    end
    
    def set_word
      @word = Word.find(params[:id])
    end
    
end
