class GroupUsersController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    current_user.join_group(@group)
    redirect_back(fallback_location: root_url)
  end

  def destroy
    @group = Group.find(params[:group_id])
    current_user.exit_group(@group)
    redirect_back(fallback_location: root_url)
  end
  
  def edit
  end
  
  def update
  end
end
