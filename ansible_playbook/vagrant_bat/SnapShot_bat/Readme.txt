
Vagrantでsnapshot操作するためのバッチ
※バッチは作りこんでないので引数等に注意
※使いやすいように改修してください

pluginインストールは以下の通り。
vagrant plugin install vagrant-vbox-snapshot

バッチ概要
対象VMのルートフォルダにて実行する。(vagrant up可能フォルダ)

○スナップショットを作成する
take_snapshot.bat <VM名> <メモ>
<VM名>_<メモ>_<日時>の名前のスナップショットを作成する。(例：build_srv_yumUpdate_20170419112058) 
リストの前後も表示します。

○スナップショットの一覧を出す
list_snapshot.bat <VM名>

○指定したスナップショットの状態に移行する
go_snapshot.bat <VM名> <スナップショット名>

○スナップショットを削除する
delete_snapshot.bat <VM名> <スナップショット名>

○直前のスナップショットに移行する。
back_snapshot.bat <VM名>


