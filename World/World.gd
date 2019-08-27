extends Node2D

var cash = 0
var lastCash = 0
var customer = preload("res://Customers/Customer.tscn")
var items = []
var startLoop = false

func _ready():
	var item1 = find_node("ITEMS").get_child(0)
	var item2 = find_node("ITEMS").get_child(1)
	var item3 = find_node("ITEMS").get_child(2)
	var item4 = find_node("ITEMS").get_child(3)
	var item5 = find_node("ITEMS").get_child(4)
	var item6 = find_node("ITEMS").get_child(5)
	items = [item1, item2, item3, item4, item5, item6]
	GLOBAL.RIGHT_ITEM = $ITEMS/Items

func _physics_process(delta):
	if lastCash != cash:
		$UI/MoneyLabel.set_text( "$" + String(cash))
	
	if GLOBAL.STORE_OPEN && startLoop:
		puzzle_loop()
		startLoop = false

func puzzle_loop():
	var newCust = customer.instance()
	var firstGridSpot = find_node("QGrid").get_child(0)
	newCust.set_position(firstGridSpot.get_global_position())
	newCust.current_customer = true
	add_child(newCust)
	GLOBAL.RIGHT_ITEM = items[3]
	GLOBAL.RIGHT_ITEM.find_node('items').frame = 9
	
	items[0].find_node('items').frame = 0
	items[1].find_node('items').frame= 1
	items[2].find_node('items').frame= 30
	items[4].find_node('items').frame = 8
	items[5].find_node('items').frame = 16
	item_sparkle()
	
	GLOBAL.RIGHT_ITEM.fancy_particles()

func item_sparkle():
	for item in items:
		item.fancy_particles()
