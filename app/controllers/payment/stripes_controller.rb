# frozen_string_literal: true

module Payment
  class StripesController < ApplicationController
    before_action :authenticate_user!

    def index; end
  end
end
