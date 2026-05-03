# systemize

Claude Code 작업 기록 자동 아카이브 — 프로젝트 디렉터리 `~/.claude/projects/-Users-a0000/` 의 메모리·세션 로그를 그대로 미러링합니다.

## 구조

- `MEMORY.md` — 메모리 인덱스 (Claude가 모든 대화에서 자동 로드)
- `memory/` — 개별 메모리 파일 (user / feedback / project / reference 타입)
- `*.jsonl` — 각 세션의 전체 대화 로그

## 자동화

세션 종료 시 `Stop` 훅이 자동으로 변경분을 커밋·푸시합니다.
