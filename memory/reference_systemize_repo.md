---
name: systemize 레포 — 교재 작업 레퍼런스 저장소
description: 해설/구문해설지 작업 시 반드시 참고할 GitHub 레포. 카테고리별 샘플 HWPX/PDF가 누적됨
type: reference
originSessionId: d59ed963-4383-48e9-9eca-4ac45eeb2f32
---
# 위치
- GitHub: https://github.com/insper0908-lab/systemize (public)
- 로컬: `/Users/a0000/.claude/projects/-Users-a0000/`
- 레포 루트의 `CLAUDE.md`가 작업 가이드

# 무엇이 들어있나
1. **`samples/` 하위 카테고리 폴더** — 사용자가 직접 업로드하는 샘플 자료
   - `samples/독서/{인문,사회,과학기술,예술}/`
   - `samples/문학/{고전시가,고전소설,현대시,현대소설,수필극}/`
   - 폴더는 점진적으로 생김 (없으면 사용자에게 묻거나 인접 카테고리 참고)
2. **`memory/`** — Claude 자동 메모리 전체 (워크플로/독해원칙/형식)
3. **세션 jsonl 로그** — auto_push.sh가 Stop 훅에서 자동 push

# 언제·어떻게 활용
- 사용자가 해설/구문해설지 작업 요청 → **먼저 지문 카테고리 판별** → `samples/[카테고리]/[세부]/` 의 같은 분류 샘플 1~2개 열어 톤·구조·해설 깊이 파악 → 작업
- 사용자가 "샘플 새로 올렸어" 등의 언급을 하면 해당 폴더 ls해서 확인
- 카테고리 폴더에 자료가 없으면 사용자에게 어떤 톤/구조를 따를지 묻기

# 주의
- public 레포라 외부 공개됨 — 민감 정보(특정 학생 이름 등) 커밋 금지
- 새 폴더 만들기보다 사용자가 올린 구조를 따라갈 것
