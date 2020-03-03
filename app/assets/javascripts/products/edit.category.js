$(document).on('turbolinks:load', function(){
  $("#parent_category").change(function(){
    $("#displayNoneCategory").css({'display': 'none'})
    
    // id取ってくる
    let id = $(this).val()
    // ajaxでデータ送信する
    $.ajax({
      type: "get",
      url: "/products/category_children",
      data: { parent_name : id},
      dataType: "json"
    }).done(function(category){
      $("#product_child_category").empty().append(`<option>---</option>`)
      category.forEach(function(categories){
        $("#product_child_category").append(`<option value="${categories.id}" >${categories.name}</option>`);
      });
    })
    .fail(function(){category
      alert("category fail");
    })
    // セットし直す
  });
  $("#product_child_category").change(function(){
    $("#displayNoneCategory").css({'display': 'block'})
    $("#product_grandchild_category").empty().append(`<option>---</option>`)

    // id取ってくる
    let id = $(this).val()
    // ajaxでデータ送信する
    $.ajax({
      type: "get",
      url: "/products/category_grandchildren",
      data: { childId : id},
      dataType: "json"
    }).done(function(category){
      category.forEach(function(categories){
        $("#product_grandchild_category").append(`<option value="${categories.id}" >${categories.name}</option>`);
      });
    })
    .fail(function(){
      alert("category fail");
    })
    // セットし直す
  });
});
