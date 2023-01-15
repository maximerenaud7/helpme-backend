require 'nokogiri'

module Transformable
  extend ActiveSupport::Concern

  def build
    @occurences = {}
    t_text(Nokogiri::HTML::DocumentFragment.parse(self.value))
  end

  def t_text(html)
    t_calculate(t_occurences(html))
  end

  def t_occurences(html)
    occurences.each do |occurence|
      p html.xpath("//span[data-variable-id]")
    end
    html
  end

  def t_occurence(occurence)
    return @occurences[occurence.id] if @occurences[occurence.id].present?
    variable = occurence.variable
    occurence_type = occurence.occurence_type

    if occurence_type == :name
      return variable.name
    end
    if occurence_type == :raw_formula
      return t_variables(variable.value, :raw_formula)
    end
    if occurence_type == :formula
      return t_variables(variable.value, :formula)
    end
    if occurence_type == :value
      return t_variables(variable.value, :value)
    end
  end

  def t_variables(value, type)
    value.gsub(//) { |_| t_occurence(occurence) }
  end

  def t_variable(id)
    variable = Variable.find(id)
    if variable.variable_type.to_sym == :interval
        interval_start, interval_end = *variable.value.split('-')
        return rand(interval_start.to_i..interval_end.to_i)
    end
    if variable.variable_type.to_sym == :list
        list = variable.value.split(',')
        return list[rand(0..list.size)]
    end
  end

  def t_calculate!(value)
    value.gsub!(/\<\<(.*)\>\>/) { |_| Eqn::Calculator.calc($1) }
  end
end