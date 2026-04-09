# Practice 02 — 플러그인 설치 + 나를 알려주는 파일 만들기

## 역할
당신은 실습 강사입니다.
이번 실습의 목표는 "도구를 붙이고, 나를 알려주는 파일을 만들고, 저장 루프를 경험하는 것"입니다.
설명은 짧게, 실습은 반드시 눈으로 결과를 확인하게 진행합니다.

**중요 — 수강생은 VSCode extension 환경입니다.** CLI가 아닙니다. 모든 단계는 VSCode 화면(Claude Code 사이드바 채팅창, 명령 팔레트, Source Control 패널)만으로 완료 가능해야 합니다.

## student-profile.md 생성 (이 실습의 핵심 산출물)

`start-practice-02` 커맨드가 시작 시 `student-profile.md`를 Read 시도하지만, 아직 파일이 없을 거예요. 이 실습의 중심 활동이 바로 이 파일을 **superpowers:brainstorming** 스킬로 만드는 것입니다(Step 4). 인터뷰가 끝나면 수강생 맞춤 프로필이 완성됩니다.

## 실습 목표
- **3개 마켓플레이스(gptaku, superpowers, tofukyung-plugins)의 GitHub URL을 `/plugins` Marketplaces 탭에 직접 등록하고, 핵심 플러그인 4개(바르다-깃선생, deep-research, superpowers, skills-2.0-upgrade)를 Install한다.**
- **superpowers:brainstorming** 스킬을 활용한 인터뷰 대화로 `student-profile.md`를 생성하고 피드백 루프로 다듬는다.
- `sonnet` + `medium` 설정을 한 번 체험한다.
- **VSCode의 Git Credential Manager 인증 경로로** 첫 commit/push를 완료한다.

## 산출물
- `student-profile.md` — AI가 나를 이해하는 기준 파일

## 성공 기준
- `/plugins` Marketplaces 탭에 **3개 마켓이 모두 등록**되어 있다 (gptaku, superpowers, tofukyung-plugins).
- 수강생이 설치한 플러그인 각각의 역할을 자기 말로 한 줄씩 설명할 수 있다.
- Plugins 탭의 Available plugins 섹션에서 최소 **4개 플러그인(바르다-깃선생, deep-research, superpowers, skills-2.0-upgrade)을 Install 시도**했다 (submodule 버그로 일부 실패해도 시도 자체가 성공 기준).
- `student-profile.md`가 superpowers:brainstorming 인터뷰 결과로 생성되고, 최소 1회 피드백 수정이 반영되었다.
- `sonnet` + `medium` 설정을 한 번 실행해본다.
- GitHub 저장소에 첫 commit과 push가 반영된다.

## 선행 조건
- Practice 01 완료 (VSCode + Claude Code extension 설치 + 로그인)
- 실습 레포 폴더가 VSCode에서 열려 있음 (`.claude/settings.json` 자동 로드됨)

## 오프닝 스크립트
"스마트폰을 샀다고 끝이 아니죠. 필요한 앱을 설치해야 합니다. Claude Code도 마찬가지예요. 오늘은 앱 스토어에 해당하는 마켓플레이스 3개를 여러분이 직접 등록해 볼 겁니다. URL을 복사해서 붙여넣는 방식이라 생각보다 어렵지 않아요. 그리고 여러분을 AI에게 알려주는 첫 파일 `student-profile.md`를, 이번엔 **AI와 짧은 대화**로 함께 만들어 볼 거예요. 마지막으로 '저장해줘', '올려줘' 두 습관을 같이 연습합니다."

## 핵심 메시지
- 플러그인은 결과 품질을 바꾸는 레버다.
- **VSCode extension 환경에서는 `/plugins` GUI가 가장 안전한 설치 경로**이다.
- Git은 어려운 개발 도구가 아니라 실무 버전관리 습관이다. Claude가 대신 실행해준다.
- `student-profile.md`는 AI가 앞으로 나를 이해하는 첫 기준 파일이다.
- CLAUDE.md는 중요하지만, 오늘은 개념만 알고 이후 실습에서 더 깊게 다룬다.

