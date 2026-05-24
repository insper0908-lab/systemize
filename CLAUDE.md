# systemize — 체계 국어 작업 레퍼런스 레포

이 레포는 **체계 국어** (수능 비문학·문학 해설지) 작업을 위한 Claude Code 세션 데이터 + 샘플 자료 저장소다.
사용자가 해설/구문해설지 작업을 요청하면 Claude는 이 레포의 **샘플 폴더**와 **메모리**를 먼저 참고한 뒤 작업한다.

---

## 폴더 구조 (사용자가 점진적으로 채움)

```
systemize/
├── CLAUDE.md                  ← 이 파일
├── memory/                    ← Claude 자동 메모리 (워크플로·독해 원칙·형식 규칙)
├── samples/                   ← 카테고리별 샘플 (사용자 업로드)
│   ├── 독서/
│   │   ├── 인문/
│   │   ├── 사회/
│   │   ├── 과학기술/
│   │   └── 예술/
│   └── 문학/
│       ├── 고전시가/
│       ├── 고전소설/
│       ├── 현대시/
│       ├── 현대소설/
│       └── 수필극/
└── (세션 jsonl 로그 — 자동 push)
```

> 폴더는 사용자가 자료 올리는 시점에 생긴다. 없는 카테고리는 사용자에게 물어보거나 가장 가까운 인접 카테고리 샘플을 참고.

---

## 작업 시 표준 절차

### A. 해설 작업 ("해설 만들어줘")
1. **지문 카테고리 판별** (독서/문학 → 세부 분류)
2. `samples/[카테고리]/[세부]/` 폴더에서 같은 분류의 HWPX/PDF 샘플 1~2개 열어 톤·구조·해설 깊이 파악
3. `memory/feedback_haesul_*.md` 워크플로 규칙 확인
4. 문제 있으면 **정답 번호 먼저 묻기** → 풀이 → HWPX 생성
5. 출력: `/Users/a0000/Downloads/output_haesul/해설_[지문제목].hwpx`

### B. 구문해설지 ("구문해설지 만들어줘")
1. `memory/feedback_gumun_haeseolji.md` 형식 규칙 확인
2. 간결형 / 구조화형 자동 판별 후 작성

---

## 독해 철학 (모든 해설 작업 공통)

1. **제재 이해 X, "그렇구나" 태도** — 텍스트 안의 국어 장치만 추적
2. 지시어/접속사/어미 같은 **국어적 장치에 집중** (제재 X)
3. **즉 = 등호** / 그룹 묶기 / 지시어 원지시 풀어쓰기
4. **지문 밖 어휘 절대 금지** — 기의 변환도 지문 어휘만
5. 마스터 개념 추적 (예: 닉슨쇼크 = "NOT 적자" / 경마식보도 = "공정성")

상세 → `memory/feedback_korean_reading_principles.md`

---

## 우선 참조 메모리

| 주제 | 파일 |
|---|---|
| 독해 철학 | `memory/feedback_korean_reading_principles.md` |
| HWPX 워크플로 | `memory/feedback_haesul_format_workflow.md` |
| Production 출력 패턴 | `memory/feedback_haesul_production_pattern.md` |
| 구문해설지 형식 | `memory/feedback_gumun_haeseolji.md` |
| 메모리 인덱스 | `memory/MEMORY.md` |

---

## HWPX 생성 주의 사항

- `linesegarray` 제거 + 단락 ID 유니크화 (HWP 자동 복구 시 글자 겹침 방지)
- `mimetype`은 ZIP 첫 항목 + STORED 무압축
- 수식·표가 많은 과학 지문은 ElementTree 추출에서 일부 선지 누락 가능 → 답안지 정답 + 추정으로 보완

---

## 사용자 호칭·톤
- 친근한 반말톤 OK ("ㅇㅋㅇㅋ", "~네", "~구나")
- 과한 격식 X. 짧고 명료하게
