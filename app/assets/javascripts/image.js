// 画面のロードが終わったら発火するイベント
$(document).on('ready page:load', function(){
  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    // span class: "js-remove" はdivでも良さそうだが、inline要素として、filenameの隣に並べるにはspanclassが良い
    const html = `<div data-index="${num}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="gift[images_attributes][${num}][name]"
                    id="gift_images_attributes_${num}_name"><span class="js-remove">削除</span>
                  </div>`;
    // 変数htmlを返す
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }
  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  // '.hidden-destroy'classを隠す 
  $('.hidden-destroy').hide();
  // id: image-box の中身が変化した時に、イベントが発火し、js-fileが変化する
  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      // .setAttribute(name, value)
      // 第一引数に属性の名前を文字列で指定
      // 第二引数に属性に指定したい値を指定する
      img.setAttribute('name', blobUrl);
    } else {
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      if ($('.js-file').length == 0 || $('.js-file').length < 10) {
        $('#image-box').append(buildFileField(fileIndex[0]));
      }
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0 || $('.js-file').length < 10) {
      $('#image-box').append(buildFileField(fileIndex[0]));
    }
  });
});