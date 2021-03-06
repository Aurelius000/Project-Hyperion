/datum/antagonist/proc/create_global_objectives()
	return 	!((global_objectives && global_objectives.len) || config.objectives_disabled)

/datum/antagonist/proc/get_special_objective_text()
	return ""

/datum/antagonist/proc/check_victory()
	var/result = 1
	if(config.objectives_disabled)
		return 1
	if(global_objectives && global_objectives.len)
		for(var/datum/objective/O in global_objectives)
			if(!O.completed && !O.check_completion())
				result = 0
			else
				O.completed = 1 //Will this break anything?
		if(result && victory_text)
			world << "<span class='danger'><font size = 3>[victory_text]</span>"
			if(victory_feedback_tag) feedback_set_details("round_end_result","[victory_feedback_tag]")
		else if(loss_text)
			world << "<span class='danger'><font size = 3>[loss_text]</span>"
			if(loss_feedback_tag) feedback_set_details("round_end_result","[loss_feedback_tag]")

