$(function(){
  function appendOption(category){ // optionの作成
    var html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChidrenBox(insertHTML){ // 子セレクトボックスのhtml作成
    var childSelectHtml = '';
      childSelectHtml = `<div class='product-select-wrapper' id= 'children_wrapper'>
                          <div class='main-box__form__group__select'>
                            <select class="main-box__form__group__name-form" id="child_category" name="category_id">
                              <option value="---" data-category="---">---</option>
                              ${insertHTML}
                            </select>
                          </div>
                        </div>`;
    $('.main-box__form__group__children').append(childSelectHtml);
  }
  function appendgrandChidrenBox(insertHTML){ // 孫セレクトボックスのhtml作成
    var grandchildrenSelectHtml = '';
    grandchildrenSelectHtml = `<div class='product-select-wrapper' id= 'grandchildren_wrapper'>
                                <div class='main-box__form__group__select'>
                                  <select class="main-box__form__group__name-form" id="grandchild_category" name="category_id">
                                    <option value="---" data-category="---">---</option>
                                    ${insertHTML} 
                                  </select>
                                </div>
                              </div>`;
    $('.main-box__form__group__children').append(grandchildrenSelectHtml);
  }



  $('#category_select').on('change',function(){  // 親セレクトボックスの選択肢を変えたらイベント発火
    var productcategory = document.getElementById('category_select').value; 
  // ↑ productcategoryに選択した親のvalueを代入
    if (productcategory != ''){
 // ↑ productcategoryが空ではない場合のみAjax通信を行う｡選択肢を初期選択肢'---'に変えると､通信失敗となってしまうため｡
      $.ajax({
        url: 'category_children',
        type: 'GET',
        data: { parent_name: productcategory },
        dataType: 'json'
      })
      .done(function(children){  // 送られてきたデータをchildrenに代入
        $('#children_wrapper').remove(); //親が変更された時、子以下を削除するする
        $('#grandchildren_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){  
          insertHTML += appendOption(child); 
        });
        appendChidrenBox(insertHTML); 
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除するする
      $('#grandchildren_wrapper').remove();
    }
  });


  // document､もしくは親を指定しないと発火しない
  $('.main-box__form__group__children').on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').data('category');
    if ( childId!= ''){
    $.ajax ({
      url: 'category_grandchildren',
      type: 'GET',
      data: { child_id: childId },
      dataType: 'json'
    })
    .done(function(grandchildren){
      var insertHTML = '';
      grandchildren.forEach(function(grandchild){
        insertHTML += appendOption(grandchild);
        });
        appendgrandChidrenBox(insertHTML);  
        $(document).on('change', '#child_category',function(){
          $('#grandchildren_wrapper').remove();
          })
        })  
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
    }
  });
});
