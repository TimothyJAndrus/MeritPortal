class MentorController < ApplicationController
  before_action :authenticate_mentor!, except: :edit
  before_action :authenticate_admin_user!, only: :edit

  def home
    @mentor = current_mentor
  end

  def edit
    @mentor = Mentor.find(params[:mentor_id])
    if @mentor.approved != true
      @mentor.approved = true
      @mentor.save!
      flash[:success] = "The mentor was approved"
    end
    redirect_to admin_dashboard_path
  end



end
