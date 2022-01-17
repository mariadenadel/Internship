function createDiagnosisItems(data, currentPatientId, patientIdInHtml) {
  const diagnosisItems = data.map((item) => item.content)
  let output = ""
  if (diagnosisItems.length > 0){
    diagnosisItems.forEach(function(item, index){
      output += `<div class="card card-body border-light" id="patient${currentPatientId}_${index}">${item}</div>`
    })
  } else {
    output = "<div class='card card-body text-secondary'>There is no diagnosis</div>"
  }
  patientIdInHtml.append(output)
}

function handler(event){
  const currentPatientId = event.target.id
  const patientIdInHtml = $(`#patient_id${currentPatientId}`);
  if (patientIdInHtml.children().length === 0) {
    $.getJSON(
      `/diagnosis_items.json?patient_id=${currentPatientId}`,
      function(data){
        createDiagnosisItems(data, currentPatientId, patientIdInHtml)
      }
    )
  }
}

function initializeDiagnosisItems(){
  $(".load-diagnosis").on("click", handler);
}

$(document).on('turbolinks:load', function(){
  initializeDiagnosisItems();
})
