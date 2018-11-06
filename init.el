;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;基本設定  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; path ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/elisp/")
(add-to-list 'load-path "~/.emacs.d/elpa/")
(add-to-list 'load-path "~/.emacs.d/public_reps/")

;; ;; load-path
;; (let ((default-directory (expand-file-name "~/.emacs.d/elpa")))
;;   (add-to-list 'load-path default-directory)
;;   (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
;;       (normal-top-level-add-subdirs-to-load-path)))

;; (defun add-to-load-path (&amp;rest paths)
;;   (let (path)
;;     (dolist (path paths paths)
;;       (let ((default-directory
;;               (expand-file-name (concat user-emacs-directory path))))
;;         (add-to-list 'load-path default-directory)
;;         (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
;;             (normal-top-level-add-subdirs-to-load-path))))))

;;; package.el
(require 'package)
;; MELPAを追加
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; MELPA-stableを追加
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
;; Marmaladeを追加
(add-to-list 'package-archives  '("marmalade" . "https://marmalade-repo.org/packages/"))
;; Orgを追加
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
;; 初期化
(package-initialize)


;;;;;;;;;;;;;;;;;;;;;;;;;  表示画面関連 ;;;;;;;;;;;;;;;;;
;; color-thema
(add-to-list 'load-path "~/.emacs.d/elisp/color-theme-6.6.0/")
(when (require 'color-theme nil t)
    (color-theme-initialize)
    (color-theme-midnight)
    (set-face-italic-p font-lock-comment-face t)
    ;(set-face-underline-p font-lock-comment-face t)    
    )

;; region を塗る
(setq transient-mark-mode t)

;; region の face 変更
(set-face-background 'region "SeaGreen4")
;RoyalBlue4")
;
;;;;;;;;;;;;;;;;;;;;;;;;  font  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(set-face-attribute 'default nil
                    :family "monaco" :height 110 :weight 'normal)

(set-fontset-font
; (frame-parameter nil 'font)
  nil 'japanese-jisx0208
  (font-spec :family "Osaka"))
; (font-spec :family "ヒラギノ明朝 Pro"))

;;;;;;;;;;;;;;;;;;;;;;; ハイライト ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defface my-hl-line-face
  '((((class color) )
     (:background "NavyBlue" t))
    ;(((class color) (background light))
    ; (:background "LightGoldenrodYellow" t))
    (t (:bold t)))
  "hl-line's my face")
(setq hl-line-face 'my-hl-line-face)
(global-hl-line-mode t)

;; paren-mode
(setq show-paren-delay 0) ; 表示までの秒数
(show-paren-mode t)
(setq show-paren-style 'expression)
; face の変更
(set-face-background 'show-paren-match-face nil)
(set-face-underline-p 'show-paren-match-face "yellow")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 画面の設定
(if window-system (progn 
 ;;ウィンドウサイズでフォルト
 (setq initial-frame-alist '((width . 250) (height . 100) (top . 0)(left . 0)))))
 ;;文字の色
 ;(add-to-list 'default-frame-alist '(foreground-color . "white"))
 ;; 背景色
 ;(add-to-list 'default-frame-alist '(background-color . "black"))
;))
;; カーソルの色を設定  
  ;(add-to-list 'default-frame-alist '(cursor-color . "Gray"))
  ;; マウスポインタの色を設定します。
  ;(add-to-list 'default-frame-alist '(mouse-color . "SlateBlue2"))
  ;; モードラインの文字の色を設定します。
  ;(set-face-foreground 'modeline "white")
  ;; モードラインの背景色を設定します。
  ;(set-face-background 'modeline "MediumPurple2")
  ;; 選択中のリージョンの色を設定します。
;  (set-face-background 'region "LightSteelBlue1")
  ;; モードライン（アクティブでないバッファ）の文字色を設定します。
  ;(set-face-foreground 'mode-line-inactive "gray30")
  ;; モードライン（アクティブでないバッファ）の背景色を設定します。
  ;(set-face-background 'mode-line-inactive "gray85")

;;　ビープ音を消す 
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; デフォルトの透明度を設定する (75%)
(add-to-list 'default-frame-alist '(alpha . (85 50)))

;; ファイルパス表示
(setq frame-title-format (format "%%f - Emacs@%s" (system-name)))

;; 行数表示
(line-number-mode t)

;; スタートアップページを表示しない
(setq inhibit-startup-message t)

;;バックアップファイルを作らない
(setq backup-inhibited t)

;;範囲指定 Ctr+Space
(setq transient-mark-mode t)

;; タブ文字はスペース4文字分
(setq default-tab-width 4)

;; space を使うわずにタブを使用
(setq-default tab-width 4 indent-tabs-mode nil)

;;対応する括弧を光らせる
;(show-paren-mode 1)

;; ウィンドウ分割時に画面外へ出る文章を折り返す
(setq truncate-partial-width-windows nil)

;; CoCoaEmacs 以外はメニューバーを非表示
(unless (eq window-system 'ns)
  (menu-bar-mode nil))

;; tool-bar を非表示
(tool-bar-mode 0)

;; input method の設定
(setq default-input-method "MacOSX") 

;; scratchの初期メッセージ消去
(setq initial-scratch-message "")

;;;;;;;;;;;;;;;;;;;;;;; フレーム表示関連 ;;;;;;;;;;;;;;;;;;;;;;;;;

;; columen number も表示
(column-number-mode t)

;; ファイルサイズ表示
(size-indication-mode t)

;; リージョン内の行数と単語数を表示
(defun count-lines-and-chars ()
  (if mark-active
      (format "%d lines, %d chars "
             (count-lines (region-beginning) (region-end))
             (- (region-end) (region-beginning)))
    ""))
;;(add-to-list 'default-mode-line-format
;;             '(:eval (count-lines-and-chars)))

;; タイトルバーに情報の表示 フルパス & ファイルサイズ
(setq frame-title-format "%f")

;; GC を減らして軽くする
(setq gc-cons-threshold ( * 30 gc-cons-threshold))

;; ダイアログボックスを使わないように
(setq use-dialog-box nil)
(defalias 'message-box 'message)

;; キーストロークをエコーエリアに速く表示
(setq echo-keystrokes 0.1)

;; 履歴の保存数を上げる
(setq history-length 1000)

;; 大きいファイルの表示時の警告上限を上げる 25MB
(setq large-file-warning-threshold (* 25 1024 1024))

;; ミニバッファを再帰的に呼び出せるように
(setq enable-recursive-minibuffers t)

;;;;;;;;;;;;;;;;  言語設定 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;; ファイル名の扱いを設定 (in case of MacOSX)
(when (eq system-type 'darwin)
  (require 'ucs-normalize)
  (set-file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; コマンド  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;リターンと改行でインデント
(global-set-key "\C-m" 'newline-and-indent) 
; or 
;(global-set-key (kbd "C-m") 'newline-and-indent)

;; C-h をバックスペースに
(keyboard-translate ?\C-h ?\C-?)
;; help command は C-x ? へ
(define-key global-map (kbd "C-x ?") 'help-command)

;; 行の折り返し表示トグル
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)

;; window 切り替えの変更 C-x o => C-,'
(defun other-window-or-split ()
    (interactive)
      (when (one-window-p)
            (split-window-horizontally))
        (other-window 1))
(global-set-key (kbd "C-.") 'other-window-or-split)

;;改行
;(global-set-key "\C-j" 'newline) 

;; C-z の suspend を解除
(global-unset-key "\C-z")


;; sequential-command-config
;; C-e, C-a の挙動変化, 1: 行, 2: バフッファ, 3: 元の位置
;; M-u, M-l, M-c の挙動変化. 単語のあとでOK, 再帰的に直前の単語にも
(require 'sequential-command-config)
(sequential-command-setup-keys)

;; M-x follow-delete-other-windows-and-split
(global-set-key (kbd "C-c z") 'follow-delete-other-windows-and-split)
(global-set-key (kbd "C-c x") 'follow-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; elisp ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; package.el , melpa
;; (require 'package)
;; (add-to-list 'package-archives
;;               '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; (package-initialize)



;; auto-install 設定
;; M-x install-elisp で 実行
;; (when (require 'auto-install nil t)
;;   ;; install dir の設定
;;   (setq auto-install-directory "~/.emacs.d/elisp")
;;   ;; EmacsWiki にある elisp の自動取得
;;   (auto-install-update-emacswiki-package-name t)
;;   ;; プロキシ設定
;;   (setq auto-install-use-wget nil)
;;   ;(setq url-proxy-services '(("http" . "proxy2.rdh.ecl.ntt.co.jp:20066")))
;;   ;(setq url-proxy-services '(("https" . "proxy2.rdh.ecl.ntt.co.jp:20066")))  
;;   ;; install-elisp の関数を利用可能に
;;   (auto-install-compatibility-setup))

;;linum 設定
(require 'linum)
(global-linum-mode 0)
;(setq linum-format "%d5")
;F5キーにON/OFFの切り替えを割り当てる
(global-set-key [f5] 'linum-mode)

;; mcomplete ミニバッファで M-x時のインクリメンタル補完
(require 'mcomplete)

;; redo+
;; (when (require 'redo+ nil t)
;;   ;; C-' に redo を
;;   (global-set-key (kbd "C-'") 'redo)
;;   )

;; color-moccur
;; 検索結果のリストアップ
(when (require 'color-moccur nil t)
  ;; M-o に occur-by-moccur を割り当て
  (define-key global-map (kbd "M-o") 'occur-by-moccur)
  ;; スペース区切りで AND 検索
  (setq moccur-split-word t)
  ;; ディレクトリ検索のとき除外するファイル
  (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
  (add-to-list 'dmoccur-exclusion-mask "^#.+#$")
  ;; Migemo を利用できる環境であれば Migemo を利用
  (when (and (executable-find "cmigemo")
             (require 'migemo nil t))
    (setq moccur-use-migemo t)))
;; マルチバッファを検索, 結果のリストアップ M-x moccur
;; カレントバッファを県債, リストアップ M-o   , M-x occur-by-moccur
;;  RET で次行へジャンプ

;; auto-complete
(add-to-list 'load-path "~/.emacs.d/elisp/auto-complete-1.3.1")
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
               "~/.emacs.d/elisp/ac-dict")
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default))

;; ffap
(ffap-bindings)

;; uniqufy
(require 'uniquify)
;; filename<dir> 形式のバッファ名にする
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;; * で囲まれたバッファは除く
(setq uniquify-ignore-buffers-re "*[^*]+*")

;; iswitchb.el
;; C-s,  C-r で候補選択, TAB で候補, C-k でバッファ削除
;(iswitchb-mode 1)
;; バッファ読み取り関数を iswitchb に
;(setq read-buffer-function 'iswitchb-read-buffer)
;; 部分文字列の代わりに正規表現を使う場合は tに
;(setq iswitchb-regexp nil)
;; 新しいばっふぁを作成時に聞かない
;(setq iswitchb-prompt-newbuffer nil)
; ↓　IDO へ置き換え
;; IDO 
(ido-mode 1)
(ido-everywhere 1)

;; recentf-ext.el
;; M-x recentf-open-files
;; 最近のファイルを 300 保存
(setq recentf-max-saved-items 300)
;; 最近使ったファイルに加えないファイルを正規表現指定
(setq recentf-exclude '("/TAGS$" "/var/tmp/"))
(require 'recentf-ext)
;; recentf-open-files を M-n へ割り当て
(global-set-key (kbd "M-n") 'recentf-open-files)


;; bookmark.el
;; C-x r m (bookmark-set) で登録, C-x r l (bookmark-bmenu-list) でジャンプ
;; d, k で削除マークし, x で削除
;; bookmark を変更したら保存
(setq bookmark-save-flag 1)
;; 使用したブックマークを上に sort by Emacs テクニックバイブル
(progn
  (setq bookmark-sort-flag nil)
  (defun bookmark-arrange-latest-top ()
    (let ((latest (bookmark-get-bookmark bookmark)))
      (setq bookmark-alist (cons latest (delq latest bookmark-alist))))
    (bookmark-save))
  (add-hook 'bookmark-after-jump-hook 'bookmark-arrange-latest-top))

;; point-undo.el
;; 
(require 'point-undo)
(define-key global-map (kbd "<f7>") 'point-undo)
(define-key global-map (kbd "S-<f7>") 'point-redo)


;; bm.el
;; カーソル位置の複数ハイライト記憶, M-SPC で toggle
(setq-default bm-buffer-persistence nil)
(setq bm-restore-repository-on-load t)
(require 'bm)
(add-hook 'find-file-hooks 'bm-buffer-restore)
(add-hook 'kill-buffer-hook 'bm-buffer-save)
(add-hook 'after-save-hook 'bm-buffer-save)
(add-hook 'after-revert-hook 'bm-buffer-restore)
(add-hook 'vc-before-checkin-hook 'bm-buffer-save)
(global-set-key (kbd "M-SPC") 'bm-toggle)
(global-set-key (kbd "M-[") 'bm-previous)
(global-set-key (kbd "M-]") 'bm-next)
 

;; goto-chg.el
;; 最後の変更箇所へジャンプ
(require 'goto-chg)
(define-key global-map (kbd "<f8>") 'goto-last-changes)
(define-key global-map (kbd "S-<f8>") 'goto-last-changes-reverse)


;; tempbuf
(require 'tempbuf)
;; ファイルを開くと自動で有効化
(add-hook 'find-file-hooks 'turn-on-tempbuf-mode)
;; dired バッファに対しても有効
(add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)


;;;;; cua mode の導入, C-x r t RET -
(cua-mode t)
(setq cua-enable-cua-keys nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  言語別開発環境関連   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; pymacs 
;; (require 'pymacs)
;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)
;; (eval-after-load "pymacs"
;;     '(add-to-list 'pymacs-load-path "~/.emacs.d/elisp/pymacs-elisp"))

;;;;;;;  python-mode ;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/elpa/python-mode-6.2.3")
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.pyx\\'" . python-mode))
 (add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; (add-hook 'python-mode-hook
;;            (lambda ()
;;              (set (make-variable-buffer-local 'beginning-of-defun-function)
;;                   'py-beginning-of-def-or-class)
;;              (setq outline-regexp "def\\|class ")))

;; auto pep8
(require 'py-autopep8)
(setq py-autopep8-options '("--max-line-length=200"))
(setq flycheck-flake8-maximum-line-length 200)  ;; length cehck を200に
(py-autopep8-enable-on-save)

;;; useful commands
;; C-c C-c : buffer 内を実行
;; C-c !   : shell 立ち上げ

;; def new commands
; py-next-block
;; (defun py-next-block ()
;;    "go to the next block.  Cf. `forward-sexp' for lisp-mode"
;;    (interactive)
;;    (py-mark-block nil 't)
;;    (back-to-indentation))

;; ;; epc
;; (add-to-list 'load-path "~/.emacs.d/elpa/epc-20130122.2030/")
;; (require 'epc)


;;jedi
;; (require 'jedi)
;; (autoload 'jedi:setup "jedi" nil t)
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (add-hook 'python-mode-hook 'jedi:ac-setup)
;; (setq jedi:setup-keys t)
;; (setq jedi:complete-on-dot t)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; pycomplete
;; (add-hook 'python-mode-hook '(lambda ()
;;                                (require 'pycomplete)
;;                                ))

;; python info C-h s
;; (require 'info-look)
;; (info-lookup-add-help
;;  :mode 'python-mode
;;  :regexp "[[:alnum:]_]+"
;;  :doc-spec
;;  '(("(python)Index" nil "")))

;; pychecker 
;; C-c C-w (py-pychecker-run) で実行

;;; flymake for python
;; (add-hook 'find-file-hook 'flymake-find-file-hook)
;; (defun flymake-pyflakes-init ()
;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                      'flymake-create-temp-inplace))
;;          (local-file (file-relative-name
;;                       temp-file
;;                       (file-name-directory buffer-file-name))))
;;     (list "pycheckers"  (list local-file))))
;; (when (load "flymake" t)
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.py\\'" flymake-pyflakes-init)))
;; (load-library "flymake-cursor")
;; (global-set-key [f10] 'flymake-goto-prev-error)
;; (global-set-key [f11] 'flymake-goto-next-error)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; cider, clojure mode
;; (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; sql-mode
;; C-c C-b	sql-send-buffer	バッファの内容を SQLi バッファに送る
;; C-c C-r	sql-send-region	リージョンの内容を SQLi バッファに送る
;; C-c C-c	sql-send-paragraph	現在の行を SQLi バッファに送る

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Git egg 設定
(when (executable-find "git")
  (require 'egg nil t))
;; commands
;; C-x v s (egg-status)  s で state/unstage コミットは c C-c C-c でコミット完了
;; C-x v l (egg-log) ログビューア

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; YaTeX 
;; (add-to-list 'load-path "~/.emacs.d/elisp/yatex1.76")
;; (autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
;; (setq auto-mode-alist
;;       (append '(("\\.tex$" . yatex-mode)
;;                 ("\\.ltx$" . yatex-mode)
;;                 ("\\.cls$" . yatex-mode)
;;                 ("\\.sty$" . yatex-mode)
;;                 ("\\.clo$" . yatex-mode)
;;                 ("\\.bbl$" . yatex-mode)) auto-mode-alist))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; AUC-TEX
;;(add-to-list 'load-path "~/.emacs.d/elpa/auctex-11.86")
;;(load "auctex.el" nil t t)
;;(load "preview-latex.el" nil t t)
;; 基本設定
;; (setq TeX-default-mode 'japanese-latex-mode)
;; ;(setq exec-path (append exec-path '("/Applications/pTeX.app/teTeX/bin")))
;; (setq japanese-LaTeX-default-style "jsarticle")
;; (setq TeX-engine-alist '((ptex "pTeX" "eptex" "platex" "eptex")
;;                          (jtex "jTeX" "jtex" "jlatex" nil)
;;                          (uptex "upTeX" "euptex" "uplatex" "euptex")))
;; (setq TeX-engine 'ptex)
;; ;; viwer の設定
;; (setq TeX-view-program-list '(
;;                               ;;("pxdvi" "/usr/texbin/pxdvi -watchfile 1 %d")
;;                               ;;("PictPrinter" "/usr/bin/open -a PictPrinter.app %d")
;;                               ("Preview" "/usr/bin/open -a Preview.app %o")
;;                               ("TeXShop" "/usr/bin/open -a TeXShop.app %o")
;;                               ("TeXworks" "/usr/bin/open -a TeXworks.app %o")
;;                               ;;("Skim" "/usr/bin/open -a Skim.app %o")
;;                               ("displayline" "/Applications/Skim.app/Contents/SharedSupport/displayline %n %o \"%b\"")
;;                               ;;("MuPDF" "/usr/local/bin/mupdf %o")
;;                               ("AdobeReader" "/usr/bin/open -a \"Adobe Reader.app\" %o")))
;; (setq TeX-view-program-selection '((output-dvi "PictPrinter")
;;                                    (output-pdf "Preview")))

;; ;; 
;; (setq preview-image-type 'dvipng)
;; (setq TeX-source-correlate-method 'synctex)
;; (setq TeX-source-correlate-start-server t)
;; (add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
;; (add-hook 'LaTeX-mode-hook 'TeX-PDF-mode)
;; (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)


;; 禁則処理
(setq kinsoku-limit 10)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;  外部　ライブラリ ;;;;;;;;;;
;; w3m  only supports Emacs 23 or older 
;;(add-to-list 'load-path "~/.emacs.d/elisp/emacs-w3m-1.4.4")
;;(require 'w3m-load)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;    yatex ;;;;;;;;;;;;;;;
;;TEX設定
;;YaTeX の設定適用
;; (setq auto-mode-alist
;; (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
;; (autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
;; ;; ¥の代わりにバックスラッシュを入力する
;; (define-key global-map [?¥] [?\\])
;; ;; YaTeX のパスを通す(app 名は適宜変更)
;; (setq load-path (cons (expand-file-name
;; "/Applications/Emacs.app/Contents/Resources/site-lisp/yatex")
;; load-path))
;; ;; プレビュー(TeXShop の使用)
;; (setq tex-command
;; "~/Library/TeXShop/bin/platex2pdf-sjis" dvi2-command "open -a TexShop")


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; mew ;;;;;;;;;;;;;;
;; Mew を使う為の設定
;; (autoload 'mew "mew" nil t)
;; (autoload 'mew-send "mew" nil t)
;; ;; Optional setup (Read Mail menu for Emacs 21):
;; (if (boundp 'read-mail-command)
;;         (setq read-mail-command 'mew))
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(package-selected-packages
;;    (quote
;;     (auto-complete clojure-mode concurrent ctable dash deferred epc epl pkg-info popup melpa jedi cider))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(package-selected-packages
;;    (quote
;;     (auto-compile helm markdown-preview-mode markdown-mode sequential-command yapfify python-mode jedi))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(package-selected-packages
;;    (quote
;;     (py-autopep8 concurrent ctable deferred async auto-complete epc helm-core jedi-core markdown-mode packed uuidgen web-server websocket python-environment popup popup-complete yapfify sequential-command python-mode markdown-preview-mode jedi helm auto-compile))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
