---
name: budget-weekly-check
description: Use when new budget execution data arrives — calculates consumption rate, flags anomalies, and generates a weekly management memo.
trigger: "새 예산 집행 내역", "예산 점검", "주간 경영 메모", "budget check"
input: 예산 CSV 파일 + 실적 CSV 파일
output: 주간 경영 메모 (표 형태, 결론 먼저, 천원/백만원 단위)
version: 1.0.0
author: 조재화 (D그룹 경영)
---

# budget-weekly-check — D그룹 주간 예산 점검 루프

## Use when
새 예산 집행 내역이 들어왔을 때 예산 소진율을 계산하고, 이상 항목을 표시하고, 주간 경영 메모를 작성해야 할 때 사용한다.

## Steps

1. **데이터 도착 확인** — `@budget_2026.csv` + 최신 실적 CSV 파일을 지정한다
2. **병합 및 달성률 계산** — 항목별 예산 대비 실적, 달성률(%) 계산
3. **이상 항목 표시** — 달성률 110% 초과 또는 80% 미만 항목을 플래그
4. **주간 경영 메모 작성** — 결론 먼저, 표 형태, 단위 명시, 원인 가설 포함
5. **저장** — 결과를 `weekly-memo-{날짜}.md`로 저장

## Constraints

- 결론을 먼저 제시하고 상세 내용은 그 다음
- 수치는 천원 또는 백만원 단위를 명시
- 비용 절감 권고는 가설로 표기 (확정안 금지)
- 근거 없는 수치 추정 금지
- 답변은 한국어로 작성

## Example

```
@.claude/practice-data/D-경영/budget_2026.csv 와
@.claude/practice-data/D-경영/actual_Q2_2026.csv 를
budget-weekly-check 루프로 점검하고
weekly-memo-20260409.md 로 저장해줘
```

## Test

- [ ] 달성률 계산이 원본 데이터와 일치하는가?
- [ ] 이상 항목(110% 초과/80% 미달)이 표시되는가?
- [ ] 결론이 먼저 나오는가?
- [ ] 단위(천원/백만원)가 명시되었는가?
- [ ] 파일이 저장되었는가?
