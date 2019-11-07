class Api::V1::UsersController < ApiController
  before_action :set_user, only: [:show, :update, :destroy]

  # 拾えなかったExceptionが発生したら500 Internal server errorを応答する
  rescue_from Exception, with: :render_status_500

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound, with: :render_status_404

  def index
    users = User.select(
      :id, :user_name,
      :uid, :password,
      :login_counter_today,
      :login_counter_all,
      :last_login_date)
    render json: users
  end

  def show
    render json: @user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @user.update_attributes(user_params)
      head :no_content
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy!
    head :no_content
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      # :user何もの？？
      params.fetch(:user, {}).permit(
        :user_name,
        :uid,
        :password,
        :login_counter_today,
        :login_counter_all,
        :last_login_date
      )
    end

    def render_status_404(exception)
      render json: { errors: [exception] }, status: 404
    end

    def render_status_500(exception)
      render json: { errors: [exception] }, status: 500
    end
end
