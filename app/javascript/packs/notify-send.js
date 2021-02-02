// Padding between each notifications
const PADDING = 10

// Delay to start the animation after the cancel button is clicked
const DELAY = 500

// Delay before notificatons auto slides out
const LIFE = 1250

let iteration = 0
let width = 0
let top_pos = PADDING, uniq_item_index = 0
let items = [], position = [[0, 0]]

slideOut = function(id, n) {
	let c = document.getElementById(id)

	if(c && !c.cancelled) {
		c.style.animation = `slide-out ${DELAY}ms ease`
		c.style.opacity = 0
		c.cancelled = true
		c.style.cursor = 'wait'

		setTimeout(() => {
			for(i = 0 ; i < items.length ; ++i) {
				if(i == n) {
					iteration -= 1
					items[i] = null
					position[i] = [0, 0]
					break
				}
			}

			if(c.parentNode)
				c.parentNode.removeChild(c)
		}, DELAY + 1)
	}
}

const notifyMain = (notification_string, button_label, button_link) => {
	let insert_at = iteration

	for(let temp = 0 ; temp < items.length ; ++temp) {
		if(!items[temp]) {
			insert_at = temp
			break
		}
	}

	items[insert_at] = true
	let id = `notification-${uniq_item_index}`

	let str = `
		<button class="cancel-notification" onclick="slideOut('${id}',${insert_at})">
		<span class="cancel-notification-label"><span class="cross">&#x2A2F;</span>
		</button><span class="notify-label">${notification_string}</span>
	`

	if(button_label && button_link)
		str += `<br><a class="notification-button" href="${button_link || '#'}">${button_label}</a>`
	else if(button_label)
		str += `
			<br><button class="notification-button" onclick="slideOut('${id}',${insert_at})">${button_label}</button>`

	let child = window.document.createElement('div')
	child.cancelled = false
	child.setAttribute('id', id)
	child.onclick = slideOut(id, insert_at)
	child.setAttribute('class', 'notify-send')

	child.innerHTML = str
	window.document.body.appendChild(child)

	top_pos = parseInt(position[insert_at == 0 ? 0 : insert_at - 1][0]) + PADDING
	right_pos = parseInt(position[insert_at == 0 ? 0 : insert_at - 1][1])

	child.style.top = `${top_pos}px`
	child.style.right = `${right_pos}px`

	if(top_pos + child.offsetHeight >= window.innerHeight) {
		child.style.top = `${0 + PADDING}px`
		child.style.right = `${right_pos + child.offsetWidth + PADDING}px`
	}

	position[insert_at] = [
		parseInt(child.style.top) + child.offsetHeight,
		parseInt(child.style.right)
	]

	iteration += 1
	uniq_item_index += 1

	setTimeout(() => {
		slideOut(id, insert_at)
	}, LIFE)
}

window.notify = function(notification_string='', button_label=null, button_link=null) {
	notifyMain(notification_string, button_label, button_link)
}
