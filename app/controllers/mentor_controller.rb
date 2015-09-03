class MentorController < ApplicationController
  before_action :redirect_if_already_signed_in!, only: :home
  before_action :authenticate_admin_user!, except: :home
  before_action :find_mentor, except: :home

  def home
    @mentor = current_mentor
  end

  def edit
    if @mentor.approved != true
      @mentor.approved = true
      @mentor.save!
      flash[:success] = "The mentor was approved"
    end
    redirect_to admin_dashboard_path
  end

  def destroy
    @mentor.destroy
    if @mentor.destroy
      flash[:success] = "The mentor was removed"
      redirect_to admin_dashboard_path
    end
  end

  private

  def redirect_if_already_signed_in!
    if mentee_signed_in?
      redirect_to mentee_home_path
    else
      :authenticate_mentor!
    end
  end

  def find_mentor
    @mentor = Mentor.find(params[:mentor_id])
  end

end
