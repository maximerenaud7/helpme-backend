module Transformable
  extend ActiveSupport::Concern

  def after_initialize
    @variables = {}
    t_text!(value)
  end

  def t_text!(value)
    t_variables!(value)
    t_calculate!(value)
  end

  def t_variables!(value)
    value.gsub!(/\$\{v%([0-9]+)\}/) { |variable| t_variable!($1) }
  end

  def t_calculate!(value)
    value.gsub!(/\<\<(.*)\>\>/) { |_| Eqn::Calculator.calc($1) }
  end

  def t_variable!(id)
    return @variables[id] if @variables[id].present?
    variable = Variable.find(id)
    if variable.variable_type.to_sym == :interval
        interval_start, interval_end = *variable.value.split('-')
        return @variables[id] = rand(interval_start.to_i..interval_end.to_i)
    end
    if variable.variable_type.to_sym == :list
        list = variable.value.split(',')
        return @variables[id] ||= list[rand(0..list.size)]
    end
  end
end