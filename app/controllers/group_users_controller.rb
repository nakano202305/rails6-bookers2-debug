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
    @group = Group.find(params[:group_id])
  end
  
  def update
    @group = Group.find(params[:group_id])
    if @group.update(group_params)
      redirect_to groups_path
    else
      render "edit"
    end
  end
  
end
