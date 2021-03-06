// Stacked resources. They use a material datum for a lot of inherited values.
/obj/item/stack/material
	force = 5.0
	throwforce = 5
	w_class = 3.0
	throw_speed = 3
	throw_range = 3
	max_amount = 50

	var/default_type = DEFAULT_WALL_MATERIAL
	var/material/material
	var/perunit
	var/apply_colour //temp pending icon rewrite

/obj/item/stack/material/New()
	..()
	pixel_x = rand(0,4)-4
	pixel_y = rand(0,4)-4

	if(!default_type)
		default_type = DEFAULT_WALL_MATERIAL
	material = get_material_by_name("[default_type]")
	if(!material)
		qdel(src)
		return 0

	// Update from material datum.
	name = "[material.display_name] sheets"
	desc = "A stack of sheets of [material.display_name]."
	recipes = material.get_recipes()
	stacktype = material.stack_type
	origin_tech = material.stack_origin_tech.Copy()
	perunit = SHEET_MATERIAL_AMOUNT

	if(apply_colour)
		color = material.icon_colour

	if(material.conductive)
		flags |= CONDUCT

	matter = material.get_matter()
	return 1

/obj/item/stack/material/transfer_to(obj/item/stack/S, var/tamount=null, var/type_verified)
	var/obj/item/stack/material/M = S
	if(!istype(M) || material.name != M.material.name)
		return 0
	..(S,tamount,1)

/obj/item/stack/material/iron
	name = "iron"
	icon_state = "sheet-silver"
	default_type = "iron"
	apply_colour = 1

/obj/item/stack/material/sandstone
	name = "sandstone brick"
	singular_name = "sandstone brick"
	icon_state = "sheet-sandstone"
	default_type = "sandstone"

/obj/item/stack/material/diamond
	name = "diamond"
	icon_state = "sheet-diamond"
	default_type = "diamond"

/obj/item/stack/material/uranium
	name = "uranium"
	icon_state = "sheet-uranium"
	default_type = "uranium"

/obj/item/stack/material/phoron
	name = "solid phoron"
	icon_state = "sheet-phoron"
	default_type = "phoron"

/obj/item/stack/material/plastic
	name = "Plastic"
	icon_state = "sheet-plastic"
	default_type = "plastic"

/obj/item/stack/material/gold
	name = "gold"
	icon_state = "sheet-gold"
	default_type = "gold"

/obj/item/stack/material/silver
	name = "silver"
	icon_state = "sheet-silver"
	default_type = "silver"

//Valuable resource, cargo can sell it.
/obj/item/stack/material/platinum
	name = "platinum"
	icon_state = "sheet-adamantine"
	default_type = "platinum"

//Extremely valuable to Research.
/obj/item/stack/material/mhydrogen
	name = "metallic hydrogen"
	icon_state = "sheet-mythril"
	default_type = "mhydrogen"

//Fuel for MRSPACMAN generator.
/obj/item/stack/material/tritium
	name = "tritium"
	icon_state = "sheet-silver"
	default_type = "tritium"
	apply_colour = 1

/obj/item/stack/material/osmium
	name = "osmium"
	icon_state = "sheet-silver"
	default_type = "osmium"
	apply_colour = 1

/obj/item/stack/material/steel
	name = DEFAULT_WALL_MATERIAL
	singular_name = "steel sheet"
	icon_state = "sheet-metal"
	default_type = DEFAULT_WALL_MATERIAL

/obj/item/stack/material/plasteel
	name = "plasteel"
	singular_name = "plasteel sheet"
	icon_state = "sheet-plasteel"
	item_state = "sheet-metal"
	default_type = "plasteel"

/obj/item/stack/material/wood
	name = "wooden plank"
	singular_name = "wood plank"
	icon_state = "sheet-wood"
	default_type = "wood"

/obj/item/stack/material/cloth
	name = "cloth"
	singular_name = "cloth roll"
	icon_state = "sheet-cloth"
	default_type = "cloth"

/obj/item/stack/material/cardboard
	name = "cardboard"
	singular_name = "cardboard sheet"
	icon_state = "sheet-card"
	default_type = "cardboard"

/obj/item/stack/material/leather
	name = "leather"
	desc = "The by-product of mob grinding."
	singular_name = "leather piece"
	icon_state = "sheet-leather"
	default_type = "leather"
