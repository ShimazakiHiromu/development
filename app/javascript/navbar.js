document.addEventListener('DOMContentLoaded', function() {
    // ハンバーガーメニューのトグルボタンを取得
    const navbarToggler = document.querySelector('.navbar-toggler');
    // ハンバーガーメニューのコンテンツを取得
    const navbarCollapse = document.querySelector('.navbar-collapse');
    // 閉じるボタンを取得
    const closeButton = document.querySelector('.close-menu');
  
    // トグルボタンのクリックイベントを追加
    navbarToggler.addEventListener('click', function(event) {
      event.preventDefault();
      navbarCollapse.classList.toggle('show');
    });
  
    // 閉じるボタンのクリックイベントを追加
    closeButton.addEventListener('click', function() {
      navbarCollapse.classList.remove('show');
    });
  
    // ドキュメント全体にクリックイベントリスナーを追加
    document.addEventListener('click', function(event) {
      const isClickInside = navbarCollapse.contains(event.target) || navbarToggler.contains(event.target);
      // メニュー外をクリックした場合、メニューを閉じる
      if (!isClickInside) {
        navbarCollapse.classList.remove('show');
      }
    });
  
    // スクロールイベントリスナーを追加
    window.addEventListener('scroll', function() {
      navbarCollapse.classList.remove('show');
    });
  });
  