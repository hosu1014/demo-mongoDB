<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.1.10/vue.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>1ilsang.blog.me</title>
</head>
<body>
<div class="container">
    <h1>Hello Bootstrap, sit next to Vue.</h1>
    <div>
    <ul class="list-group">
        <!--<li v-for="i in 11" class="list-group-item">-->
            <!--&lt;!&ndash; i는 1부터 시작해서 11까지 11번 돈다. &ndash;&gt;-->
            <!--{{i-1}} times 4 equals {{(i-1)*4}}.-->
        <!--</li>-->

        <!--<li v-for="story in stories" class="list-group-item">-->
            <!--Someone said "{{story}}"-->
        <!--</li>-->

        <li v-for="story in stories" class="list-group-item">
            {{story.writer}} said "{{story.plot}}"
        </li>
        <li v-for="(story, index) in stories" class="list-group-item">
            <!-- index 로 순회 번호를 뽑을 수 있다. -->
            {{index}} {{story.writer}} said "{{story.plot}}"
        </li>

        <li v-for="(value, key, index) in story" class="list-group-item">
            <!-- index 로 순회 번호를 뽑을 수 있다. -->
            {{index}} :// {{key}} : "{{value}}"
        </li>
    </ul>
    </div>
    <pre>
        {{$data}}
    </pre>
</div>
</body>

<script type="text/javascript">
new Vue({
    el: '.container',
    // data:{
    //     stories:[
    //         "I crashed my car today!",
    //         "1ilsang.blog.me",
    //         "Lee Sang Chul"
    //     ]
    // }
    data:{
        stories:[
            {
                plot : "I crashed my car today!",
                writer : "Alext"
            },
            {
                plot : "Hello World!",
                writer : "John"
            },
            {
                plot: "1ilsang.blog.me",
                writer: "Jackson Lee"
            }
        ],
        story: {
            plot: "Someone ate my chocolate...",
            writer: "John",
            upvotes : 47
        }
    }
});
</script>

</html>