class BootstrapFormBuilder < ActionView::Helpers::FormBuilder

	delegate :content_tag, to: :@template

	[:text_field,:text_area,:email_field,:number_field,:url_field].each do |metodo|
		define_method metodo do |name, *args|
			options = args.extract_options!
			if options.has_key?(:class)
				options[:class] += "form-control"
			else
				options[:class] = "form-control"
			end
			content_tag :div, class:"form-group" do 
				content_tag(:label, name, name:name) + super(name, options)
			end
		end
	end

	def errors
		if object.errors.any?
			content_tag :div, class:"red large-padding white-text" do 
				content_tag(:h2, "Errores") +
				content_tag(:ul) do 
					lis = ""
					object.errors.full_messages.each do |error| 
						lis += content_tag :li, error
					end
					lis.html_safe
				end
			end
		else

		end
	end

	def submit(*args)
		content_tag :div do
			super(*args, class:"btn btn-success")
		end
	end

end