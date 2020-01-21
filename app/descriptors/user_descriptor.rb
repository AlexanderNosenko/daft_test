class UserDescriptor < ModuleScaffold::Descriptors::ModelDescriptor

  def type
    'user'
  end

  def response_attributes
    {
      name: { type: :string, 'x-nullable': true },
      email: { type: :string, 'x-nullable': true },
      date_of_birth: { type: :string, 'x-nullable': true }
    }
  end

  def request_attributes
    {
      type: :object,
      properties: {
        user: {
          type: :object,
          properties: {
            name: { type: :string, 'x-nullable': true },
            email: { type: :string, 'x-nullable': true },
            date_of_birth: { type: :string, 'x-nullable': true }
          }
        }
      },
      required: ['user']
    }
  end

end