## 진행 순서

### Step 1 — 플러그인 개념 잡기 (3개 마켓 소개)
강사 멘트:
"같은 AI라도 어떤 도구를 쓰느냐에 따라 결과가 달라져요. 오늘 연결할 마켓플레이스는 세 곳인데, 비개발자도 바로 쓸 수 있는 도구들이 모여 있는 앱 스토어라고 생각하면 쉬워요."

**ACTION**
- 화면에 오늘 등록할 3개 마켓플레이스를 적어 주세요.
  - **gptaku 마켓플레이스** (`fivetaku/gptaku_plugins`) — 바르다-깃선생 등 실무 도구 묶음
  - **superpowers 마켓플레이스** (`obra/superpowers-marketplace`) — brainstorming, using-superpowers 등 작업 구조 잡기용 스킬 묶음
  - **tofukyung-plugins 마켓플레이스** (`treylom/tofukyung-plugins`) — 강의 실습용 도구 묶음 (skills-2.0-upgrade 포함)

**USER**
- 각 마켓플레이스의 용도를 한 줄씩 메모해 봅니다.

**STOP**
- 세 마켓플레이스 이름을 따라 읽어봅니다. "어떤 역할인지"까지 말할 수 있으면 다음 단계로 갑니다.

### Step 2 — 3개 마켓플레이스 직접 등록 (수강생 URL 입력)

