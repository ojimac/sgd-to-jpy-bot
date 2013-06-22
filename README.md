1シンガポールドルが何円かをつぶやくTwitter bot

### memo
- rbenvを使ってcron実行する場合にちょっとハマった
- 参考 http://nefo.hatenablog.com/entry/20120515/1337034623
- cron設置
```sh
* * * * * bash -lc '/path/to/sgd-to-jpy-bot/sgd-to-jpy-bot.rb production &>> /path/to/sgd-to-jpy-bot/cron.log'
```
