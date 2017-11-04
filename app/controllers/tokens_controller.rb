# frozen_string_literal: true

class TokensController < ApplicationController
  before_action :set_token, only: %i[show edit update destroy]

  def index
    @tokens = Token.all
  end

  def show; end

  def new
    @token = Token.new
  end

  def edit; end

  def create
    @token = Token.new(token_params)

    if @token.save
      redirect_to @token, notice: 'Token was successfully created.'
    else
      render :new
    end
  end

  def update
    if @token.update(token_params)
      redirect_to @token, notice: 'Token was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @token.destroy
    redirect_to tokens_url, notice: 'Token was successfully destroyed.'
  end

  private

  def set_token
    @token = Token.find(params[:id])
  end

  def token_params
    params.require(:token).permit(:title, :token)
  end
end
