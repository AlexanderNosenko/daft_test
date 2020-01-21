module ResponseHandler
  extend ActiveSupport::Concern

  included do
    rescue_from(ActionController::ParameterMissing) { |error| render_error(ParamMissingError.new(error.param)) }
  end

  include ModuleScaffold::ResponseRenderer
end
