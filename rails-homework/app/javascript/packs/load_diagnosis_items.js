function loadDiagnisisItemsForPatient(){
  $(".load-diagnosis").on("click", function(event){
    let patientId = event.target.id
    if ($(`#patient_id${patientId}`).children().length === 0) {
      $.getJSON(
        `/diagnosis_items.json?patient_id=${patientId}`,
        function(data) {
          let diagnosisItems = []
          for (let key in data){
            diagnosisItems.push(data[key].content);
          }
          let output = ""
          if (diagnosisItems.length > 0){
            diagnosisItems.forEach(function(item, index){
              if ($(`#patient${patientId}_${index}`).length === 0) {
                output += `<div class="card card-body" id="patient${patientId}_${index}">${item}</div>`
              }
            })
            $(`#patient_id${patientId}`).append(output)
          }
        }
      )
    }
  });
}

$(document).ready(function() {
  loadDiagnisisItemsForPatient();
});
