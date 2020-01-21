class ParamMissingError < ModuleScaffold::Errors::BaseError

  def initialize(param_name = nil)
    @param_name = param_name
    super
  end

  code 'param_missing'
  http_code 422

  def title
    "Param #{@param_name} is missing"
  end

end
