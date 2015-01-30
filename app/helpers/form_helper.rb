module FormHelper
  def field form, field, type=:text_field, required: true, placeholder:nil, error:nil, **args
    if required && error.nil?
      error = "#{field.to_s.titleize.capitalize} is required."
    end
    render partial:'form_component', locals: {f: form, field: field, type:type, required: required, placeholder: placeholder, error: error, args:args }
  end
end