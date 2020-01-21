class UserDescriptor < ModuleScaffold::Descriptors::ModelDescriptor

  def type
    'user'
  end

  def response_attributes
    {
      id: { type: :string, 'x-nullable': true },
      name: { type: :string, 'x-nullable': true },
      email: { type: :string, 'x-nullable': true },
      reset_password_token: { type: :string, 'x-nullable': true },
      date_of_birth: { type: :string, 'x-nullable': true },
      created_at: { type: :string, 'x-nullable': true },
      updated_at: { type: :string, 'x-nullable': true }
    }
  end

  def request_attributes
    {
      type: :object,
      properties: {
        user: {
          type: :object,
          properties: {
            id: { type: :string, 'x-nullable': true },
            name: { type: :string, 'x-nullable': true },
            email: { type: :string, 'x-nullable': true },
            reset_password_token: { type: :string, 'x-nullable': true },
            date_of_birth: { type: :string, 'x-nullable': true },
            created_at: { type: :string, 'x-nullable': true },
            updated_at: { type: :string, 'x-nullable': true }
          }
        }
      },
      required: ['user']
    }
  end

end
