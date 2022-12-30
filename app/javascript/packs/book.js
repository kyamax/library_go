window.addEventListener('load', function(){

  // ユーザーページ投稿一覧・いいねの表示
  const userBookField = document.getElementById("user_book_field");
  const userCard = document.getElementById("user_card");
  const userLikeField = document.getElementById("user_like_field");
  const userLikes = document.getElementById("user_likes");

  // ユーザー投稿
  userBookField.addEventListener('click', function(){
    if (userCard.getAttribute("style") == "display:flex;"){
      userCard.removeAttribute("style");
      userBookField.removeAttribute("style", "border-bottom: #999 solid 3px;", "padding-bottom: 3px;");
    } else if (userLikeField.addEventListener('click', function(){
      userCard.removeAttribute("style");
      userBookField.removeAttribute("style", "border-bottom: #999 solid 3px;", "padding-bottom: 3px;");
    })){
    } else {
      userCard.setAttribute("style", "display:flex;");
      userBookField.setAttribute("style", "border-bottom: #999 solid 3px;", "padding-bottom: 3px;");
    };
  });

  // ユーザーいいね
  userLikeField.addEventListener('click', function(){
    if (userLikes.getAttribute("style") == "display:flex;"){
      userLikes.removeAttribute("style")
      userLikeField.removeAttribute("style", "border-bottom: #999 solid 3px;", "padding-bottom: 3px;");
    } else if (userBookField.addEventListener('click', function(){
      userLikes.removeAttribute("style")
      userLikeField.removeAttribute("style", "border-bottom: #999 solid 3px;", "padding-bottom: 3px;");
    })){
    } else {
      userLikes.setAttribute("style", "display:flex;");
      userLikeField.setAttribute("style", "border-bottom: #999 solid 3px;", "padding-bottom: 3px;");
    }
  });



});
