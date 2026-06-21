# cloud.md — 專案藍圖

> AI 每次開工請先讀這份檔案。收工時請更新「目前進度」與「下一步」。

---

## 專案概覽

| 項目 | 內容 |
|------|------|
| **專案名稱** | 2026 家族日本之旅行程網頁 |
| **一句話目標** | 手機/電腦免登入查看 9 天日本行程，改行程時跟 AI 對話更新資料檔 |
| **目標使用者** | 家族成員（出遊前後查行程） |
| **部署網址** | https://wakin12228-sket.github.io/japan-trip-2026/ |
| **GitHub** | https://github.com/wakin12228-sket/japan-trip-2026 |
| **最後更新** | 2026-06-20（收工）

---

## 一桌三櫃對應

| 元件 | 本專案路徑 / 連結 |
|------|-------------------|
| 一桌（工作目錄） | Google Drive 同步 → 本資料夾 |
| 第一櫃（GitHub） | https://github.com/wakin12228-sket/japan-trip-2026 |
| 第二櫃（Firebase） | v1 不用 Firestore；可選 Firebase Hosting |
| 第三櫃（Obsidian） | `obsidian/` 資料夾 |

---

## 技術棧

- **前端**：HTML + CSS + Vanilla JS（mobile-first 響應式）
- **資料**：`src/data/itinerary.json`（編輯用）；`docs/data/itinerary.json`（GitHub Pages 部署用，需同步）
- **部署**：GitHub Pages 選 **`/docs`** 資料夾（GitHub 不支援 `/src`）
- **驗證**：無 — 公開連結即可查看

---

## 行程資料原則

- **只匯入使用者提供的內容**，AI 不自行補行程或寫 placeholder 文案
- **日期**：2026/7/21 – 7/29（9 天）
- **已有內容**：Day 1–3（Word 全文）、Day 5 7/25 13:30 起（銀座段）
- **留空**：Day 4、Day 5 上午、Day 6–9（`items: []`）
- **來源檔**：`../7月日本行程.docx`（工作區根目錄）

---

## 資料結構（itinerary.json）

```
/meta          title, subtitle, startDate, endDate
/essentials    hotels[]
/days[]        day, date, weekday, title, hotel, items[]
  items[]      time, endTime, title, location, transport, duration, notes, mapQuery, section, image, introUrl
```

---

## 目前進度

- [x] 專案初始化（一桌三櫃懶人包已建立）
- [x] 建立 `src/data/itinerary.json`（Day 1–3、Day 5 下午）
- [x] 實作響應式行程頁 `src/index.html`
- [x] GitHub repo 建立並 push
- [x] 部署上線（GitHub Pages，`/docs` 資料夾）
- [x] 視覺升級：柔和風格 + 點擊展開相簿 + 左右滑動多圖
- [x] 布布/一二角色顯示於頁首
- [ ] 補齊 Day 4、Day 5 上午、Day 6–9 行程

**上次收工摘要：**
> 完成 v2 柔和 UI：景點可點擊展開下方相簿，多張可左右滑動；已串接使用者提供的 spots/characters 圖片。

---

## 下一步（最多 3 項）

1. 確認角色圖哪張是布布、哪張是一二（目前頁首預設配對）
2. 補 Day 4、Day 5 上午、Day 6–9 行程或圖片
3. push 後手機驗證相簿滑動

---

## 已知問題 / 不要改動

| 項目 | 說明 |
|------|------|
| 空白天數 | 不填假文案，保持 `items: []` |
| GitHub Pages 資料夾 | 只能選 `/(root)` 或 `/docs`，不能選 `/src` |
| 景點圖片目錄 | `docs/images/spots/`、`docs/images/characters/`（原誤拼 `iamges` 已更正） |
| 本地預覽 | 需 `cd docs && python3 -m http.server 8080`，直接開 HTML 無法 fetch JSON |

---

## 重要決策紀錄（摘要）

> 詳細內容見 `obsidian/架構決策.md`

- 2026-06-20：採用「一桌三櫃」工作流
- 2026-06-20：v1 不用 Firestore，靜態 JSON + 免登入
- 2026-06-20：缺漏行程留空，AI 不自行補內容

---

## 開工指令（複製貼給 AI）

```
請先讀取 cloud.md 和 obsidian/ 資料夾內的所有筆記，
掌握專案進度後接續工作。不要重複已完成的項目。
```

## 收工指令（複製貼給 AI）

```
收工：請更新 cloud.md 的「目前進度」與「下一步」，
同步更新 obsidian/進度.md、架構決策.md（若有新決策）、踩坑紀錄.md（若有踩坑），
然後 git add、commit（附清楚訊息），等我確認後 push。
```
