class ImportsController < ApplicationController
  def index
    @imports = Current.user.imports
  end

  def new
    @import = Current.user.imports.build
  end

  def create
    @import = Current.user.imports.build(import_params)

    if @import.save
      redirect_to imports_path
    else
      redirect_to new_import_path, alert: @import.errors.full_messages.to_sentence
    end
  end

  private

  def import_params
    params.require(:import).permit(:file)
  rescue ActionController::ParameterMissing
    {}
  end
end
