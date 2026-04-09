---
name: lesson-a
description: Use when /lesson 커맨드로 MW4 또는 MW5 교시별 인터랙티브 강의를 진행해야 할 때
version: "2.1.0"
author: tofukyung
disable-model-invocation: true
allowed-tools: Read, Write, Bash, Glob, Grep, AskUserQuestion
---

# lesson-a

`/lesson` 커맨드로 교시별 수업을 시작하는 엔트리포인트 스킬.
모든 참조 파일은 이 스킬의 `references/` 안에 내장되어 있어 별도 프로젝트 clone 없이 동작합니다.

## 실행 순서
1. `references/course-structure.json` 읽기
2. `references/lesson-modules/{실습폴더}/CLAUDE.md` 읽기 (실습별 스크립트)
3. 필요 시 회사 자료 추가 로드
4. 즉시 수업 시작 — 학생 이름부터 묻기

## 진행 원칙
- 네 번째 벽 깨지 않기
- 감자재배법: 직접 해주지 않고 가이드
- 학생이 직접 실행하게 안내
- 매 교시 끝: "저장해줘" → "올려줘"로 마무리

## references/ 내장 구조

### 핵심 참조
- `references/course-structure.json` — 코스 구조 (그룹, 세션 목록)
- `references/SCRIPT_INSTRUCTIONS.md` — 레슨 진행 규칙 (STOP/ACTION/USER 마커)
- `references/company-context.md` — 회사 배경, 수강생 환경, 실무 맥락

### 주차별 상세
- `references/MW4.md` — MW4 4교시 상세 참고 자료
- `references/MW5.md` — MW5 4교시 상세 참고 자료
- `references/MW5-session4.md` — MW5 4교시 추가 참고

### 실습별 스크립트
- `references/lesson-modules/practice-01-install-and-connect/CLAUDE.md`
- `references/lesson-modules/practice-02-first-profile/CLAUDE.md`
- `references/lesson-modules/practice-03-plugin-literacy/CLAUDE.md`
- `references/lesson-modules/practice-04-dept-analysis/CLAUDE.md`
- `references/lesson-modules/practice-05-refine-and-share/CLAUDE.md`
- `references/lesson-modules/practice-06-claudemd-rules/CLAUDE.md`
- `references/lesson-modules/practice-07-workflow-and-prompt/CLAUDE.md`
- `references/lesson-modules/practice-08-integrated-pipeline/CLAUDE.md`
- `references/lesson-modules/practice-09-harness-and-skill/CLAUDE.md`
- `references/lesson-modules/practice-SPARE-vercel-deploy/CLAUDE.md`

### 회사 컨텍스트
- `references/company-context/DEPARTMENTS.md` — 4그룹 부서별 안내
- `references/company-context/SCENARIO.md` — AI 전환 미션 개요
- `references/company-context/TOOL-GUIDE.md` — Claude Code 사용 가이드

### 템플릿
- `references/templates/analysis-template.md` — 분석 결과 템플릿
- `references/templates/claudemd-template.md` — CLAUDE.md 작성 템플릿
- `references/templates/presentation-template.md` — 발표 템플릿

## 실습 매핑

| 입력 | 스크립트 |
|------|---------|
| practice-01 / 설치와 연결 | `references/lesson-modules/practice-01-install-and-connect/CLAUDE.md` |
| practice-02 / 플러그인+프로필 | `references/lesson-modules/practice-02-first-profile/CLAUDE.md` |
| practice-03 / 도구 탐색 | `references/lesson-modules/practice-03-plugin-literacy/CLAUDE.md` |
| practice-04 / 부서별 데이터 분석 | `references/lesson-modules/practice-04-dept-analysis/CLAUDE.md` |
| practice-05 / 결과 다듬기+저장 | `references/lesson-modules/practice-05-refine-and-share/CLAUDE.md` |
| practice-06 / CLAUDE.md 규칙 설계 | `references/lesson-modules/practice-06-claudemd-rules/CLAUDE.md` |
| practice-07 / 구조가 결과를 바꾼다 | `references/lesson-modules/practice-07-workflow-and-prompt/CLAUDE.md` |
| practice-08 / 통합 파이프라인 | `references/lesson-modules/practice-08-integrated-pipeline/CLAUDE.md` |
| practice-09 / 하네스+스킬+MW6 예고 | `references/lesson-modules/practice-09-harness-and-skill/CLAUDE.md` |
| practice-SPARE / Vercel 배포 | `references/lesson-modules/practice-SPARE-vercel-deploy/CLAUDE.md` |

## 빠른 사용 흐름
- `/start-practice-01` ~ `/start-practice-09`
- `/start-practice-SPARE` (시간 여유 시)

## 참조 로드 규칙
- 공통 회사 맥락: `references/company-context.md`
- 부서별 상세: `references/company-context/DEPARTMENTS.md`