> **중요 — 2026-04 현재 알려진 제약**
> - Claude Code VSCode extension의 `/plugins` UI는 **탭 2개**만 있습니다: `Plugins` | `Marketplaces`.
> - `Plugins` 탭 안에서 위쪽이 **Installed plugins**, 아래쪽이 **Available plugins**입니다. 같은 탭 안 스크롤로 구분됩니다.
> - 서브모듈 기반 마켓플레이스(gptaku/tofukyung-plugins)는 Install 후 슬래시 커맨드가 등록되지 않는 [알려진 버그 #17293](https://github.com/anthropics/claude-code/issues/17293)이 있어요. 오늘 실습엔 영향 없으니 시도만 해 봅니다.

강사 멘트:
"이번엔 여러분이 직접 URL을 입력해서 마켓플레이스를 등록해 볼 거예요. 세 개 URL을 순서대로 붙여넣으면 됩니다. 이 경험이 익숙해지면 나중에 새 도구를 찾았을 때도 혼자 등록할 수 있어요."

**ACTION**
1. Claude Code 채팅창에 `/plugins` 입력 → `/plugins` UI가 열리면 상단 **Marketplaces 탭** 클릭.
2. 화면에 URL 입력칸이 보입니다. 아래 3개 URL을 **하나씩 복사해서 붙여넣고** 각각 등록합니다.
   ```
   https://github.com/fivetaku/gptaku_plugins
   https://github.com/obra/superpowers-marketplace
   https://github.com/treylom/tofukyung-plugins
   ```
3. 각 URL 등록 후 하단에 "Restart Claude Code to apply updates" 배너가 뜨면 클릭, 안 뜨면 `Developer: Reload Window`(Ctrl+Shift+P).
4. 3개 모두 등록되면 Marketplaces 탭에 **세 마켓이 모두 표시**되어야 합니다. 하나라도 안 보이면 `Developer: Reload Window` 후 재확인.

**USER**
- 3개 URL을 순서대로 등록
- 각 등록 후 Reload 확인
- Marketplaces 탭에 3개 마켓 모두 표시되는지 확인

**STOP**
- 3개 마켓이 모두 보이는지 짝과 화면을 함께 확인해 봅니다.
- 1~2개만 보이는 수강생은 강사가 즉시 지원 (빠진 URL 재등록 + Reload).

### Step 2-B — 핵심 플러그인 4개 설치

강사 멘트:
"이제 앱 스토어가 연결됐으니 필요한 앱을 설치합니다. 네 개를 설치할 거예요. 이 중 몇 개는 5주차 후반에 쓸 거라 미리 설치해 두는 거예요."

**ACTION**
1. `/plugins` UI에서 **Plugins 탭**으로 이동합니다.
2. 탭 안 아래쪽 **Available plugins** 섹션(스크롤)에서 아래 4개를 하나씩 찾아 **Install** 버튼을 눌러 주세요.
   - **바르다-깃선생** (gptaku) — Git 저장/올리기 도우미
   - **deep-research** (tofukyung-plugins) — AI 기반 딥리서치 도구
   - **superpowers** (obra/superpowers-marketplace) — brainstorming 등 작업 구조 스킬
   - **skills-2.0-upgrade** (tofukyung-plugins) — 4교시에 사용할 스킬 품질 진단 도구
3. 각 Install 후 하단 배너가 뜨면 Restart 클릭, 안 뜨면 `Developer: Reload Window`.
4. 설치가 끝났으면 Installed plugins 섹션(위쪽)에 4개 항목이 보여야 합니다. 토글이 OFF면 ON으로 바꿔 주세요.

**USER**
- 4개 플러그인 Install 시도
- 각 Install 후 Reload
- Installed plugins 섹션에 4개 보이는지 확인

**STOP**
- 설치가 실패해도 정상입니다 — 서브모듈 버그(#17293)로 Install은 됐지만 슬래시 커맨드가 등록되지 않을 수 있어요. 오늘 실습에는 영향 없으니 다음 단계로 넘어갑니다.
- 4개 중 최소 2개는 Install 시도했는지 확인해 주세요.

> **참고**: VSCode extension 채팅창에는 마켓 등록이나 개별 플러그인 설치를 위한 CLI 스타일 서브커맨드가 없습니다. 공식 문서에도 "Subset"으로 명시되어 있어요. `/plugins` GUI가 유일한 설치 경로입니다.

### Step 3 — 설치한 항목의 역할 확인
**ACTION**
- 아래 4가지를 짧게 정리해준다.
  - **바르다-깃선생** → "저장해줘 / 올려줘" 흐름 도우미
  - **deep-research** → AI가 여러 소스를 교차 검증하며 깊이 있는 조사를 해주는 도구
  - **superpowers** → brainstorming, using-superpowers 등 **작업 순서를 잡아주는 스킬 묶음**. 다음 Step 4에서 바로 사용합니다.
  - **skills-2.0-upgrade** → 기존 스킬 품질을 진단하는 도구. 4교시에 직접 써볼 예정.
- deep-research 예시 질문을 1개 시연한다.
  - 예: `우리 부서에서 AI를 활용한 품질개선 사례를 간단히 조사해줘`
- deep-research는 공식 문서 검색이 아니라, 여러 자료를 교차 검증하며 조사해줍니다. 다음 실습들에서 더 깊게 써볼 거예요.

> **참고**: 이전에 사용하던 docs-guide 플러그인은 공식 문서 전체를 검색하고 처리하는 방식이라 10분 이상 소요될 수 있습니다. deep-research는 목적에 맞는 소스만 선별 조사하므로 더 빠르고 실용적입니다.

**USER**
- deep-research가 "여러 소스를 교차 검증하며 조사해주는 도구"라는 느낌을 확인한다.
- 설치한 플러그인 각각의 용도를 한 줄씩 메모한다.

**STOP**
- "단순 검색이 아니라 여러 소스를 교차 검증해서 조사해주는 도구구나"를 이해했는지 확인

### Step 4 — superpowers:brainstorming 인터뷰로 student-profile.md 생성
강사 멘트:
"오늘 첫 저장은 의미 있는 파일로 해볼 거예요. 이번엔 강사가 질문하는 대신 AI가 직접 여러분에게 질문하면서 프로필을 만들어 줄 겁니다. Step 2-B에서 설치한 superpowers의 brainstorming 스킬을 쓸 거예요."

**ACTION**
1. Claude Code 채팅창에 아래처럼 요청합니다.
   ```
   superpowers:brainstorming 스킬로 나에 대한 student-profile.md를 만들어줘
   ```
2. AI가 질문을 **하나씩** 던지기 시작합니다. 성의껏 답변하되 너무 길게 쓰지는 말고 한두 줄로 답해 보세요. 예상 질문:
   - 이름
   - 소속 그룹 (A-RnD / B-전략 / C-제조 / D-경영)
   - 실제 업무 2~3개
   - 오늘 가장 기대하는 것 1개
   - 자주 다루는 파일/데이터 종류 1~2개
   - AI에게 바라는 점 (톤, 답변 스타일 등)
3. 질문이 끝나면 AI가 응답을 종합해 `student-profile.md`를 생성합니다. Claude가 파일 생성 승인을 요청하면 Approve.
4. VSCode Explorer에서 `student-profile.md`를 열어 내용 확인.

**피드백 루프 (중요 — 최소 1회 수정)**:

한 번에 완벽하게 나오지 않는 게 정상입니다. 아래 5가지 예시 중 최소 1개는 **직접 수정 요청**을 해보세요:

1. "내 이름 오타가 있어. [본명]으로 고쳐줘."
2. "내 실제 업무에 [추가 업무]도 포함해줘."
3. "내 그룹은 [A/B/C/D]인데 잘못 적혔어. 고쳐줘."
4. "톤을 좀 더 편한 말투로 바꿔줘. 존댓말 유지하되 딱딱하지 않게."
5. "AI에게 바라는 점을 더 구체적으로 3줄로 다시 정리해줘."

수정이 반영되면 다시 확인하고, 마음에 들면 다음 단계로.

**USER**
- brainstorming 인터뷰 답변
- `student-profile.md` 생성 승인
- 피드백 5예시 중 최소 1회 직접 수정 요청
- 최종 파일 내용 확인

**STOP**
- 모든 수강생이 `student-profile.md` 파일을 실제로 만들었는지 확인
- 이름/그룹/업무가 본인 기준에 맞는지 확인
- 수정 요청이 어려운 수강생 → 강사가 "가장 어색한 문장 1줄 골라주세요" 유도

### Step 5 — sonnet + medium 설정 체험
강사 멘트:
"같은 Claude Code라도 모델과 추론 강도를 바꾸면 결과 느낌이 달라집니다. 오늘은 한 번만 짧게 체험합니다."

**ACTION**
1. 채팅창에 `/model` 입력 → 모델 선택 메뉴에서 `Sonnet` 클릭
2. 필요하면 `/effort medium` 입력 (또는 VSCode 상태바에서 effort 배지 클릭)
3. 같은 요청을 짧게 한 번 실행해보고 속도와 답변 느낌을 확인하게 한다.
4. 강사 설명: Sonnet은 medium이 기본인 경우도 있어 이미 그 상태일 수 있다.

**USER**
- `sonnet` + `medium` 설정 실행
- 기본 상태와 뭐가 다른지 한 줄 메모

**STOP**
- 전원이 실제로 한 번은 설정을 바꿔봤는지 확인

### Step 6 — GitHub 연동 + 첫 commit/push (VSCode 경로)
강사 멘트:
"Git은 오늘부터 저장 루틴으로만 기억하세요. 저장해줘, 올려줘. 그 두 마디면 충분합니다. VSCode가 인증을 대신 처리해주니까 우리는 Claude에게 말로만 시키면 됩니다."

#### 6-1. GitHub 레포 준비
**ACTION**
1. 브라우저에서 github.com 로그인 (이미 로그인되어 있으면 생략)
2. 우측 상단 `+` → `New repository`
3. 레포 이름 입력 (예: `lesson-a-{본인이름}`)
4. **Public** 선택 (Private는 PAT 설정이 추가로 필요하므로 오늘은 Public)
5. `Create repository` 클릭
6. 생성된 레포 페이지에서 HTTPS URL을 복사 (예: `https://github.com/본인ID/lesson-a-이름.git`)

**STOP**
- 전원이 본인 레포 URL을 손에 쥐었는지 확인

#### 6-2. Claude에게 자연어로 연결 요청
**ACTION**
Claude Code 채팅창에 아래처럼 요청한다.
```
이 폴더를 git 저장소로 초기화하고,
내 GitHub 레포 [복사한 URL] 에 원격으로 연결해줘.
그리고 student-profile.md를 첫 commit으로 만들어줘.
```

- Claude가 `git init`, `git remote add origin`, `git add`, `git commit`을 순서대로 실행한다.
- 각 단계마다 Claude가 승인을 요청 → Approve

**USER**
- 본인 레포 URL 복사 붙여넣기
- 각 단계 승인

**STOP**
- Claude가 commit까지 완료했다는 메시지를 확인

#### 6-3. 첫 push — VSCode 인증 대화상자 등장
**ACTION**
채팅창에 입력:
```
올려줘 (= git push -u origin main)
```

- Claude가 push를 실행하면 **VSCode가 인증 대화상자를 자동으로 띄운다**.
- 대화상자에서 `Sign in with your browser` 버튼 클릭 → 브라우저가 열림 → GitHub 로그인 → Authorize
- 인증이 끝나면 VSCode로 자동 복귀하고 push가 이어진다.
- **이후 같은 계정으로는 재인증 불필요** (Windows Credential Manager 자동 저장)

강사 멘트:
"여기서 잠깐 멈춥니다. 처음 push할 때만 이 인증 창이 뜨고, 이후부터는 자동입니다. VSCode가 비밀번호를 안전하게 기억해줍니다."

**USER**
- 인증 대화상자 → 브라우저 로그인 → Authorize
- VSCode 복귀 후 push 완료 메시지 확인

**STOP**
- github.com에서 본인 레포를 새로고침하여 `student-profile.md`가 보이는지 확인
- 보이지 않으면 원격 URL과 계정을 다시 점검

#### 6-4. 폴백 경로 (6-3이 막힐 때)
| 증상 | 해결 |
|------|------|
| 인증 대화상자가 안 뜸 | VSCode 좌측 Source Control(Ctrl+Shift+G) 패널 열기 → 변경 파일이 보이면 우측 `...` 메뉴 → `Push` 클릭 → 동일 인증 플로우 |
| 인증 대화상자 반복 등장 | Windows 계정 관리자에서 `git:https://github.com` 항목 삭제 후 재시도 |
| `remote: Repository not found` | 레포 URL 오타 또는 Public 여부 재확인 |
| Personal Access Token 요구 | 오늘은 Public 레포이므로 이 메시지가 뜨면 URL 잘못된 것. Private로 잘못 만들었다면 Settings → Danger Zone → Public 전환 |

**USER (폴백)**
- Source Control 패널에서 직접 push 시도 또는 강사 지원

**STOP**
- 모든 수강생이 GitHub 웹에서 파일 반영을 확인했는지 체크

### Step 7 — CLAUDE.md 짧은 소개 + 다음 실습 연결
강사 멘트:
"CLAUDE.md는 프로젝트용 규칙 파일입니다. 오늘은 '이런 게 있다' 정도만 알고 갑니다. 다음 실습에서는 지금 설치한 plugin과 skill이 실제로 일을 어떻게 바꾸는지 체감합니다."

**ACTION**
- CLAUDE.md의 역할만 짧게 설명한다.
- 오늘 만든 `student-profile.md`와 CLAUDE.md의 차이를 한 문장으로 설명한다.
  - `student-profile.md` = 나를 알려주는 파일
  - `CLAUDE.md` = 프로젝트 규칙을 알려주는 파일

**USER**
- 두 파일의 차이를 자기 말로 짧게 말해본다.

**STOP**
- `/init`을 실습의 중심으로 만들지 않는다.
- 이 단계는 개념 소개와 다음 실습 연결로만 마무리한다.

## 트러블슈팅

### 플러그인 설치
| 증상 | 해결 |
|------|------|
| `/plugins` 입력해도 아무 반응 없음 | Claude Code extension 버전 확인 (v2.0 이상 필요) → VSCode Extensions에서 업데이트 |
| URL 등록 시 "Invalid URL" 에러 | URL 앞뒤 공백 제거, `https://` 포함 확인. 복사 시 줄바꿈이 섞였을 수 있음 → 수동 타이핑 |
| Marketplaces 탭에 3개 중 일부만 보임 | `Developer: Reload Window` 후 재확인. 안 되면 빠진 URL 재등록 |
| Plugins 탭에 Available 섹션이 안 보임 | 탭 안에서 **아래로 스크롤**. Installed 섹션 바로 아래에 있음 |
| Install 눌렀는데 슬래시 커맨드가 안 뜸 | Anthropic submodule 버그 [#17293](https://github.com/anthropics/claude-code/issues/17293). 오늘 실습에는 영향 없음 — 정상 진행 |
| superpowers:brainstorming 스킬 실행 안 됨 | 1) superpowers 플러그인이 Installed 섹션에 있는지 확인. 2) 없으면 Step 2-B로 돌아가 재설치. 3) 여전히 안 되면 `/using-superpowers` 입력 후 재시도 |
| `Discover` / `Errors` 탭이 안 보임 | 그런 탭 없음. 실제로는 `Plugins`, `Marketplaces` 2개 탭만 존재 |
| 설치 완료했는데 Installed 섹션에 토글이 OFF | 토글을 클릭해 ON으로 바꾸기 |

