module ApplicationHelper
	def generate_rating(n, width: 130, height: 30)
		r = n.*(width).fdiv(5)

		<<~EOF.html_safe
			<div class="rating">
				<div class="width" style="background-color: #0003 ; width: #{width}px ; padding-top: #{height}px ; position: absolute"></div>
				<div class="rating-bar" style="background-color: #fa0 ; width: #{r}px ; padding-top: #{height}px ; position: absolute"></div>

				#{image_tag 'rating_star.svg', alt: "rating: #{n}", style: "width: #{width}px ; height: #{height}px ; object-fit: cover ; position: relative ; display: flex ; align-items: center ; justify-content: center"}
				<div>#{n}</div>
			</div>
		EOF
	end

	def show_price(n)
		n.to_f == 0 ? 'Unavailable'.freeze : "$ #{n}"
	end

	def flash_message_manager
		msg = flash[:notice] || flash[:alert] || flash[:error]
		notify(msg) if msg
	end

	def notify(msg, btn_msg = 'Ok')
		javascript_tag %Q[notify("#{msg}", "#{btn_msg}")]
	end
end
