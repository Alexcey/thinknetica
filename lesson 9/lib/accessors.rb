module Accessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      var_name_history = "@#{name}_history".to_sym

      define_method(name) { instance_variable_get(var_name) }

      define_method("#{name}_history") { instance_variable_get(var_name_history).to_a }

      define_method("#{name}=".to_sym) do |value|
        prev_values = send("#{name}_history")
        prev_values << instance_variable_get(var_name)
        instance_variable_set(var_name_history, prev_values)
        instance_variable_set(var_name, value)
      end
    end
  end

  def attr_accessor_strong(name, classname)
    var_name = "@#{name}".to_sym

    define_method(name) { instance_variable_get(var_name) }

    define_method("#{name}=".to_sym) do |value|
      raise TypeError, "Value is not #{classname}" unless value.is_a?(classname)

      instance_variable_set(var_name, value)
    end
  end
end
