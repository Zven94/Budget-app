class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end
  def new
    @user = current_user
    @group = Group.new
  end
  def create
    group_params_without_user_id = group_params.except(:user_id)
    @group = current_user.groups.build(group_params_without_user_id)
    if @group.save
      redirect_to user_groups_path(current_user)
    else
      render :new
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :user_id)
  end
end
