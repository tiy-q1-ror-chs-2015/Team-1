module FormHelper
  def field form, field, type=:text_field, required: true, placeholder:nil, **args
    render partial:'form_component', locals: {f: form, field: field, type:type, required: required, placeholder: placeholder, args:args }
  end
end