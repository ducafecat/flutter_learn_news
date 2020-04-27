const String htmlPage = '''
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ducafecat</title>
    <style lang="css">
        body {
            margin: 0px;
            padding: 10px;
            min-height: 50px;
        }

        .doc {
            font-family: "Helvetica Neue", "Hiragino Kaku Gothic Pro", Helvetica, Arial, sans-serif;
            font-size: 18px;
            line-height: 30px;
            color: #56585c;
        }

        .tags {
            line-height: 2;
        }

        .tag {
            color: #56585c;
            text-decoration: none;
            background-color: #f6f6f6;
            border-color: #2e6da4;
            padding: 5px 10px;
            border: 1px solid transparent;
            border-radius: 6px;
        }

        .tag:link {
            color: #56585c;
        }
    </style>
</head>

<body>
    <div class="doc">
        <img width="100%"
            src="https://o.aolcdn.com/images/dimse/5845cadfecd996e0372f/a3c4873e97272b518d4a46c1696ce36f51a084fb/cXVhbGl0eT04NSZpbWFnZV91cmk9aHR0cHMlM0ElMkYlMkZvLmFvbGNkbi5jb20lMkZpbWFnZXMlMkZkaW1zJTNGY3JvcCUzRDE2MDAlMjUyQzEwNjclMjUyQzAlMjUyQzAlMjZxdWFsaXR5JTNEODUlMjZmb3JtYXQlM0RqcGclMjZyZXNpemUlM0QxNjAwJTI1MkMxMDY3JTI2aW1hZ2VfdXJpJTNEaHR0cHMlMjUzQSUyNTJGJTI1MkZzLnlpbWcuY29tJTI1MkZvcyUyNTJGY3JlYXRyLXVwbG9hZGVkLWltYWdlcyUyNTJGMjAyMC0wMyUyNTJGMjMzOGFhMDAtNWQ3ZS0xMWVhLWFmZDMtOTgzMmIxNjVmNDNjJTI2Y2xpZW50JTNEYTFhY2FjM2UxYjMyOTA5MTdkOTIlMjZzaWduYXR1cmUlM0QwNDYzODQ3MTA5NWJmYzdmOWIwYWQ0ZTcyZjM1ODAxYTk1NjI2M2QyJmNsaWVudD1hbXAtYmxvZ3NpZGUtdjImc2lnbmF0dXJlPTNmN2RlOGJlOGY2NGU5MzA2NjE4NzY2OTNjMWVlZDRkOTEzNDYwZTY=">

        <p>
            在苹果更新了 16 吋的 MacBook Pro 之后，下一个显示易见的问题便是：13 吋的 MBP 何时更新呢？据分析师郭明錤的说法，苹果有可能在今年内就会推出一款 14.1 吋的 MBP 来取代 13
            吋版本，并且采用 mini-LED 面板来提供更高的对比度与色彩表现。不过在面板的推测之外，其他项目郭倒是没有进行猜测，但应该可以预期它会采用与 16 吋兄弟相同的新键盘吧。
        </p>

        <img src="https://o.aolcdn.com/images/dimse/5845cadfecd996e0372f/feb84e59aff4d87e77cc0fbef98621f9815d259c/dGh1bWJuYWlsPTY0MCUyQyZxdWFsaXR5PTgwJmltYWdlX3VyaT1odHRwcyUzQSUyRiUyRnMueWltZy5jb20lMkZvcyUyRmNyZWF0ci11cGxvYWRlZC1pbWFnZXMlMkYyMDIwLTA0JTJGMmY2NzU5YTAtODU1OC0xMWVhLWJiNTctOWMzMmJmNjdlYWRlJmNsaWVudD1hbXAtYmxvZ3NpZGUtdjImc2lnbmF0dXJlPWMxZDIwNzAwNDU0MWIwODc2NjRlOTZlMmU4MjU4ODIzOTUwYWVmZGM="
            width="100%">

        <p>
            除了 14.1 吋的 MBP 之外，郭也预期苹果其他的产品也都有机会升级到 mini-LED 技术，在先前提过的 16 吋的 MBP 与 12.9 吋 iPad Pro（那 11 吋的呢？）之外，再加上基本款
            iPad、iPad Mini 和 iMac Pro 等。这种新面板以大量微小的白光 LED 排成阵列作为背光，让它可以更精准地控制背光量，在暗部直接关掉 LED
            的话可以带来「真正」的黑色（因为没有光源可以漏光），达成更高的对比。不过，mini-LED 面板容易在高对比的光暗交界处有「漏光」的问题，所以效果如何，还要看到真机才知道啰。
        </p>

        <p>
            不过，知道有机会搭载是一回事，什么时候上市又是另一回事了。除了 iMac Pro
            会在第四季上市之外，其他机种都是「不详」，而且现在还要再加上新冠病毒带来的不确定性。要知道郭的预言有没有成真，恐怕还要再多等上几个月了。
        </p>

        <div class="tags">
            <a href="/tag/chrome-os" class="tag">chrome os</a>
            <a href="/tag/chromebook" class="tag">chromebook</a>
            <a href="/tag/computer" class="tag">computer</a>
            <a href="/tag/gear" class="tag">gear</a>
            <a href="/tag/google" class="tag">google</a>
            <a href="/tag/laptop" class="tag">laptop</a>
            <a href="/tag/personal computing" class="tag">personal computing</a>
            <a href="/tag/personalcomputing" class="tag">personalcomputing</a>
            <a href="/tag/pixelbook-go" class="tag">pixelbook go</a>
        </div>
    </div>

</body>

</html>
''';
