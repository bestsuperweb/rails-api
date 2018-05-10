module V1
  class DislikesController < ApplicationController
    before_action :set_dislike, only: [:show, :update, :destroy]

  # GET /dislikes
  def index
    @dislikes = current_user.dislikes

    render json: @dislikes
  end

  # GET /dislikes/1
  def show
    render json: @dislike
  end

  # POST /dislikes
  def create
    @dislike = current_user.dislikes.build(dislike_params)

    if @dislike.save
      json_response({ status: 'Suceess'})
    else
      render json: @dislike.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dislikes/1
  def update
    if @dislike.update(dislike_params)
      render json: @dislike
    else
      render json: @dislike.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dislikes/1
  def destroy
    @dislike.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dislike
      @dislike = Dislike.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dislike_params
      params.require(:dislike).permit(:post_id)
    end
  end
end