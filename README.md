# Dev-Environment-Setup

一個自動化腳本集合，用於在 Windows 和 Linux 系統上快速設置開發環境的造型樣式。  
適合新開發者或需要快速重建環境的人使用。

---

## 快速開始

1. 克隆專案：
```
git clone https://github.com/koinu0808/Dev-Environment-Setup.git

cd Dev-Environment-Setup
```

2. 執行setup-dev-for-Linux.sh 或 執行setup-dev-for-Windows.ps1:  
- Linux
  ```
  chmod +x setup-dev-for-Linux.sh
  
  ./setup-dev-for-Linux.sh
  ```
  
- Windows   
  ```
  ./setup-dev-for-Linux.sh
  ```

**預設樣式是** `atumic` **如果需要更改樣式請上** `oh-my-posh.com` **尋找樣式**

## 更改樣式方式
- Linux
  ```
  vim ~/.bashrc
  ```
  將 `eval "$(oh-my-posh init bash --config ~/.poshthemes/<style>)"` 裡面 `<style>` 更改為自己喜歡的樣式，格式為 `<name>.omp.json`
  
- Windows  
  ```
  vim $PROFILE` or `notepade $PROFILE
  ```
  將 `oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\<style>"| Invoke-Expression` 裡面 `<style>` 更改為自己喜歡的樣式，格式為 `<name>.omp.json`
  
**Windows版本不包含Vim的開發環境的造型樣式**
