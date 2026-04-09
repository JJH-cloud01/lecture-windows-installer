// ─────────────────────────────────────────────
//  Color palette
// ─────────────────────────────────────────────
#let black  = rgb("#1a1a1a")
#let blue   = rgb("#1a4f8a")
#let blue-light = rgb("#dce8f7")
#let gray   = rgb("#f5f5f5")
#let warn   = rgb("#d04040")

// ─────────────────────────────────────────────
//  Page & document setup
// ─────────────────────────────────────────────
#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2.5cm, right: 2.5cm),
)

#set text(font: "Malgun Gothic", size: 10pt, fill: black)
#set par(leading: 0.8em)

// ─────────────────────────────────────────────
//  Heading styles
// ─────────────────────────────────────────────
#show heading.where(level: 1): it => {
  block(
    fill: blue,
    inset: (x: 12pt, y: 8pt),
    radius: 3pt,
    width: 100%,
  )[
    #text(fill: white, weight: "bold", size: 14pt)[#it.body]
  ]
  v(0.6em)
}

#show heading.where(level: 2): it => {
  v(0.5em)
  block[
    #text(fill: blue, weight: "bold", size: 11pt)[#it.body]
    #line(length: 100%, stroke: 0.5pt + blue)
  ]
  v(0.3em)
}

// ─────────────────────────────────────────────
//  Cover block
// ─────────────────────────────────────────────
#block(
  fill: blue,
  width: 100%,
  inset: (x: 20pt, y: 24pt),
  radius: 6pt,
)[
  #text(fill: white, size: 18pt, weight: "bold")[2026년 Q2 예산 vs 실적 비교 분석]
  #v(0.3em)
  #text(fill: rgb("#c8ddf5"), size: 10pt)[경영그룹 | 2026-04-09 | Practice 04]
]

#v(1.2em)

// ─────────────────────────────────────────────
//  1. 결론 (핵심 먼저)
// ─────────────────────────────────────────────
= 결론 (핵심 먼저)

#block(
  fill: blue-light,
  inset: (x: 14pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold")[전체 초과 집행.] 대부분 항목이 예산 대비 100~107% 수준으로 초과했으며,
  특히 #text(fill: blue, weight: "bold")[수출운송(106.2%)], #text(fill: blue, weight: "bold")[IT 클라우드(107.3%)],
  #text(fill: blue, weight: "bold")[연구개발 CAE(105.7%)] 가 주요 초과 항목.
  설비투자(프레스라인개선)만 #text(fill: warn, weight: "bold")[95.0%]로 미달.
]

#v(0.8em)

// ─────────────────────────────────────────────
//  2. 항목별 달성률 비교표
// ─────────────────────────────────────────────
== 항목별 달성률 비교표

#let rows = (
  ("인건비", "정규직",       "840",   "846",  "100.7%", "정상",  false),
  ("인건비", "계약직",       "130",   "132",  "101.5%", "정상",  false),
  ("원자재", "강판",         "1,645", "1,679","102.1%", "주의",  false),
  ("원자재", "알루미늄",     "564",   "581",  "103.0%", "주의",  false),
  ("외주비", "금형수리",     "88",    "92",   "104.5%", "주의",  false),
  ("설비투자","프레스라인개선","80",   "76",   "95.0%",  "⚠ 미달", true),
  ("설비투자","검사장비",     "55",    "58",   "105.5%", "주의",  false),
  ("물류비", "내수운송",     "74",    "75",   "101.4%", "정상",  false),
  ("물류비", "수출운송",     "161",   "171",  "106.2%", "⚠ 초과", true),
  ("연구개발","CAE해석",     "88",    "93",   "105.7%", "⚠ 초과", true),
  ("연구개발","시제품제작",   "62",    "65",   "104.8%", "주의",  false),
  ("IT",    "소프트웨어구독","29",    "29",   "100.0%", "정상",  false),
  ("IT",    "클라우드인프라","41",    "44",   "107.3%", "⚠ 초과", true),
  ("교육",  "직무교육",     "28",    "27",   "96.4%",  "정상",  false),
)

#table(
  columns: (1fr, 1.4fr, 1fr, 1fr, 1fr, 0.8fr),
  fill: (x, y) => {
    if y == 0 { blue }
    else if y == rows.len() { none }
    else if calc.rem(y, 2) == 0 { gray }
    else { white }
  },
  stroke: 0.4pt + rgb("#cccccc"),
  inset: (x: 8pt, y: 6pt),

  // Header
  text(fill: white, weight: "bold")[대분류],
  text(fill: white, weight: "bold")[세부항목],
  text(fill: white, weight: "bold")[예산(백만원)],
  text(fill: white, weight: "bold")[실적(백만원)],
  text(fill: white, weight: "bold")[달성률],
  text(fill: white, weight: "bold")[판정],

  ..rows.map(row => {
    let (cat, item, budget, actual, rate, status, highlight) = row
    let color = if highlight { warn } else { black }
    (
      text(fill: color)[#cat],
      text(fill: color)[#item],
      align(right)[#text(fill: color)[#budget]],
      align(right)[#text(fill: color)[#actual]],
      align(center)[#text(fill: color, weight: if highlight { "bold" } else { "regular" })[#rate]],
      align(center)[#text(fill: color, weight: if highlight { "bold" } else { "regular" })[#status]],
    )
  }).flatten()
)

#v(0.8em)

// ─────────────────────────────────────────────
//  3. 차이 원인 분석
// ─────────────────────────────────────────────
== 차이 원인 분석

#table(
  columns: (1.2fr, 2.8fr),
  fill: (x, y) => if y == 0 { blue } else if calc.rem(y, 2) == 0 { gray } else { white },
  stroke: 0.4pt + rgb("#cccccc"),
  inset: (x: 8pt, y: 6pt),

  text(fill: white, weight: "bold")[항목],
  text(fill: white, weight: "bold")[차이 원인 가설],

  text(fill: warn, weight: "bold")[수출운송 초과 (+6.2%)],  [수출 물량 증가 또는 유류비·운임 상승],
  text(fill: warn, weight: "bold")[IT 클라우드 초과 (+7.3%)],[사용량 증가 (데이터/AI 도입 확대 가능성)],
  text(fill: warn, weight: "bold")[CAE해석 초과 (+5.7%)],   [해석 건수 증가 또는 외주 단가 상승],
  [원자재 초과 (+2~3%)],                                    [강판·알루미늄 원자재 단가 상승],
  text(fill: warn, weight: "bold")[프레스라인개선 미달 (-5%)],[발주 지연 또는 공사 일정 조정],
)

#v(0.8em)

// ─────────────────────────────────────────────
//  4. 개선 제안
// ─────────────────────────────────────────────
== 개선 제안

#for (i, item) in (
  ("수출운송", "운임 계약 조건 재검토 (분기별 상한선 설정)"),
  ("클라우드", "실사용량 모니터링 체계 도입"),
  ("프레스라인", "잔여 예산 집행 일정 확인 필요"),
).enumerate() {
  block(
    fill: if calc.rem(i, 2) == 0 { blue-light } else { gray },
    inset: (x: 12pt, y: 8pt),
    radius: 3pt,
    width: 100%,
    below: 6pt,
  )[
    #text(fill: blue, weight: "bold")[#str(i + 1). #item.at(0)]
    #h(1em)
    #item.at(1)
  ]
}
