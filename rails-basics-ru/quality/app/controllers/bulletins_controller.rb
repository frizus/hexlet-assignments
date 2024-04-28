# frozen_string_literal: true

class BulletinsController < ApplicationController
  # BEGIN
  def index
    render locals: { bulletins: Bulletin.all }
  end

  def show
    render locals: { bulletin: Bulletin.find(params[:id]) }
  end
  # END
end
