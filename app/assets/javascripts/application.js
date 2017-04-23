// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require ckeditor/init
//= require turbolinks
//= require_tree .

function id( el ){
  return document.getElementById( el );
}

function ct_campos( campo ){
  id('document_campos').value += campo.value + ',';
}

function resetar(campo) {
  if (campo.value == '') {
    return
  } else {
    remover(campo);
    campo.value = '';
  }
}

function remover(campo){
  valorAntigo = campo.value + ',';
  id('document_campos').value = id('document_campos').value.replace(valorAntigo, '');
}

function id( el ){
  return document.getElementById( el );
}

function addVariavel(variavel) {
  if(id('variavel').value == '')
    return

  id('template_variaveis').value += id('variavel').value + ',';
  this.addTag();
  variavel.value = '';
}

function addTag() {
  let valor = id('variavel').value;
  $('#variaveis').append(
    `<span class='tag' id='${valor}'>${valor}<i class='fa fa-times' onclick='removerTag(${valor})'></i></span>`
  );
}

function removerTag(tag) {
  campo = $(tag).text();
  valorAntigo = `${campo},`;
  id('template_variaveis').value = id('template_variaveis').value.replace(valorAntigo, '');
  $(tag).remove();
}
