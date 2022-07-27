function close_signup() {
	const close = document.getElementById('signup_pop');
	close.classList.toggle('hide');
}

// function signup_pop(){
//     let pop_sign=document.getElementById('signup_pop');
//     pop_sign.style.display="flex";
// }

function BookAppointment(pid, cid) {


	$.ajax({
		url: 'book_appointment.jsp',
		type: 'get',
		data: {
			Pid: pid,
			Cid: cid
		},
		success: function(data) {
			swal("Booked", "Appointment booked Successfully", "success");
			setInterval(function() { location.reload(); }, 3000);
		}
	});



}
function closeAppointmentView() {
	const close = document.getElementById('backgroundAppointment');
	close.classList.toggle('hide');
}
function closeUserInfo() {
	const close = document.getElementById('backgroundUser');
	close.classList.toggle('hide');
}
function closeAddProperty() {
	const close = document.getElementById('backgroundAddProperty');
	close.classList.toggle('hide');
}
function closeViewProperty() {
	const close = document.getElementById('ViewOwnerProperty');
	close.classList.toggle('hide');
}
function closeupdatedetails() {
	const close = document.getElementById('UpdateDetails');
	close.classList.toggle('hide');
}
//=============== Update Details ================
function updateDetails() {
	$.ajax({
		url: 'updateProfile.jsp',
		type: 'get',
		data: $("#update_profile input,select").serialize(),
		success: function(data) {
			swal("Success", "Profile Updated Successfully", "success");
			setInterval(function() { location.reload(); }, 3000);
		}
	});
}
function ViewAAgentlist() {
	const close = document.getElementById('view_agent_list');
	close.classList.toggle('hide');
}
function submitActionTaken(aid, appo_id) {
	var agentid = aid;
	var appoID = appo_id;
	var stselect="StatusSelect_"+appoID;
	var appNotes ="Action_Notes_"+appoID;
	var status = document.getElementById(stselect).value;
	var notes = document.getElementById(appNotes).value;
	
	$.ajax({
		url: 'update_status_appoint.jsp',
		type: 'get',
		data: {
			appoiid: appoID,
			Agentid: agentid,
			actiontaken: status,
			action_notes: notes,

		},
		success: function(data) {
			swal("Success", "Appointment Status Changed Successfully", "success");
			setInterval(function() { location.reload(); }, 2000);
		}
	});
}

function closeAppointmentList() {
	const close = document.getElementById('AppointmentDetails');
	close.classList.toggle('hide');
}

function updateProperty(){
	const close = document.getElementById('Property_update');
	close.classList.toggle('hide');
}

function updateProperty(PID){
	const close = document.getElementById('Property_update');
	close.classList.toggle('hide');
	var PropertyID="updateProperty.jsp?Pid="+PID;
	$("#Property_update").load(PropertyID);
}

function SendPropertyDetails(){
	$.ajax({
		url: 'propertyDB.jsp',
		type: 'get',
		data: $("#update_property input,select,textarea").serialize(),
		success: function(data) {
			swal("Success", "Property Updated Successfully", "success");
			setInterval(function() { location.reload(); }, 2000);
		}
	});
}