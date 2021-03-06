<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Hello Vue</title>
</head>
<body>
<div id="app">
    <h1>{{message}}</h1>
    <input v-model="message">
    <textarea v-model="message"></textarea>
    <pre>
        {{$data}}
        <!--JSON 형태로 값을 출력해 준다. message: data -->
    </pre>
    <h1 v-show="!message">You must send a message for help!</h1>
    <!-- 토글 기능을 할 수 있다. -->
    <button v-show="message">
        <!-- message에 값이 있으면 버튼을 보여준다. display->none -->
        <!-- 렌더링에는 남아 있다는 점이 if와 다르다! 존재하지만 보이지 않을 뿐. -->
        send word to allies for help!
    </button>
    <hr>
    <button v-if="message">
        if button
    </button>
    <!-- v-else의 경우 if 다음에 나와야한다. 또한 show와 함께 할 수 없다. -->
    <h1 v-else="message">v-else code</h1>
    <hr>
    <template v-if="!message">
        <!-- 여러 개의 엘리먼트를 한번에 토글할 경우 템플릿 사용. -->
        <!-- 보이지 않는 래퍼로 사용 가능. 최공 결과에 렌더링 되지 않는다. -->
        <!-- v-show는 template에서 사용할 수 없다. -->
        <h1>You must send a message.</h1>
        <p>1ilsang.blog.me</p>
    </template>
</div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.1.10/vue.js"></script>
</html>

<script>
// var data = {
//     message: 'Greetings your majesty!'
// };
new Vue({
    el: '#app',
    // data: data
    data: {
        message: 'Greetings your majesty!'
    }
});
</script>