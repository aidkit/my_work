
Vagrantの仮想マシン生成バッチ
※バッチは作りこんでないので引数等に注意
※使いやすいように改修してください


バッチ概要(ローカルホストにて実行する。) 


○0_Vagrant_仮想環境初期化.bat
	指定仮想環境を初期化(破棄＆生成)します。
	既に存在する仮想マシンがある場合は、仮想環境を破棄し、再生成します。
	※
	バッチ実行時に以下問合せがあるので入力する。
		・作業ディレクトリルートパスを入力してください。：				←作業ワークスペースのパスを入力(例：C:\vagrant_wk)
		・仮想ノード名称を入力してください。：							←仮想マシンノード名(=ホスト名)を入力する。(例：control)
		・追加するBOXのパスを入力してください。(exp: file://パス)：		←適用するVagrant BOXファイルパスを指定(例：\\10.161.131.158\TakusoF-WK\9000_Work\vagrant_box\centos-6.6-ja_x86_64_v1.1.box)
		・ノードに適用するBOXの名称を入力してください。：				←ノードに適用するBOXの名称を指定(例：centos-6.6-ja_x86_64_v1.1)
		・適用するVagrantファイルがあれば、格納パスを入力してください。(exp: \\10.XX.XX.XX\xxxx\)：	←設定済みVagrantファイルを適用したい場合格納パスを指定(オプション)
																									(例：\\10.161.131.158\TakusoF-WK\9000_Work\vagrant_box\vagrantfile\custom_base_to_v1.1.1)

○1_Vagrant_ノード初期化.bat
	0_Vagrant_仮想環境初期化.batのノードのみ初期化するバッチ
	
○2_Vagrant_Box追加.bat
	VagrantBox追加するバッチ
	
○3_Vagrant_Box_削除.bat
	VagrantBox削除するバッチ

○Replace_FileStr.bat
	上記バッチから呼び出されるバッチです。同じフォルダに配置ください。

////////////////　　サンプル　///////////////　　
(C:\vagrant_wkに「control」というANSIBLE仮想環境(centos-6.6-ja_x86_64_v1.1.boxベース＋v1.1.1設定)を再生成する為、0_Vagrant_仮想環境初期化.batを実行)
　　　※v1.0などの情報については、<\\10.161.131.158\TakusoF-WK\9000_Work\vagrant_box\BOX変更履歴.xlsx>参照
	

	　　※※※※以下、バッチ実行コンソール　#[]部分は説明の為のコメント※※※※

作業ディレクトリルートパスを入力してください。：C:\vagrant_wk

仮想ノード名称を入力してください。：control

追加するBOXのパスを入力してください。(exp: file://パス)：\\10.161.131.158\TakusoF-WK\9000_Work\vagrant_box\centos-6.6-ja_x86_64_v1.1.box

"------BOX一覧表示------"														#[ここは追加済BOXのみ表示]
centos-6.6-ja_x86_64_v1.0 (virtualbox, 0)
centos-6.6-ja_x86_64_v1.1 (virtualbox, 0)


ノードに適用するBOXの名称を入力してください。：centos-6.6-ja_x86_64_v1.1

適用するVagrantファイルがあれば、格納パスを入力してください。(exp: \\10.XX.XX.XX\xxxx\)：\\10.161.131.158\TakusoF-WK\9000_Work\vagrant_box\vagrantfile\custom_base_to_v1.1.1

C:\vagrant_wkに仮想環境を構築します。よろしいですか？(y/n)：y

arg1:C:\vagrant_wk\control arg2:\\10.161.131.158\TakusoF-WK\9000_Work\vagrant_box\centos-6.6-ja_x86_64_v1.1.box arg3:centos-6.6-ja_x86_64_v1.1 arg4:\\10.161.131.158\TakusoF-WK\9000_Work\vagrant_box\vagrantfile\custom_base_to_v1.1.1


"指定フォルダC:\vagrant_wk\controlがあるので再作成します。"						#[新規の場合は以下破棄処理は行われません。]

"------指定フォルダがあるので再作成します。------"

"------全VM停止------"
==> control: Attempting graceful shutdown of VM...

"------全VM破棄------"
    control: Are you sure you want to destroy the 'control' VM? [y/N]y			#[VM破棄の問合せに'y'入力]
==> control: Destroying VM and associated drives...


"------BOX削除------"
Removing box 'centos-6.6-ja_x86_64_v1.1' (v0) with provider 'virtualbox'...


"------BOX一覧表示------"
centos-6.6-ja_x86_64_v1.0 (virtualbox, 0)


"------C:\vagrant_wk\control　配　下　削　除------"

"！！！仮想環境削除のみの場合はここでCTRL+C！！！"
続行するには何かキーを押してください . . .										#[仮想環境破棄のみの場合はここでCTRL+Cで強制終了できます]
																				#[ここから生成処理]
"作業ディレクトリ作成"


 ドライブ C のボリューム ラベルは OS です
 ボリューム シリアル番号は 04B5-626E です

 C:\vagrant_wk\control のディレクトリ

2017/04/26  11:27    <DIR>          .
2017/04/26  11:27    <DIR>          ..
               0 個のファイル                   0 バイト
               2 個のディレクトリ  279,622,049,792 バイトの空き領域


"------BOX一覧表示------"
centos-6.6-ja_x86_64_v1.0 (virtualbox, 0)


"------BOX追加------"
==> box: Box file was not detected as metadata. Adding it directly...
==> box: Adding box 'centos-6.6-ja_x86_64_v1.1' (v0) for provider:
    box: Unpacking necessary files from: file:////10.161.131.158/TakusoF-WK/9000_Work/vagrant_box/centos-6.6-ja_x86_64_v1.1.box
    box: Progress: 100% (Rate: 24.0M/s, Estimated time remaining: --:--:--)
==> box: Successfully added box 'centos-6.6-ja_x86_64_v1.1' (v0) for 'virtualbox'!


"------BOX一覧表示------"
centos-6.6-ja_x86_64_v1.0 (virtualbox, 0)
centos-6.6-ja_x86_64_v1.1 (virtualbox, 0)


"------VM初期化------"
A `Vagrantfile` has been placed in this directory. You are now
ready to `vagrant up` your first virtual environment! Please read
the comments in the Vagrantfile as well as documentation on
`vagrantup.com` for more information on using Vagrant.


"------Vagrantファイルコピー------"												#[指定した設定済Vagrantファイルを取得しています。]
\\10.161.131.158\TakusoF-WK\9000_Work\vagrant_box\vagrantfile\custom_base_to_v1.1.1\Vagrantfile
\\10.161.131.158\TakusoF-WK\9000_Work\vagrant_box\vagrantfile\custom_base_to_v1.1.1\ansible_local\inventory
\\10.161.131.158\TakusoF-WK\9000_Work\vagrant_box\vagrantfile\custom_base_to_v1.1.1\ansible_local\site.yml
\\10.161.131.158\TakusoF-WK\9000_Work\vagrant_box\vagrantfile\custom_base_to_v1.1.1\ansible_local\host_vars\_NODE_NAME.yml
\\10.161.131.158\TakusoF-WK\9000_Work\vagrant_box\vagrantfile\custom_base_to_v1.1.1\ansible_local\roles\ansible_setting\tasks\main.yml
\\10.161.131.158\TakusoF-WK\9000_Work\vagrant_box\vagrantfile\custom_base_to_v1.1.1\ansible_local\roles\ansible_setting\templates\ansible.cfg.j2
\\10.161.131.158\TakusoF-WK\9000_Work\vagrant_box\vagrantfile\custom_base_to_v1.1.1\ansible_local\roles\ansible_setting\templates\set_authorized_key.yml.j2
\\10.161.131.158\TakusoF-WK\9000_Work\vagrant_box\vagrantfile\custom_base_to_v1.1.1\ansible_local\roles\os_setting\tasks\main.yml
\\10.161.131.158\TakusoF-WK\9000_Work\vagrant_box\vagrantfile\custom_base_to_v1.1.1\ansible_local\roles\package_inst\tasks\main.yml
\\10.161.131.158\TakusoF-WK\9000_Work\vagrant_box\vagrantfile\custom_base_to_v1.1.1\ansible_local\roles\user_group_setting\tasks\main.yml
10 個のファイルをコピーしました

"------VagrantファイルVM名称置換------"											#[ここからは設定済Vagrantファイルに指定BOX名、ノード名を反映(置換等)しています。]
        1 個のファイルをコピーしました。
2017/04/26 11:28:05.75 Replace_FileStr 処理開始します。
2017/04/26 11:28:06.17 Replace_FileStr 正常終了です。

"------Vagrantファイルノード名称置換------"
        1 個のファイルをコピーしました。
2017/04/26 11:28:06.20 Replace_FileStr 処理開始します。
2017/04/26 11:28:06.52 Replace_FileStr 正常終了です。

"------ansivle inventory ノード名称置換------"
        1 個のファイルをコピーしました。
2017/04/26 11:28:06.55 Replace_FileStr 処理開始します。
2017/04/26 11:28:06.63 Replace_FileStr 正常終了です。
"------ansivle host_vars ファイル名置換------"
        1 個のファイルを移動しました。
"------------------------------------------------------------------------"
"-----  Vagrantファイル修正が必要な場合、修正後続行してください。--------"
"------------------------------------------------------------------------"


続行するには何かキーを押してください . . .										#[さらに手動でIP等Vagrant設定を追加する場合、ここの一時中断時に修正する。]
"------全VM起動------"															#[以下,仮想マシン起動(vagrant up --provision)]
Bringing machine 'control' up with 'virtualbox' provider...
==> control: Importing base box 'centos-6.6-ja_x86_64_v1.1'...
==> control: Matching MAC address for NAT networking...
==> control: Setting the name of the VM: control_control_1493173960193_61312
==> control: Clearing any previously set network interfaces...
==> control: Preparing network interfaces based on configuration...
    control: Adapter 1: nat
    control: Adapter 2: hostonly
==> control: Forwarding ports...
    control: 22 (guest) => 2222 (host) (adapter 1)
==> control: Booting VM...
==> control: Waiting for machine to boot. This may take a few minutes...
    control: SSH address: 127.0.0.1:2222
    control: SSH username: vagrant
    control: SSH auth method: private key
    control: Warning: Remote connection disconnect. Retrying...
==> control: Machine booted and ready!
==> control: Checking for guest additions in VM...
    control: The guest additions on this VM do not match the installed version of
    control: VirtualBox! In most cases this is fine, but in rare cases it can
    control: prevent things such as shared folders from working properly. If you see
    control: shared folder errors, please make sure the guest additions within the
    control: virtual machine match the version of VirtualBox you have installed on
    control: your host and reload your VM.
    control:
    control: Guest Additions Version: 4.3.28
    control: VirtualBox Version: 5.1
==> control: Setting hostname...
==> control: Configuring and enabling network interfaces...
==> control: Configuring proxy environment variables...
==> control: Configuring proxy for Yum...
==> control: Mounting shared folders...
    control: /vagrant => C:/vagrant_wk/control
==> control: Running provisioner: shell...
    control: Running: inline script
==> control: 読み込んだプラグイン:fastestmirror
==> control: インストール処理の設定をしています
==> control: Loading mirror speeds from cached hostfile
==> control:  * epel: ae.mirror.rasanegar.com
==> control: パッケージ man-1.6f-39.el6.x86_64 はインストール済みか最新バージョンです
==> control: 何もしません
==> control: 読み込んだプラグイン:fastestmirror
==> control: インストール処理の設定をしています
==> control: Loading mirror speeds from cached hostfile
==> control:  * epel: ae.mirror.rasanegar.com
==> control: パッケージ man-pages-3.22-20.el6.noarch はインストール済みか最新バージョンです
==> control: 何もしません
==> control: 読み込んだプラグイン:fastestmirror
==> control: インストール処理の設定をしています
==> control: Loading mirror speeds from cached hostfile
==> control:  * epel: ae.mirror.rasanegar.com
==> control: パッケージ man-pages-ja-20100115-10.el6.noarch はインストール済みか最新バージョンです
==> control: 何もしません
==> control: Running provisioner: ansible_local...
    control: Running ansible-playbook...
cd /vagrant && PYTHONUNBUFFERED=1 ANSIBLE_NOCOLOR=true ansible-playbook --limit="all" --inventory-file=ansible_local/inventory -v ansible_local/site.yml
Using /etc/ansible/ansible.cfg as config file
[DEPRECATION WARNING]: Instead of sudo/sudo_user, use become/become_user and
make sure become_method is 'sudo' (default).
This feature will be removed in a
future release. Deprecation warnings can be disabled by setting
deprecation_warnings=False in ansible.cfg.

PLAY [manage_server] ***********************************************************

TASK [setup] *******************************************************************
ok: [control]

TASK [package_inst : yumにて、package"[u'openssh', u'python-passlib', u'python-pip']"をインストールします。] ***
changed: [control] => (item=[u'openssh', u'python-passlib', u'python-pip']) => {"changed": true, "item": ["openssh", "python-passlib", "python-pip"], "msg": "", "rc": 0, "results": ["All packages prov
iding openssh are up to date", "読み込んだプラグイン:fastestmirror\nインストール処理の設定をしています\nLoading mirror speeds from cached hostfile\n * epel: ae.mirror.rasanegar.com\n依存性の解決をして
います\n--> トランザクションの確認を実行しています。\n---> Package python-passlib.noarch 0:1.5.3-1.el6 will be インストール\n---> Package python-pip.noarch 0:7.1.0-1.el6 will be インストール\n--> 依存
性解決を終了しました。\n\n依存性を解決しました\n\n================================================================================\n パッケージ             アーキテクチャ バージョン            リポジ
トリー  容量\n================================================================================\nインストールしています:\n python-passlib         noarch         1.5.3-1.el6           epel         290 k
\n python-pip             noarch         7.1.0-1.el6           epel         1.5 M\n\nトランザクションの要約\n================================================================================\nインスト
ール         2 パッケージ\n\n総ダウンロード容量: 1.8 M\nインストール済み容量: 8.1 M\nパッケージをダウンロードしています:\n------------------------------------------------------------------------------
--\n合計                                            182 kB/s | 1.8 MB     00:10     \nrpm_check_debug を実行しています\nトランザクションのテストを実行しています\nトランザクションのテストを成功しました
\nトランザクションを実行しています\n\r  インストールしています  : python-passlib-1.5.3-1.el6.noarch               1/2 \n\r  インストールしています  : python-pip-7.1.0-1.el6.noarch                   2/
2 \n\r  Verifying               : python-pip-7.1.0-1.el6.noarch                   1/2 \n\r  Verifying               : python-passlib-1.5.3-1.el6.noarch               2/2 \n\nインストール:\n  python-pa
sslib.noarch 0:1.5.3-1.el6      python-pip.noarch 0:7.1.0-1.el6     \n\n完了しました!\n"]}

TASK [package_inst : pipにて、pexpectをインストールします。] *********************************
changed: [control] => {"changed": true, "cmd": "/usr/bin/pip2 install -U pexpect", "name": ["pexpect"], "requirements": null, "state": "latest", "stderr": "/usr/lib/python2.6/site-packages/pip/_vendor
/requests/packages/urllib3/util/ssl_.py:90: InsecurePlatformWarning: A true SSLContext object is not available. This prevents urllib3 from configuring SSL appropriately and may cause certain SSL conne
ctions to fail. For more information, see https://urllib3.readthedocs.org/en/latest/security.html#insecureplatformwarning.\n  InsecurePlatformWarning\nYou are using pip version 7.1.0, however version
9.0.1 is available.\nYou should consider upgrading via the 'pip install --upgrade pip' command.\n/usr/lib/python2.6/site-packages/pip/_vendor/requests/packages/urllib3/util/ssl_.py:90: InsecurePlatfor
mWarning: A true SSLContext object is not available. This prevents urllib3 from configuring SSL appropriately and may cause certain SSL connections to fail. For more information, see https://urllib3.r
eadthedocs.org/en/latest/security.html#insecureplatformwarning.\n  InsecurePlatformWarning\n", "stdout": "Collecting pexpect\n  Downloading pexpect-4.2.1-py2.py3-none-any.whl (55kB)\nCollecting ptypro
cess>=0.5 (from pexpect)\n  Downloading ptyprocess-0.5.1-py2.py3-none-any.whl\nInstalling collected packages: ptyprocess, pexpect\nSuccessfully installed pexpect-4.2.1 ptyprocess-0.5.1\n", "stdout_lin
es": ["Collecting pexpect", "  Downloading pexpect-4.2.1-py2.py3-none-any.whl (55kB)", "Collecting ptyprocess>=0.5 (from pexpect)", "  Downloading ptyprocess-0.5.1-py2.py3-none-any.whl", "Installing c
ollected packages: ptyprocess, pexpect", "Successfully installed pexpect-4.2.1 ptyprocess-0.5.1"], "version": null, "virtualenv": null}

TASK [os_setting : ファイル"/etc/hosts"に"192.168.33.20    node1"を追記] ***************
changed: [control] => {"backup": "", "changed": true, "msg": "line added"}

TASK [user_group_setting : グループ"ansible"を追加] ***********************************
changed: [control] => {"changed": true, "gid": 501, "name": "ansible", "state": "present", "system": false}

TASK [user_group_setting : ユーザ"ansible"を追加] ************************************
changed: [control] => {"changed": true, "comment": "", "createhome": true, "group": 100, "groups": "ansible", "home": "/home/ansible", "name": "ansible", "password": "NOT_LOGGING_PASSWORD", "shell": "
/bin/bash", "ssh_fingerprint": "2048 2b:52:75:aa:ff:47:c4:3c:e0:a1:e5:8a:6b:b2:33:1e /home/ansible/.ssh/id_rsa.pub (RSA)", "ssh_key_file": "/home/ansible/.ssh/id_rsa", "ssh_public_key": "ssh-rsa AAAAB
3NzaC1yc2EAAAABIwAAAQEApNWNMCL5ds8RtGwT2Do5wAFT7KwHtZ8TNg239Qeiy7Hk5DzzMws2ut1a81b0nU+Rw9iljQSCkitxILZHlR45/P5IiOjgQkV5JpSfpMf5VITnED1VVw5XsylNQYbRUAaZVyUXTb5QrPSneJtjTFschgBR3qnnfmdSDkdsZi1Jcipmt+UF8
Bcs2y+RkNPGVy1nJReDlg8+nHbVA2TNm+NnsDJbw/9uBbDb+L5eeb18QqhfF/OkznbQd9AkUuniCdykPqNcyk6v071z+tmXhBLhvN1NsPYyVqusg2ZYczgAz7OkUql52UZUG+u/WXjeYaJxE8Q8pMNB2NvHBkXR6yX/fQ== ansible-generated on control", "
state": "present", "system": false, "uid": 501}

TASK [ansible_setting : ansible作業ディレクトリを複製] ************************************
changed: [control] => {"changed": true, "dest": "/home/ansible/", "src": "/etc/ansible"}

TASK [ansible_setting : ansible rolesディレクトリを複製] ********************************
changed: [control] => {"changed": true, "gid": 501, "group": "ansible", "mode": "0755", "owner": "ansible", "path": "/home/ansible//roles", "size": 4096, "state": "directory", "uid": 501}

TASK [ansible_setting : ファイル"/home/ansible/"hostsに"[u'[servers]', u'node1']"を追記] ***
changed: [control] => (item=[servers]) => {"backup": "", "changed": true, "item": "[servers]", "msg": "line added"}
changed: [control] => (item=node1) => {"backup": "", "changed": true, "item": "node1", "msg": "line added"}

TASK [ansible_setting : ファイル/home/ansible/ansible.cfgを配備] **********************
changed: [control] => {"changed": true, "checksum": "6cf55a73e373c257977da14259f5c2f0e66d8f55", "dest": "/home/ansible/ansible.cfg", "gid": 501, "group": "ansible", "md5sum": "669992034c97daa7ae92ec51
0277c1de", "mode": "0644", "owner": "ansible", "size": 14415, "src": "/home/vagrant/.ansible/tmp/ansible-tmp-1493174151.1-180173756140446/source", "state": "file", "uid": 501}

TASK [ansible_setting : ファイル/home/ansible/set_authorized_key.ymlを配備] ***********
changed: [control] => {"changed": true, "checksum": "8dcb7e893794f77f23bfd828b0eee97dd98a03ee", "dest": "/home/ansible/set_authorized_key.yml", "gid": 501, "group": "ansible", "md5sum": "50df6c335a777
b1b3f0b8c3fb18a3a60", "mode": "0644", "owner": "ansible", "size": 264, "src": "/home/vagrant/.ansible/tmp/ansible-tmp-1493174151.65-244175778568538/source", "state": "file", "uid": 501}

TASK [ansible_setting : set_authorized_key.ymlを実行] *****************************
changed: [control] => {"changed": true, "cmd": "/bin/bash -lc \"ansible-playbook set_authorized_key.yml -i ./hosts -u vagrant -k\"", "delta": "0:00:03.649675", "end": "2017-04-26 11:35:56.132996", "rc
": 0, "start": "2017-04-26 11:35:52.483321", "stdout": "SSH password: \r\n\r\nPLAY [all] *********************************************************************\r\n\r\nTASK [setup] *********************
**********************************************\r\nok: [node1]\r\n\r\nTASK [Set authorized key] ******************************************************\r\nchanged: [node1]\r\n\r\nPLAY RECAP ************
*********************************************************\r\nnode1                      : ok=2    changed=1    unreachable=0    failed=0   ", "stdout_lines": ["SSH password: ", "", "PLAY [all] *******
**************************************************************", "", "TASK [setup] *******************************************************************", "ok: [node1]", "", "TASK [Set authorized key] *
*****************************************************", "changed: [node1]", "", "PLAY RECAP *********************************************************************", "node1                      : ok=2
  changed=1    unreachable=0    failed=0   "]}

TASK [ansible_setting : set_authorized_key.ymlファイルを削除] *************************
changed: [control] => {"changed": true, "path": "/home/ansible/set_authorized_key.yml", "state": "absent"}

PLAY RECAP *********************************************************************
control                    : ok=13   changed=12   unreachable=0    failed=0					#[ansible_localによる構築結果]



"------全VM状態表示------"
Current machine states:

control                   running (virtualbox)									#[仮想マシン起動確認]

The VM is running. To stop this VM, you can run `vagrant halt` to
shut it down forcefully, or you can run `vagrant suspend` to simply
suspend the virtual machine. In either case, to restart it again,
simply run `vagrant up`.
続行するには何かキーを押してください . . .


※※終了※※


上記でAnsible管理サーバが構築され、管理対象サーバにannsibleコマンド実行できる状態となる想定です。
(ただし、Vagrant　ansible_local設定で管理対象サーバの定義を合わせる必要があります。)
なにをやっているかは、バッチ＋Vagrantfile+ansibleプレイブックを参照ください。。
