/obj/proc/use_item_on(var/mob/caller as mob,var/atom/object,location,control,params) //The src is used on the object

	if(caller.attack_flags & ATTACK_THROW)
		caller.face_atom(object)
		return throw_item(caller.dir)

	else if (caller.attack_flags & ATTACK_DROP)
		return drop_item()

	return FALSE

/obj/proc/get_held()
	if(is_held())
		var/obj/inventory/I = src.loc
		return I

	return null

/obj/proc/is_held()
	return istype(src.loc,/obj/inventory)

/obj/proc/drop_item(var/turf/new_location)
	if(is_inventory(src.loc))
		var/obj/inventory/I = src.loc
		if(!new_location)
			new_location = get_turf(I.owner)
		return I.remove_object(src,new_location)

	return FALSE

/obj/proc/throw_item(var/direction)
	drop_item()
	set_dir(direction)
	add_projectile(src)
	return TRUE


/obj/proc/transfer_item(var/obj/inventory/new_inventory)
	drop_item()
	return new_inventory.add_object(src)

