class LinksController < ApplicationController
  before_filter :require_signed_in_user
  before_filter :load_group
  before_filter :load_targets, :load_colors, :only => [:new, :edit, :create, :update]

  def new
    @destination = params[:destination] || "links"
    @link = @group.links.new
  end

  def create
    @destination = params[:link][:destination] || "links"
    @link = @group.links.new(link_params)
    @link.save
  end

  def edit
    @link = @group.links.find(params[:id])
  end

  def update
    @link = @group.links.find(params[:id])
    @link.assign_attributes(link_params)
    @link.save
  end

  def index
    @title = "Links in #{@group.title} - Linkadex"
    @links = @group.links
  end

  def destroy
    @link = @group.links.find(params[:id])
    @link.destroy
  end

  private

    def link_params
      params.require(:link).permit(:title, :href, :target, :color_id, :background_color_id, :border_color_id, :order_rank)
    end

    def load_group
      @group = current_user.groups.find(params[:group_id])
    end

    def load_targets
      @targets = Link::TARGETS
    end
end
