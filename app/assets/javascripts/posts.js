// 投稿詳細ページのいいねしたユーザー一覧
$(function() {
  $('.post-likes').infiniteScroll({
    append : '.post-likes .user-card',
    history: false,
    button: '.post-likes-footer .loadmore-btn',
    scrollThreshold: false,
    path : '.post-likes-footer nav.pagination a[rel=next]',
    hideNav: '.post-likes-footer .pagination'
  })
})
$(function () {
  if($(".post-likes-footer nav.pagination")[0]) {
  } else {
      $(".post-likes-footer .loadmore-btn").hide();
  }
});