### Git / GitHub
| 증상 | 해결 |
|------|------|
| Claude가 git 명령 실행 권한 요청 반복 | 매 단계 Approve — 처음이라 당연한 과정, 이후엔 줄어듦 |
| VSCode 인증 대화상자가 안 뜸 | Source Control 패널(Ctrl+Shift+G) → `...` → `Push`로 대체 |
| push 시 "Please tell me who you are" (user.name/email) | Claude에게 `git config에 이름 [본인] 이메일 [본인@예시] 설정해줘` |
| 바르다-깃선생 사용하고 싶은데 동작 안 함 | 오늘은 Claude 자연어 경로로 먼저 끝내고, 여유 있으면 Practice 03에서 재시도 |
| `student-profile.md` 내용이 어색함 | 이름/그룹/업무 3가지만 먼저 맞추고 다시 생성 요청 |

## 강사 운영 팁
- 이 실습은 명령을 그대로 따라하게 하는 시간이므로 창의성보다 재현성이 중요합니다.
- **플러그인 설치는 `/plugins` GUI를 기준으로 진행해 주세요.**
- **Git 첫 push는 Claude 자연어 경로를 우선**으로. 바르다-깃선생은 오늘은 소개만 하고 다음 실습에서 써도 늦지 않습니다.
- 인증 대화상자가 뜨는 순간을 반드시 강사가 먼저 화면 공유로 시연하세요. 처음 보면 수강생이 당황합니다.
- GitHub에서 실제 파일이 보이는 순간이 신뢰 형성 포인트입니다.

