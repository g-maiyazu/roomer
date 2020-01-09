// 文字カウント
$(function (){
  // ページ読み込み時
  // フォームに入力されている文字数を数える
  // \nは"改行"に変換（オプションgで文字列の最後まで\nを探し変換）
  var count = $(".js-text").text().replace(/\n/g, "改行").length;
  var now_count = 140 - count;
  if (count > 140) {
    $(".js-text-count").css("color","red");
  }
  $(".js-text-count").text( "あと" + now_count + "文字");

  // キーボード押下時
  $(".js-text").on("keyup", function() {
    // フォームのvalueの文字数を数える
    var count = $(this).val().replace(/\n/g, "改行").length;
    var now_count = 140 - count;

    if (count > 140) {
      $(".js-text-count").css("color","red");
    } else {
      $(".js-text-count").css("color","black");
    }
    $(".js-text-count").text( "あと" + now_count + "文字");
  });
});

// ファイルアップロード
$(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('#avatar_img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#post_img").change(function(){
    $('#avatar_img_prev').removeClass('hidden');
    $('.avatar_present_img').remove();
    readURL(this);
  });
});
