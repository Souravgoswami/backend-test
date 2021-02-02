API_URL = 'http://makeup-api.herokuapp.com/api/v1/products.json'

# Test sample
# data = JSON.parse(
# 	IO.read(File.join(Rails.root, 'tmpfiles', 'products.json')).strip
# )


def animate(text: 'Downloading')
	t = Thread.new {
		i = 0
		len = text.length
		chars = %W(\u2802 \u2812 \u2832 \u2834 \u2826)

		while true
			i += 1
			i_m_l = i % len

			print "\e[2K #{chars.rotate![0]} #{text[0...i_m_l]}#{text[i_m_l].swapcase}#{text[i_m_l + 1..-1]}\r"
			sleep 0.1
		end
	}

	v = yield
	t &.kill
	puts
	return v
end

data = []
animate text: 'Downloading JSON' do
	json = Net::HTTP.get(URI(API_URL))
	data.replace(JSON.parse(json))
end

total = data.length

t1 = Process.clock_gettime(Process::CLOCK_MONOTONIC)
data.map.with_index { |p, i|
	_brand = p['brand'] &.tap(&:strip!)
	next if _brand &.empty?

	colours = []

	p.fetch('product_colors', []).map! { |x| x.map(&:last) }.each { |x|
		_c = x[0]
		colours << [_c, x[1]] if _c.valid_colour?
	}

	brand = Brand.create!(name: _brand)

	Makeup.create!(
		brand: brand,
		name: p['name'],
		description: p['description'],
		price: p['price'].to_f,
		rating: p['rating'].to_f,
		color: colours,
		image_link: p.fetch('image_link', '')
	)

	t2 = Process.clock_gettime(Process::CLOCK_MONOTONIC)

	_elap = t2 - t1
	_rem = total.*(_elap).fdiv(i + 1).-(_elap)

	count, elap, rem = "%3d" % i, "%05.2f" % _elap, "%05.2f" % _rem

	print "\e[2KCount: #{count} | Elap: #{elap}s | Rem: #{rem}s\r"
}