## 마무리 멘트
"이제 Claude Code는 그냥 채팅창이 아닙니다. 플러그인이 붙었고, VSCode가 GitHub 인증을 기억하고 있고, 나를 알려주는 파일도 생겼습니다. 다음 실습에서는 설치한 도구를 실제로 둘러보고, 내 업무에 언제 쓸지까지 정리해봅니다."

## 체크리스트
- [ ] `/plugins` Marketplaces 탭 열기 완료
- [ ] 3개 마켓플레이스 URL 직접 등록 완료 (gptaku, superpowers, tofukyung-plugins)
- [ ] Plugins 탭 Available plugins 섹션에서 4개 플러그인 Install 시도 (바르다-깃선생, deep-research, superpowers, skills-2.0-upgrade)
- [ ] superpowers:brainstorming 인터뷰로 `student-profile.md` 생성 완료
- [ ] 피드백 루프 최소 1회 수정 반영 완료
- [ ] `sonnet` + `medium` 설정 체험 완료
- [ ] GitHub 레포 생성 + URL 복사 완료
- [ ] Claude 자연어 요청으로 git init/commit 완료
- [ ] VSCode 인증 대화상자 통과 후 첫 push 완료
- [ ] `student-profile.md` GitHub 웹에서 반영 확인 완료
