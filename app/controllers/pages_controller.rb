class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @tasks = current_user.tasks
    @notes = current_user.notes
    # @tasks = @tasks.search(params[:search]) if params[:search].present?
    # @tasks = @tasks.filter(params[:filter]) if params[:filter].present?
    # @tasks = @tasks.sort(params[:sort]) if params[:sort].present?
    # @tasks = @tasks.sort_by(params[:sort_by]) if params[:sort_by].present?
    # @tasks = @tasks.filter_by(params[:filter_by]) if params[:filter_by].present?
  end
end
