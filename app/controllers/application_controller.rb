class ApplicationController < ActionController::Base
  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb" })
  end

  def calculate_square
    @num = params.fetch("number").to_f

    @square_of_num = @num * @num

    render({ :template => "calculation_templates/square_results.html.erb" })
  end

  def caluclate_random
    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result = rand(@lower..@upper)

    render({ :template => "calculation_templates/rand_results.html.erb" })
  end

  def blank_random_form
    render({ :template => "calculation_templates/random_form.html.erb" })
  end

  def blank_square_root_form
    render({ :template => "calculation_templates/square_root_form.html.erb" })
  end

  def square_root_results
    @num = params.fetch("number").to_f

    @square_root_of_num = Math.sqrt(@num)

    render({ :template => "calculation_templates/square_root_results.html.erb" })
  end

  def blank_payment_form
    render({ template: "calculation_templates/payment_form.html.erb" })
  end

  def payment_results
    apr = params.fetch("apr").to_f.round(4)

    @apr_result = apr.to_s(:percentage, { :precision => 4 })

    @years = params.fetch("years").to_i

    principal = params.fetch("principal").to_f

    @pv = principal.to_s(:currency)

    rate = (apr / 12.0) / 100
    n = -1 * (@years * 12)
    numerator = rate * principal
    denominator = 1 - (1 + rate) ** n
    @payment = (numerator / denominator).to_s(:currency)

    render template: "calculation_templates/payment_results.html.erb"
  end
end
