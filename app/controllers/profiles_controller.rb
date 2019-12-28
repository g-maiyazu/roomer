class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path
      flash[:notice] = 'プロフィールを更新しました'
    else
      redirect_to edit_profile_path
      flash[:alert] = 'プロフィール更新に失敗しました。編集項目を確認してください。'
    end
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(
      :age, :gender, :job, :living_style, :floor_plan, :floor_width,
      :web_site, :introduction, :name, :address
    )
  end
end
