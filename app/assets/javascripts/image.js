$(document).on('ready page:load', function(){
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="js-file_group">
                    <div class="js-file">
                      <input type="file" class="js-upload" name="gift[images_attributes][${num}][name]" id="gift_images_attributes_${num}_name" style="display:none">
                      <label class="original_btn">ファイルを選択</label>
                      <span class="icon"> 未選択
                    </div>
                    <button class="js-remove">削除</button>
                  </div>`;
    return html;
  }
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  $('.hidden-destroy').hide();

  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    $(this).find('.icon').addClass('select').html('選択中');
    $(this).find('.original_btn').html('ファイルを変更');
    if(!($(this).children('.filename').length)){
      $(this).append('<div class="filename"></div>');
    };
    $(this).children('.filename').html('ファイル名：' + file.name);

    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {
      $('#previews').append(buildImg(targetIndex, blobUrl));
      if ($('.select').length == $('.js-file').length && $('.js-file').length < 10) {
        $('#image-box').append(buildFileField(fileIndex[0]));
      }
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    if ($('.select').length == $('.js-file').length && $('.js-file').length < 10) {
      $('#image-box').append(buildFileField(fileIndex[0]));
    }
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
  });

  $('#image-box').on('click', '.original_btn', function () {
    const targetIndex = $(this).parent().parent().data('index');
    $(`input[id="gift_images_attributes_${targetIndex}_name"]`).click();
    return false;
  });
});